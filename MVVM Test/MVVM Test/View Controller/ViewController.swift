//
//  ViewController.swift
//  MVVM Test
//
//  Created by Muhammad Irfan Zafar on 10/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let viewModel = EmpolyeeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        bindUI()
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func bindUI() {
        viewModel.employeeList.bind() { _ in
            print("Reload Tableview Data")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func fetchDataAction(_ sender: Any) {
        viewModel.fetchEmployeData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as! EmployeeCell
        cell.setValues(for: viewModel.employeeList.value[indexPath.row])
        cell.backgroundColor = viewModel.employeeList.value[indexPath.row].isFavourite ? .yellow:.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.setFavourite(for: indexPath.row)
    }
}

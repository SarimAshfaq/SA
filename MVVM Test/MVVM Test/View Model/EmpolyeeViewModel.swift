//
//  EmpolyeeViewModel.swift
//  MVVM Test
//
//  Created by Muhammad Irfan Zafar on 10/6/20.
//

import Foundation

class EmpolyeeViewModel {
    private var employees = [Empolyee]() {
        didSet {
            employeeList.value = employees
        }
    }
    
    var employeeList: Box<[Empolyee]> = Box([Empolyee]())
    
    init() {
        
    }
}

extension EmpolyeeViewModel {
    
    func fetchEmployeData(){
        print("Fetching Data")
        let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = try? JSONSerialization.data(withJSONObject: [:], options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                guard let emp = (json["data"] as? [NSDictionary])?.map({ (dict) -> Empolyee in
                    return Empolyee(dict)
                }) else {
                    return
                }
                self.employeeList.value.append(contentsOf: emp)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
    
    func setFavourite(for index: Int) {
        employeeList.value[index].isFavourite = !employeeList.value[index].isFavourite
    }
}

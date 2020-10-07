//
//  EmployeeCell.swift
//  MVVM Test
//
//  Created by Muhammad Irfan Zafar on 10/7/20.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(for employee: Empolyee){
        nameLbl.text = employee.employeeName
        ageLbl.text = ""
        salaryLbl.text = ""
    }

}

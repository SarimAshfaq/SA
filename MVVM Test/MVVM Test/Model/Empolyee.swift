//
//  Empolyee.swift
//  MVVM Test
//
//  Created by Muhammad Irfan Zafar on 10/6/20.
//

import Foundation

// MARK: - Empolyee
struct Empolyee {
    var id: Int = 0
    var employeeName: String = ""
    var employeeSalary: Int = 0
    var employeeAge: Int = 0
    var profileImage: String = ""
    var isFavourite: Bool = false
    
    init() {
        id = 0
        employeeName = ""
        employeeSalary = 0
        employeeAge = 0
        profileImage = ""
    }
    
    init(_ dict: NSDictionary) {
        id = dict["id"] as? Int ?? 0
        employeeName = dict["employee_name"] as? String ?? ""
        employeeSalary = dict["employee_salary"] as? Int ?? 0
        employeeAge = dict["employee_age"] as? Int ?? 0
        profileImage = dict["profile_image"] as? String ?? ""
    }
}

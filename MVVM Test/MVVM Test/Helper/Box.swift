//
//  Box.swift
//  MVVM Test
//
//  Created by Muhammad Irfan Zafar on 10/6/20.
//

import UIKit

class Box<T> {
    typealias Listner = (T) -> Void
    var listner: Listner?
    var value: T {
        didSet{
            listner?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listner: Listner?) {
        self.listner = listner
        listner?(value)
    }
}

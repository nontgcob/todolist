//
//  TodoItem.swift
//  todolist
//
//  Created by Nont on 15/6/2567 BE.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    var name: String
    var isCheck: Bool = false
    var dueDate: Date
    
    init(name: String = "", dueDate: Date = Date.now) {
        self.name = name
        self.dueDate = dueDate
    }
}



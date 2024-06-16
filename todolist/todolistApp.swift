//
//  todolistApp.swift
//  todolist
//
//  Created by Nont on 15/6/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct todolistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}

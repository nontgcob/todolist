//
//  ContentView.swift
//  todolist
//
//  Created by Nont on 15/6/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var todos: [TodoItem]
    @State var showAddToDoSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos){ item in
                    TodoRowItem(item: item)
                }.onDelete{
                    indexSet in for index in indexSet {
                        context.delete(todos[index])
                        try! context.save()
                    }
                }
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("Reminders")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add"){
                        showAddToDoSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showAddToDoSheet, content: {
                AddTodoSheet()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            })
        }
    }
}

#Preview {
    ContentView()
}

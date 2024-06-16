//
//  AddTodoSheet.swift
//  todolist
//
//  Created by Nont on 15/6/2567 BE.
//

import SwiftUI

struct AddTodoSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State var newItem = TodoItem()
    var body: some View {
        NavigationStack{
            List{
                TextField("name", text: $newItem.name)
                DatePicker("date", selection: $newItem.dueDate, displayedComponents: .date)
            }
            .navigationTitle("Add To Do")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("close"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("add"){
                        context.insert(newItem)
                        try! context.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    AddTodoSheet()
//}

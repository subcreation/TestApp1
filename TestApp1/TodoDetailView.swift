//
//  TodoDetailView.swift
//  TestApp1
//
//  Created by Nathanael Roberton on 6/11/24.
//

import SwiftUI

struct TodoDetailView: View {
    @Bindable var todo: Todo
    
    var body: some View {
        VStack {
            TextField("new todo", text: $todo.name)
                .textFieldStyle(.roundedBorder)
            
            Toggle(todo.isDone ? "Done" : "Open", isOn: $todo.isDone)
        }
        .padding()
    }
}

#Preview {
    TodoDetailView(todo: Todo(name: "new"))
}

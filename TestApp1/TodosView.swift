//
//  ContentView.swift
//  TestApp1
//
//  Created by Nathanael Roberton on 6/10/24.
//

import SwiftUI
import SwiftData

struct TodosView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]

    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        Text("Item at \(todo.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(todo.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteTodos)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addTodo) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            
            Text("Select an item")
        }
    }

    private func addTodo() {
        withAnimation {
            let newTodo = Todo(name: "new")
            modelContext.insert(newTodo)
        }
    }

    private func deleteTodos(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    TodosView()
        .modelContainer(for: Todo.self, inMemory: true)
}

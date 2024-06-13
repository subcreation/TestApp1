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
    @State var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        TodoDetailView(todo: todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(todo.isDone ? .green : .gray)
                            Text(todo.name)
                        }
                    }
                }
                .onDelete(perform: deleteTodos)
            }
            .searchable(text: $searchText, placement: .automatic, prompt: "search")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .listStyle(.inset)
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

//
//  SidebarView.swift
//  TestApp1
//
//  Created by Nathanael Roberton on 6/10/24.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        #if os(macOS)
        NavigationView {
            List {
                NavigationLink(destination: TodosView()) {
                    Label("Todos", systemImage: "checklist")
                }
                NavigationLink(destination: Text("Social")) {
                    Label("Social", systemImage: "person.3")
                }
                NavigationLink(destination: Text("Settings")) {
                    Label("Settings", systemImage: "gear")
                }
            }
            
            TodosView()
        }
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItem {
                // Hack to maintain header height across navigation
                Button(action: {}) {
                    Label("Add Item", systemImage: "plus")
                }
                .opacity(0.0)
            }
        }
        #else
        TabView {
            Tab("Items", image: "pencil.and.list.clipboard") {
                ItemsView()
            }
            Tab("Social", image: "person.3") {
                Text("Social")
            }
            Tab("Settings", image: "gear") {
                Text("Settings")
            }
        }
        #endif
    }
}

#Preview {
    SidebarView()
}

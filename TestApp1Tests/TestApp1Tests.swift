//
//  TestApp1Tests.swift
//  TestApp1Tests
//
//  Created by Nathanael Roberton on 6/10/24.
//

import XCTest
import SwiftUI
@testable import TestApp1

class TestApp1Tests: XCTestCase {

    func testTodoInitialization() {
        let todo = Todo(name: "Test Todo", isDone: false, priority: 1)
        XCTAssertEqual(todo.name, "Test Todo")
        XCTAssertEqual(todo.isDone, false)
        XCTAssertEqual(todo.priority, 1)
    }

    func testTodoToggleIsDone() {
        let todo = Todo(name: "Test Todo")
        todo.isDone.toggle()
        XCTAssertTrue(todo.isDone)
    }
}

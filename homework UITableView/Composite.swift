//
//  Composite.swift
//  homework UITableView
//
//  Created by Ilya Pogozhev on 09.07.2023.
//

import Foundation

protocol Component {
    var title: String { get set }
    func description()
}
class Task: Component {
    var title: String
    var tasks: [Component]
    
    init(title: String, tasks: [Component]) {
        self.title = title
        self.tasks = tasks
    }
    func description() {
        print("Задача - \(title)")
        for task in tasks {
            task.description()
        }
    }
}
class SubTask: Component {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    func description() {
        print("Подзадача - \(title)")
    }
}

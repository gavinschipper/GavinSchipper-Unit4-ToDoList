//
//  ToDo.swift
//  ToDoList
//
//  Created by Gavin Schipper on 21-11-17.
//  Copyright © 2017 Gavin Schipper. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Blablabla")
        let todo2 = ToDo(title: "ToDo Two", isComplete: true, dueDate: Date(), notes: "Bliblibli")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Blublublu")
        
        return [todo1, todo2, todo3]
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func loadToDos() -> [ToDo]?  {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self,from: codedToDos)
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        print(todos.description)
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)

        print("saved")
    }

}



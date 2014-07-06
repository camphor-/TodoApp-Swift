//
//  TodoDataSource.swift
//  todoapp
//
//  Created by Hirose Tatsuya on 2014/07/06.
//  Copyright (c) 2014年 Tatsuya Hirose. All rights reserved.
//

import UIKit

struct TODO {
    var title : String
}

class TodoDataManager {
    
    let STORE_KEY = "TodoDataManager.store_key"
    
    class var sharedInstance : TodoDataManager {
        struct Static {
            static let instance : TodoDataManager = TodoDataManager()
        }
        return Static.instance
    }
    
    var todoList: [TODO]
    
    var size : Int {
        return todoList.count
    }
    
    subscript(index: Int) -> TODO {
        return todoList[index]
    }

    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.objectForKey(self.STORE_KEY) as? [String] {
            self.todoList = data.map { title in
                TODO(title: title)
            }
        } else {
            self.todoList = []
        }
    }
    
    class func validate(todo: TODO!) -> Bool {
        return todo.title != nil && todo.title != ""
    }
    
    func save() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let data = self.todoList.map { todo in
            todo.title
        }
        defaults.setObject(data, forKey: self.STORE_KEY)
    }
    
    func create(todo: TODO!) -> Bool {
        if TodoDataManager.validate(todo) {
            self.todoList += todo
            self.save()
            return true
        }
        return false
    }
    
    func update(todo: TODO!, at index: Int) -> Bool {
        if(index >= self.todoList.count) {
            return false
        }
        
        if TodoDataManager.validate(todo) {
            self.todoList[index] = todo
            self.save()
            return true
        }
        return false
    }
    
    func remove(index: Int) -> Bool {
        if(index >= self.todoList.count) {
            return false
        }
        
        self.todoList.removeAtIndex(index)
        self.save()
        
        return true
    }
}

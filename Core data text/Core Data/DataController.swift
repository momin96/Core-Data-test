//
//  DataController.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    private var persistantContainer = NSPersistentContainer(name: "UserLiberary")
    
    static var shared = DataController()
    
    var context: NSManagedObjectContext {
        return persistantContainer.viewContext
    }
    
    init() {
        initlize()
    }
    
    func initlize() {
        
        persistantContainer.loadPersistentStores { (storeDescription, err) in
            if let e = err {
                print(e.localizedDescription)
                return
            }
            
            print("Store loaded")
        }
    }
    
    
    func inser(user u: User, withBook b: Book? = nil) throws {
    
        if let book = b {
            u.addToBooks(book)
        }
        
        self.context.insert(u)
        try self.context.save()
    }
    
    func fetchUsers() throws -> [User] {
        let users = try context.fetch(User.fetchRequest() as NSFetchRequest<User>)
        return users
    }
    
    func fetchUsers(withName name: String) throws -> [User] {
        
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "firstName == %@", name)
        
        let users = try context.fetch(request)
        return users
    }
    
    func update(user u: User, withName name: String) throws {
        u.firstName = name
        try context.save()
    }
    
    func remove(user u: User) throws {
        context.delete(u)
        try context.save()
    }
    
    
    
}

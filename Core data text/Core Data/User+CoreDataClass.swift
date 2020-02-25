//
//  User+CoreDataClass.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

    class func createUser(withUserName un: String, firstName fn: String, lastName ln: String, context: NSManagedObjectContext) -> User {
    
        let u = User(context: context)
        u.firstName = fn
        u.username = un
        u.lastName = ln
    
        return u
    }
    
}


//
//  ViewController.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataController = DataController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5 {
            
            
            let u = User(context: dataController.context)
            u.firstName = "Nasir \(i)"
            u.lastName = "Momin \(i)"
            u.username = "momin96 \(i)"
            
            let b = Book(context: dataController.context)
            b.title = "A1 \(i)"
            
            do {
                try dataController.inser(user: u, withBook: b)
            }
            catch (let err) {
                print(err.localizedDescription)
            }
        }
        
        print("------\nUsers")
        do {
            let user = try dataController.fetchUsers()
            print(user)
        }
        catch (let e) {
            print(e.localizedDescription)
        }
    }


}


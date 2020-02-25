//
//  ViewController.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    var dataController = DataController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        for i in 1...5 {
        //
        //
        //            let u = User(context: dataController.context)
        //            u.firstName = "Ayesh \(i)"
        //            u.lastName = "Momin \(i)"
        //            u.username = "Ayes \(i)"
        //
        //            let b = Book(context: dataController.context)
        //            b.title = "A1 \(i)"
        //
        //            do {
        //                try dataController.inser(user: u, withBook: b)
        //            }
        //            catch (let err) {
        //                print(err.localizedDescription)
        //            }
        //        }
        
        //        print("------\nUsers")
        //        do {
        //            let user = try dataController.fetchUsers()
        //            print(user)
        //        }
        //        catch (let e) {
        //            print(e.localizedDescription)
        //        }
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        
        let u = username.text ?? "Default"
        let f = firstname.text ?? "Default"
        let l = lastname.text ?? "Default"
        
        
        
        let user = User.createUser(withUserName: u, firstName: f, lastName: l, context: dataController.context)
        
        do {
            try dataController.inser(user: user)
            
            UIAlertController.showSuccess(on: self, title: "Success", message: "Data Saved Successfully!!!")
        }
        catch (let e) {
            print(e.localizedDescription)
            UIAlertController.showSuccess(on: self, title: "Failed", message: "Some thing went wrong!!!")

        }
        
        username.clear()
        firstname.clear()
        lastname.clear()
        
    }
    
    @IBAction func show(_ sender: UIButton) {
        performSegue(withIdentifier: "ListController", sender: sender)
    }
}


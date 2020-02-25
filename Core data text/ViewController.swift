//
//  ViewController.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataManipulator {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func create() -> ViewController {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        return vc
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
            UIAlertController.showSuccess(on: self, title: "Failed", message: e.localizedDescription)

        }
        
        username.clear()
        firstname.clear()
        lastname.clear()
        
    }
    
    @IBAction func show(_ sender: UIButton) {
        performSegue(withIdentifier: "ListController", sender: sender)
    }
}


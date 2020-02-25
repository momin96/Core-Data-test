//
//  ListController.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import Foundation
import UIKit

class ListController: UIViewController {
    
    var dataController = DataController.shared
    
    var userDataSource = UserDataSource<User>()
    var userDelegate = UserDelegate<User>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = userDataSource
        userDelegate.weakController = self
        tableView.delegate = userDelegate
        
        UserCell.register(with: tableView)
        
        do {
            let users = try dataController.fetchUsers()
            print(users)
            
            userDataSource.data = users
            tableView.reloadData()

        }
        catch (let e) {
            print(e.localizedDescription)
        }
    }
}

class UserCell: UITableViewCell {
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func register(with tableView: UITableView) {
        let nib = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserList")
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserList")

    }
    
    func configure(user u: User) {
        self.username.text = u.username
        self.firstname.text = u.firstName
        self.lastname.text = u.lastName
    }
    
}

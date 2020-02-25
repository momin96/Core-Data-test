//
//  DataSource.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import Foundation
import UIKit

let CELL_IDENTIFIER = "UserList"

class GenericDataSource<T>: NSObject {
    var data: [T]?
}

class UserDataSource<T>: GenericDataSource<T>, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userCell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! UserCell
        let user = data?[indexPath.row] as! User
        userCell.configure(user: user)
        return userCell
        
    }
}

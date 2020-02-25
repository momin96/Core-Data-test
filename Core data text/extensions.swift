//
//  extensions.swift
//  Core data text
//
//  Created by Nasir Ahmed Momin on 25/02/20.
//  Copyright © 2020 Nasir Ahmed Momin. All rights reserved.
//

import Foundation
import UIKit

protocol DataManipulator {

}
extension DataManipulator {
    var dataController: DataController {
        return DataController.shared
    }
}

extension UITextField {
    func clear () {
        self.text = ""
    }
}


extension UIAlertController {
    
    static func showSuccess(on controller: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
}

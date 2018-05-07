//
//  BaseViewController.swift
//  mashro3k
//
//  Created by Mona Noaman on 5/7/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertWithMessage(msg:String){
        let alert = UIAlertController(title: NSLocalizedString("app name", comment: ""), message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

}

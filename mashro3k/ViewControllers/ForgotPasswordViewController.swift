//
//  ForgotPasswordViewController.swift
//  mashro3k
//
//  Created by Mona Noaman on 5/12/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //addBoraders
        Animation.borderView(emailTextField, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        emailTextField.setLeftPaddingPoints(20)
     
    }

    @IBAction func resetPass(_ sender: Any) {
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    

}

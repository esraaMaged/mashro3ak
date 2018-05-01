//
//  LoginViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 5/1/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mailTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //addBoraders
        Animation.borderView(mailTxtFld, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: mailTxtFld, withAngle: 14)
        
        Animation.borderView(pwdTxtFld, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: pwdTxtFld, withAngle: 14)
        
        Animation.roundCorner(for: loginBtn, withAngle: 14)

        
        //add padding
        mailTxtFld.setLeftPaddingPoints(20)
        pwdTxtFld.setLeftPaddingPoints(20)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - outlets
    
    @IBAction func forgotPwdBtn(_ sender: Any)
    {
    }
    
    @IBAction func loginBtn(_ sender: Any)
    {
    }
    
    @IBAction func signUpBtn(_ sender: Any)
    {
    }
    
    @IBAction func bkBtn(_ sender: Any)
    {
        dismiss(animated: false, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - for padding


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
   
}

//
//  LoginViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 5/1/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit
import FirebaseDatabase


class LoginViewController: BaseViewController {

    @IBOutlet weak var mailTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUI()

    }
    
    private func setUI(){
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
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

   
    // MARK: - outlets
    
    @IBAction func forgotPwdBtn(_ sender: Any)
    {
    }
    
    @IBAction func loginBtn(_ sender: Any)
    {
        if mailTxtFld.text == "" || pwdTxtFld.text == "" || !isValidEmail(testStr: mailTxtFld.text!){
            self.showAlertWithMessage(msg: NSLocalizedString("Empty login error", comment: ""))
        }else{
            AuthenticationHandler().loginWithEmail(email: mailTxtFld.text!, password: pwdTxtFld.text!, success: { user in
                    print(user)
                UserDefaults.standard.set(user.id, forKey: "uid")
                self.pushHome()
                }, fail: { error in
                    print(error)
            })
        }
    }
    
    @IBAction func signUpBtn(_ sender: Any)
    {
    }
    
    private func pushHome(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
//    @IBAction func bkBtn(_ sender: Any)
//    {
//        dismiss(animated: false, completion: nil)
//    }


}

func fillData(){
    if let path = Bundle.main.path(forResource: "data", ofType: "json") {
        let peoplesArray = try! JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: path)), options: JSONSerialization.ReadingOptions()) as? [Any]
        
        var count = 0
        var ref: DatabaseReference!
        ref = Database.database().reference()
        for peopleDict in peoplesArray! {
            
            if let dict = peopleDict as? [String: String] {
                ref.child("cities").child("\(count)").setValue(dict)

                count = count + 1
            }
        }
        
    }
}
// MARK: - for padding


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
   
}

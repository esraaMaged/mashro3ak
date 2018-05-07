//
//  RegistrationViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 5/7/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController {

    @IBOutlet weak var nameTxtFlf: UITextField!
    @IBOutlet weak var mailTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    @IBOutlet weak var phoneTxtFld: UITextField!
    @IBOutlet weak var confrimPwdTxtFld: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
       
    }

    // MARK: - inApp
    private func setUI(){

        self.title = "Sign In"
        //addBoraders
        Animation.borderView(nameTxtFlf, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: nameTxtFlf, withAngle: 14)
        
        Animation.borderView(mailTxtFld, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: mailTxtFld, withAngle: 14)
        
        Animation.borderView(pwdTxtFld, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: pwdTxtFld, withAngle: 14)
        
        Animation.borderView(confrimPwdTxtFld, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: confrimPwdTxtFld, withAngle: 14)
        
        Animation.borderView(phoneTxtFld, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: phoneTxtFld, withAngle: 14)
        
        
        Animation.roundCorner(for: signInBtn, withAngle: 14)
    }
    
    
    // MARK: - Actions

    @IBAction func signInBtn(_ sender: Any) {
    }
    
    @IBAction func logInBtn(_ sender: Any)
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

//
//  RegistrationViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 5/7/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit
import DropDown

class RegistrationViewController: BaseViewController {

    @IBOutlet weak var nameTxtFlf: UITextField!
    @IBOutlet weak var mailTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    @IBOutlet weak var phoneTxtFld: UITextField!
    @IBOutlet weak var confrimPwdTxtFld: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var countryDropDown: UIButton!
    
    let dropDown = DropDown()
    var cititesArr = [Cities()]
    var selectedCityIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        getCitiesService()
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
        
        Animation.borderView(countryDropDown, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: countryDropDown, withAngle: 14)
        
        Animation.roundCorner(for: signInBtn, withAngle: 14)
        

        nameTxtFlf.setLeftPaddingPoints(20)
        mailTxtFld.setLeftPaddingPoints(20)
        pwdTxtFld.setLeftPaddingPoints(20)
        phoneTxtFld.setLeftPaddingPoints(20)
        confrimPwdTxtFld.setLeftPaddingPoints(20)

        
    }
    // MARK: - dropDown

    private func setDropDown(cityNames :  [String]){
        // The view to which the drop down will appear on
        dropDown.anchorView = countryDropDown // UIView or UIBarButtonItem
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = cityNames
        dropDown.selectRow(0)
        self.countryDropDown.setTitle(dropDown.selectedItem, for: .normal)
        
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.countryDropDown.setTitle(item, for: .normal)
            self?.selectedCityIndex = index
            
        }
    }
    
    // MARK: - Actions

    @IBAction func signInBtn(_ sender: Any) {
        
        //validation
        
        if !hasNoFieldsEmpty()
        {
            self.showAlertWithMessage(msg: NSLocalizedString("hasEmptyFields", comment: ""))
        }
        else if !isValidEmail()
        {
            self.showAlertWithMessage(msg: NSLocalizedString("emailNotCorrect", comment: ""))
        }
        else if !isValidPhone()
        {
            self.showAlertWithMessage(msg: NSLocalizedString("phoneNotCorrect", comment: ""))
        }
        else if !isValidPwd()
        {
            self.showAlertWithMessage(msg: NSLocalizedString("passwordNotMatching", comment: ""))
        }
        else if !isMatchingPwd()
        {
            self.showAlertWithMessage(msg: NSLocalizedString("passwordMustBe6Letters", comment: ""))
        }
       
        else
        {
            startLoading()
            AuthenticationHandler().registerWithEmail(email: mailTxtFld.text!, password: pwdTxtFld.text!, success: { user in
                print(user)
                let userDict : [String : String] = ["id": user,
                                                    "name": self.nameTxtFlf.text!,
                                                    "email": self.mailTxtFld.text!,
                                                    "imageUrl": "",
                                                    "phoneNumber": self.phoneTxtFld.text!,
                                                    "countryCode": self.cititesArr[self.selectedCityIndex].code ?? "0",
                                                    "country": self.cititesArr[self.selectedCityIndex].name ?? "eg"]
                
                AuthenticationHandler().register(usersDict: userDict, id: user, success: { user in
                    print(user)
                    self.stopLoading()
                    self.showAlertWithMessage(msg: NSLocalizedString("userRegistered", comment: ""))
                   // TODO: redirect to mainPage
                }, fail: { error in
                    print(error)
                    self.stopLoading()
                    self.showAlertWithMessage(msg: NSLocalizedString("NetworkError", comment: ""))

                })

            }, fail: { error in
                print(error)
                self.stopLoading()
                self.showAlertWithMessage(msg: NSLocalizedString("NetworkError", comment: ""))

            })
        } 
    }
    
    @IBAction func logInBtn(_ sender: Any)
    {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func dropDownBtn(_ sender: Any) {
        dropDown.show()
    }
    
    // MARK: - Validation
    func hasNoFieldsEmpty() -> Bool{

        if (nameTxtFlf.text != "") &&  (mailTxtFld.text != "" ) && (pwdTxtFld.text != "") && (confrimPwdTxtFld.text != "")
            && (phoneTxtFld.text != ""){
            return true
        }
        return false
    }

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: mailTxtFld.text!)
    }
    func isValidPwd() -> Bool {
        let pwdtxt = pwdTxtFld.text!
        if pwdtxt.count >=  6
        {
            return true
        }
        else if pwdtxt == confrimPwdTxtFld.text
        {
            return true
        }
        return false
    }
    func isMatchingPwd() -> Bool {
        if pwdTxtFld.text! == confrimPwdTxtFld.text
        {
            return true
        }
        return false
    }
    func isValidPhone() -> Bool {
        let telefonRegex = "\\A[0-9]{12}\\z"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", telefonRegex)
        return phoneTest.evaluate(with: phoneTxtFld.text!)
    }
    
    // MARK: - Service
    
    private func getCitiesService()
    {
        startLoading()
        AuthenticationHandler().getCountries(success:{ cities in
            self.stopLoading()
            self.handleCities(cities: cities)
        }, fail: { error in
            print(error)
            self.stopLoading()
            self.dismiss(animated: true, completion: nil)
            self.showAlertWithMessage(msg: NSLocalizedString("NetworkError", comment: ""))
        })
    }
    private func handleCities(cities : [Cities])
    {
        cititesArr = cities
        var citiesNames = [String]()
        for i in cititesArr {
            citiesNames.append(i.name ?? "")
        }
        self.setDropDown(cityNames: citiesNames)
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

//
//  StartPageViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 5/1/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class StartPageViewController: UIViewController {

    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var abtUsBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //addBoraders
        Animation.borderView(loginBtn, withBorderColor: .white, andWidth: 2)
        Animation.roundCorner(for: loginBtn, withAngle: 14)
        
        Animation.borderView(signUpBtn, withBorderColor: .white, andWidth: 2)
        Animation.roundCorner(for: signUpBtn, withAngle: 14)
        
        Animation.borderView(abtUsBtn, withBorderColor: .white, andWidth: 2)
        Animation.roundCorner(for: abtUsBtn, withAngle: 14)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Actions

}

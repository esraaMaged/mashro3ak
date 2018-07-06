//
//  ProfileViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 7/2/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet weak var profileImgV: UIImageView!
    @IBOutlet weak var addImageBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ideaLbl: UILabel!
    @IBOutlet weak var challengesLbl: UILabel!
    @IBOutlet weak var publisherLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var birthdayLbl: UILabel!
    @IBOutlet weak var cardView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUI()
    }
    // MARK: - inAppMethods
    private func setUI(){
        self.title = "Profile"
        //addBoraders
        Animation.borderView(cardView, withBorderColor: hexStringToUIColor(hex: lIGHT_GRAY_COLOR), andWidth: 2)
        Animation.roundCorner(for: cardView, withAngle: 10)
    }
    
    // MARK: - Actions

    @IBAction func addImgV(_ sender: Any) {
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

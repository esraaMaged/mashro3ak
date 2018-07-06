//
//  IdeaViewController.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 5/12/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit

class IdeaViewController: BaseViewController {

    @IBOutlet weak var ideaView: UIView!
    @IBOutlet weak var ideaTxtFld: UITextField!
    
    @IBOutlet weak var challengeView: UIView!
    @IBOutlet weak var challengeTxtFld: UITextField!
    
    @IBOutlet weak var shareBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    // MARK: - inAppMethods
   
    private func setUI(){
        
        self.title = "Share your idea"
        //addBoraders
        Animation.borderView(ideaView, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: ideaView, withAngle: 14)
        
        Animation.borderView(challengeView, withBorderColor: hexStringToUIColor(hex: BLUE_COLOR), andWidth: 2)
        Animation.roundCorner(for: challengeView, withAngle: 14)
        
        Animation.roundCorner(for: shareBtn, withAngle: 14)
    }
    // MARK: - Actions
    @IBAction func shareBtn(_ sender: Any) {
        //validation
        if !hasNoFieldsEmpty()
        {
            self.showAlertWithMessage(msg: NSLocalizedString("hasEmptyFields", comment: ""))
        }
        //
        else{
            shareIdeaService()
        }
        
    }
    
    // MARK: - Validation
    func hasNoFieldsEmpty() -> Bool{
        
        if (ideaTxtFld.text != "") &&  (challengeTxtFld.text != "" ) {
            return true
        }
        return false
    }
    // MARK: - Service

    func shareIdeaService() {
        /*
         country:
         "Afghanistan"
         countryCode:
         93
         createdAt:
         -5
         idea:
         "لبب"
         ideaId:
         "-L0UP_kdSBzWRjrzefWm"
         likeCount:
         2
         needs:
         "لللل"
         userId:
         "u72O66MhUXQT4KDA3kGccuEfQlE3"
         userName:
         "ali2"

 */
        
        let ideaDict : [String : String] = [ "country" : ""
        ]
        
        AuthenticationHandler().addIdeas(ideaDict: ideaDict, id: "jcyNzdhbvDaZ9fqlKH2akM9ldRN2", success: { user in
            self.stopLoading()
            self.showAlertWithMessage(msg: NSLocalizedString("ideaShared", comment: ""))
            // TODO: redirect to mainPage
        }, fail: { error in
            print(error)
            self.stopLoading()
            self.showAlertWithMessage(msg: NSLocalizedString("NetworkError", comment: ""))
            
        })

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

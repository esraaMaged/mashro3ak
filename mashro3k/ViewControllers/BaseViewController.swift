//
//  BaseViewController.swift
//  mashro3k
//
//  Created by Mona Noaman on 5/7/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController , NVActivityIndicatorViewable {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: BLUE_COLOR)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

    }
    
    // MARK: - alert
    func showAlertWithMessage(msg:String){
        let alert = UIAlertController(title: NSLocalizedString("app name", comment: ""), message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    // MARK: - loading
    func startLoading()
    {
        let size = CGSize(width: 30, height:30)
        startAnimating(size, message: "", type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white ,minimumDisplayTime: 3)
        
    }
    func stopLoading()
    {
        stopAnimating()
        
    }

}

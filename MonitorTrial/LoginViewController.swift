//
//  LoginViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    @IBOutlet weak var btnSignIn:UIButton!
    @IBOutlet weak var btnCreateAccount:UIButton!
    @IBOutlet weak var curvedCardView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curveUIElements(Views: btnSignIn.layer,btnCreateAccount.layer,txtPassword.layer,txtUsername.layer,curvedCardView.layer)
        
        borderElements(Views: txtUsername.layer,txtPassword.layer,btnCreateAccount.layer)
        
        
        // Do any additional setup after loading the view.
    }
    

    func curveUIElements(Views: CALayer...){
        for view in Views{
            view.cornerRadius = 15
        }
    }
    
    func borderElements(Views: CALayer...){
        for view in Views{
            view.borderWidth = 1
        }
    }
    
    @IBAction func handleBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

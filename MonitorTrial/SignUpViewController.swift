//
//  SignUpViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 02/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var curveCardItem: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curveUIElements(Views: txtPhoneNumber.layer,txtEmail.layer,txtFullName.layer,txtPassword.layer,btnSignUp.layer,curveCardItem.layer)
        
        borderElements(Views: txtPassword.layer,txtFullName.layer,txtEmail.layer,txtPhoneNumber.layer)
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
    @IBAction func handleBack(_ sender: Any) {
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

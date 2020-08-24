//
//  LoginViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RealmSwift
import PKHUD

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
        spaceTextFields(Views: txtPassword,txtUsername)
        
        // Do any additional setup after loading the view.
    }
    

    func curveUIElements(Views: CALayer...){
        for view in Views{
            view.cornerRadius = 5
        }
    }
    
    func borderElements(Views: CALayer...){
        for view in Views{
            view.borderWidth = 1
        }
    }
	
	func spaceTextFields(Views: UITextField...){
        for view in Views{
			let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
			view.leftViewMode = .always
			view.leftView = spacerView
        }
    }
    
    @IBAction func handleBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleLogin(_ sender: Any) {
        
		let config = Realm.Configuration(
			// Set the new schema version. This must be greater than the previously used
			// version (if you've never set a schema version before, the version is 0).
			schemaVersion: 2,

			// Set the block which will be called automatically when opening a Realm with
			// a schema version lower than the one set above
			migrationBlock: { migration, oldSchemaVersion in
				// We haven’t migrated anything yet, so oldSchemaVersion == 0
				if (oldSchemaVersion < 2) {
					// Nothing to do!
					// Realm will automatically detect new properties and removed properties
					// And will update the schema on disk automatically
				}
			})

		// Tell Realm to use this new configuration object for the default Realm
		Realm.Configuration.defaultConfiguration = config
		
		if !(txtUsername.text!.isEmpty || txtPassword.text!.isEmpty){
			do{
				let myRealm = try Realm()
				let monitorUserArray = myRealm.objects(MonitorTrialUsers.self)
				let containsUser = monitorUserArray.first(where: {
					element in element.EmailAddress == txtUsername.text! && txtPassword.text! == element.Password
				})
				
				if let containsUser =  containsUser{
					let storyboard = UIStoryboard(name: "Main", bundle: nil)
					HelperClass.userEmailAddres = txtUsername.text!
					let ExploreTab = storyboard.instantiateViewController(withIdentifier: "ExploreTab")
					let ExploreVC = storyboard.instantiateViewController(withIdentifier: "ExploreVC") as! ExploreViewController
					HelperClass.sentIndex = Int(containsUser.SelectIExplorendex ?? "0")!
					ExploreTab.modalPresentationStyle = .fullScreen
					
					self.present(ExploreTab, animated: true, completion: nil)

					
				}else{
					HUD.flash(.label("Username and Password do not match"),delay: 1)
					return
				}
				
//				if containsUser != nil{
//
//				}
				
				
			}catch(let error){
				print(error.localizedDescription)
			}
		}else{
			HelperClass.showFillAllfields()
		}
		
        
        
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

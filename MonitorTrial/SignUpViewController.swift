//
//  SignUpViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 02/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RealmSwift
import PKHUD

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
        
        borderElements(Views: txtPassword,txtFullName,txtEmail,txtPhoneNumber)
        
        //setupRealm()
        // Do any additional setup after loading the view.
    }
    
	func createNewUser(fullname:String, emailAddress:String, phoneNumber:String, password:String, completionsHAndler:@escaping ()-> Void){
        print("K")
        print("K")

        do{
			let migrationBlock: MigrationBlock = { migration, oldSchemaVersion in
				//Leave the block empty
			}
			Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 2, migrationBlock: migrationBlock)
            let realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
			
			let resuls = realm.objects(MonitorTrialUsers.self)
			//print(resuls[1].Name!)
			
			let containsEmail = resuls.contains(where: {
				element in element.EmailAddress == emailAddress
			})
			
			let containsPhoneNumber = resuls.contains(where: {
				element in element.PhoneNumber == phoneNumber
			})
			
			if containsPhoneNumber{
				HUD.flash(.label("Phone Number Already Exists"),delay: 1)
			}else if containsEmail{
				HUD.flash(.label("Email Addres  Already Exists"),delay: 1)
			}else{
				let samplePErson = MonitorTrialUsers()
				samplePErson.Name = fullname
				samplePErson.EmailAddress = emailAddress
				samplePErson.PhoneNumber = phoneNumber
				samplePErson.Password = password
				
				try realm.write({
					realm.add(samplePErson)
				})
				completionsHAndler()
			}
        }catch(let erro){
            print(erro.localizedDescription)
        }
    }
    
    func curveUIElements(Views: CALayer...){
        for view in Views{
            view.cornerRadius = 5
        }
    }
    
    func borderElements(Views: UITextField...){
        for view in Views{
			let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
			view.leftViewMode = .always
			view.leftView = spacerView
			view.layer.borderWidth = 1
        }
    }
    @IBAction func handleBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func handleSignUp(_ sender: Any) {
        
		if !(txtFullName.text!.isEmpty || txtEmail.text!.isEmpty || txtPhoneNumber.text!.isEmpty || txtPassword.text!.isEmpty){
			
			createNewUser(fullname: txtFullName.text!, emailAddress: txtEmail.text!, phoneNumber: txtPhoneNumber.text!, password: txtPassword.text!, completionsHAndler: {
				let storyboard = UIStoryboard(name: "Main", bundle: nil)
				HelperClass.userEmailAddres = self.txtEmail.text!
				let options = storyboard.instantiateViewController(withIdentifier: "OptionNav")
				options.modalPresentationStyle = .fullScreen
				options.modalTransitionStyle  = .crossDissolve
				self.present(options, animated: true, completion: nil)
				
			})
			
			
		}else{
			HelperClass.showFillAllfields()
		}
		
		
        
        
    }
}

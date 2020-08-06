//
//  SettingsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var expertise = [Dictionary<String,Any>]()
    @IBOutlet weak var tblSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
		//navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        tblSettings.delegate = self
        tblSettings.dataSource = self
		tblSettings.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        createArray()
		//tblSettings.estimatedRowHeight = 60
		tblSettings.tableFooterView = UIView()
		tblSettings.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    func createArray(){
        expertise.append(["title":"App","values":["Security","Accounts","Notifications","Face ID"]])
        expertise.append(["title":"About","values":["Terms of Use","Privacy Policy"]])
        expertise.append(["title":"","values":["Logout"]])

    }
    
    @IBAction func handleEditProfile(_ sender: Any) {
        let editProfView = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        editProfView.modalPresentationStyle = .fullScreen
        present(editProfView, animated: true, completion: nil)
    }
    
    
    
}

extension SettingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expertise.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let coderNames = expertise[section]["values"] as? [String] else{
            return 0
        }
        return coderNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSettings.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        //cell.mainLabel.isHidden = true
        guard let coderNames = expertise[indexPath.section]["values"] as? [String] else{
            return cell
        }
        cell.mainLabel?.text = coderNames[indexPath.row]
		if indexPath.section == 0{
			cell.accessoryType = .disclosureIndicator
			if indexPath.row == 0 {
				cell.myImage.image = UIImage(named: "Privacy")
			}
			if indexPath.row == 1{
				cell.myImage.image = UIImage(named: "Accounts")
			}
			if indexPath.row == 2{
				cell.myImage.image = UIImage(named: "smallNotification")
			}
			if indexPath.row == 3{
				cell.myImage.image = UIImage(named: "Facial Rec")
			}
		}
		if indexPath.section == 2 && indexPath.row == 0{
			cell.mainLabel.textColor = .red
			cell.myImage.image = UIImage(named: "logout")
		}
		if indexPath.section == 0 && indexPath.row == 3{
			cell.mySwitch.isHidden = false
			cell.accessoryType = .none
		}
		//cell.selectionStyle = .none
        return cell
    }
    
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tblSettings.deselectRow(at: indexPath, animated: true)
		if indexPath.section == 0 && indexPath.row == 0{
			let securityView = SecurityViewController(nibName: "SecurityViewController", bundle: nil)
			securityView.modalPresentationStyle = .fullScreen
			present(securityView, animated: true, completion: nil)
		}
	}
	
	
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tblSettings.frame.size.width, height: 50.0))
        sectionView.backgroundColor = .white
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tblSettings.frame.size.width, height: 50.0))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let stringTitle = expertise[section]["title"] as? String{
            titleLabel.text = stringTitle
			titleLabel.textColor = UIColor(displayP3Red: 119/255, green: 134/255, blue: 158/255, alpha: 1)
        }
        sectionView.addSubview(titleLabel)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
}

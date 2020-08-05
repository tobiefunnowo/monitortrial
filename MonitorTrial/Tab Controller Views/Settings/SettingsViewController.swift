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
		tblSettings.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "BasicCell")
        createArray()
        tblSettings.estimatedRowHeight = 60.0
        // Do any additional setup after loading the view.
    }

    func createArray(){
        expertise.append(["title":"App","values":["Security","Accounts","Notifications","Face ID"]])
        expertise.append(["title":"About","values":["Terms of Use","Privacy Policy"]])
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
        let cell = tblSettings.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
        cell.mainLabel.isHidden = true
        guard let coderNames = expertise[indexPath.section]["values"] as? [String] else{
            return cell
        }
        cell.textLabel?.text = coderNames[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tblSettings.frame.size.width, height: 50.0))
        sectionView.backgroundColor = .white
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tblSettings.frame.size.width, height: 50.0))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let stringTitle = expertise[section]["title"] as? String{
            titleLabel.text = stringTitle
        }
        sectionView.addSubview(titleLabel)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
}

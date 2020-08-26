//
//  OptionsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RealmSwift

class Options{
    internal init(OptionsTitle: String, Index: Int) {
        self.OptionsTitle = OptionsTitle
        self.Index = Index
    }
    
    var OptionsTitle:String
    var Index:Int
}

class OptionsViewController: UIViewController {
    
    var listOfOptions:[Options]{
        
        return [Options(OptionsTitle: "Entertainment", Index: 0), Options(OptionsTitle: "Urge To Create", Index: 1), Options(OptionsTitle: "Work", Index: 2), Options(OptionsTitle: "Meditate", Index: 3)]
    }
    
    var selectedIndes:Int?
    
    @IBOutlet weak var btnSaveDetails:UIButton!
    @IBOutlet weak var tblOptions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSaveDetails.layer.cornerRadius = 10
        tblOptions.delegate = self
        tblOptions.dataSource = self
		tblOptions.register(UINib(nibName: "OptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "OptionsTableViewCell")
		tblOptions.backgroundColor = .clear
        tblOptions.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToExploreTab(_ sender: Any) {
        
        if !(selectedIndes == nil){
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
			do{
				
				let myRealm = try Realm()
				let monitorUserArray = myRealm.objects(MonitorTrialUsers.self)
				let thisUser = monitorUserArray.first(where: {
					element in element.EmailAddress == HelperClass.userEmailAddres
				})
				if let thisUSer = thisUser{
					try myRealm.write{
						thisUSer.SelectIExplorendex = selectedIndes?.description
						let exploreTab = storyBoard.instantiateViewController(withIdentifier: "ExploreTab")
						//let mainExploreVC = storyBoard.instantiateViewController(withIdentifier: "ExploreVC") as! ExploreViewController
						HelperClass.sentIndex = selectedIndes!
						self.navigationController?.pushViewController(exploreTab, animated: true)
					}
				}
			}catch (let error){
				print(error.localizedDescription)
			}
				
        }
    }
    

}

extension OptionsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOptions.dequeueReusableCell(withIdentifier: "OptionsTableViewCell", for: indexPath)
        
        cell.textLabel?.text = listOfOptions[indexPath.row].OptionsTitle
		
		if(selectedIndes == indexPath.row){
			cell.accessoryType = .checkmark
		}else{
			cell.accessoryType = .none
		}
		cell.isSelected = false
		
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblOptions.deselectRow(at: indexPath
            , animated: true)
        selectedIndes = listOfOptions[indexPath.row].Index
		tblOptions.reloadData()
    }
    
}

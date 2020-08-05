//
//  SingleSubViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SingleSubViewController: UIViewController {

    
    
    @IBOutlet weak var tblServices: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
		tblServices.delegate = self
        tblServices.dataSource = self
        tblServices.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tblServices.tableFooterView = UIView()
        tblServices.backgroundColor = .clear
        //tblServices.separatorInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        tblServices.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }


    @IBAction func hanldeBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

extension SingleSubViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		Services.listOfServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tblServices.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
                serviceCell.imgCell.image = UIImage(named: Services.listOfServices[indexPath.row].imageName)
                serviceCell.lblServiceName.text = Services.listOfServices[indexPath.row].serviceName
                serviceCell.lblServicePrice.text = Services.listOfServices[indexPath.row].servicePrice
        //        serviceCell.backgroundColor = .clear
                return serviceCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblServices.deselectRow(at: indexPath, animated: true)
		if indexPath.row == 0{
			let NetflixVie = NetflixViewController(nibName: "NetflixViewController", bundle: nil)
			NetflixVie.modalPresentationStyle = .formSheet
			self.present(NetflixVie, animated: true, completion: nil)
		}
    }
    
}

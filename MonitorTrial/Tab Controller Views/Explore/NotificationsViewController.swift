//
//  NotificationsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    @IBOutlet weak var tblNotifications: UITableView!
    
    let listOfNotifs = ["Your netflix payment is due in two days!","Your apple music subscription will end on 20th o...","You have successfully logged in to your dropbox a...","You have successfully created the Movies bundle","Your payment for Dribbble was successful!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNotifications.delegate = self
        tblNotifications.dataSource = self
        tblNotifications.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "BasicCell")
        tblNotifications.tableFooterView = UIView()
        tblNotifications.backgroundColor = .clear
        tblNotifications.separatorStyle = .none
        // Do any additional setup after loading the view.
    }


    
    @IBAction func handleGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension NotificationsViewController:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfNotifs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNotifications.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
        cell.mainLabel.text = listOfNotifs[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblNotifications.deselectRow(at: indexPath, animated: true)
    }
}

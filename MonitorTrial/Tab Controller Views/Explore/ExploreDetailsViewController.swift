//
//  ExploreDetailsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ExploreDetailsViewController: UIViewController {

    var stringViewTItle = ""
    var stringVieSubtitle = ""
    var imageName = ""
    var textViewContent = ""

	var listOfServices = [Services]()
	
    @IBOutlet weak var btnGoBack: UIButton!
    @IBOutlet weak var lblViewSubtitle: UILabel!
    @IBOutlet weak var lblViewTitle: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var txvMain: UITextView!
    
    @IBOutlet weak var tblMain: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMain.delegate = self
        tblMain.dataSource = self
        tblMain.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tblMain.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblViewTitle.text = stringViewTItle
        lblViewSubtitle.text = stringVieSubtitle
        imgMain.image = UIImage(named: imageName)
        txvMain.text = textViewContent
        tblMain.reloadData()
        
    }
    
    @IBAction func handleGoBack(_ sender: Any) {
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

extension ExploreDetailsViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tblMain.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
        serviceCell.lblServiceName.text = listOfServices[indexPath.row].serviceName
        serviceCell.lblServicePrice.text = listOfServices[indexPath.row].servicePrice
        serviceCell.imgCell.image = UIImage(named: listOfServices[indexPath.row].imageName)
        return serviceCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblMain.deselectRow(at: indexPath, animated: true)
    }
    
}

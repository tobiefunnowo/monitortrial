//
//  PresetBundleViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

struct ReceiptItem {
    var productName:String
    var productCost:String
}

class PresetBundleViewController: UIViewController {

    @IBOutlet weak var mysubView: UIView!
    @IBOutlet weak var tblReceipt: UITableView!
    
    var receiptList:[ReceiptItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(displayP3Red: 0.220, green: 0.22, blue: 0.22, alpha: 0.3)
        mysubView.layer.cornerRadius = 10
        tblReceipt.delegate = self
        tblReceipt.dataSource = self
		tblReceipt.register(UINib(nibName: "BasicCell", bundle: nil), forCellReuseIdentifier: "BasicCell")
		
		
        // Do any additional setup after loading the view.
    }

    @IBAction func handleSubscribe(_ sender: Any) {
        let viewSucces =  SuccessViewController(nibName: "SuccessViewController", bundle: nil)
        viewSucces.modalPresentationStyle = .fullScreen
        self.present(viewSucces, animated: true, completion: nil)
    }
	
	func fillRecipetList(){
		var hmm:[ReceiptItem]{
			let item_1 = ReceiptItem(productName: "NETFLIX", productCost: "$5400")
			let item_2 = ReceiptItem(productName: "TIDAL", productCost: "$5400")
			let item_3 = ReceiptItem(productName: "PLAYSTATION PLUS", productCost: "$5400")
			let item_4 = ReceiptItem(productName: "SPOTIFY", productCost: "$5400")
			let item_5 = ReceiptItem(productName: "ESPN+", productCost: "$5400")

			return [item_1,item_2,item_3,item_4,item_5]
		}
		receiptList = hmm
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if receiptList.isEmpty{
			fillRecipetList()
		}
		appendTotal()
		tblReceipt.reloadData()
	}
	
	func appendTotal(){
		var totalCost = 0
		for hmm in receiptList{
			let cost = Int(hmm.productCost.replacingOccurrences(of: "$", with: ""))
			if let cost = cost{
				totalCost += cost
			}
		}
		receiptList.append(ReceiptItem(productName: "TOTAL", productCost:"$\(totalCost)"))
	}

}


extension PresetBundleViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receiptList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let myBasicCell = tblReceipt.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
		myBasicCell.mainLabel.text = receiptList[indexPath.row].productName
		myBasicCell.subLabel.isHidden = false
		myBasicCell.subLabel.text = receiptList[indexPath.row].productCost
		return myBasicCell
    }
    
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tblReceipt.deselectRow(at: indexPath, animated: true)
	}
	
}

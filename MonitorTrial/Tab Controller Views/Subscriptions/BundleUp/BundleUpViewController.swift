//
//  BundleUpViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RealmSwift

class BundleUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handlePresetBundle(_ sender: Any) {
		let presetView = PresetBundleViewController(nibName: "PresetBundleViewController", bundle: nil)
		presetView.modalPresentationStyle = .formSheet
		present(presetView, animated: true, completion: nil)
    }
    
    
    @IBAction func handleCreateYOurbundle(_ sender: Any) {
		navigationController?.pushViewController(CreatYOurBundleViewController(nibName: "CreatYOurBundleViewController", bundle: nil), animated: true)
    }
    
    
    @IBAction func goToMyPresetBundle(_ sender: Any) {
        do{
            let myRealm = try Realm()
            let userArray = myRealm.objects(MonitorTrialUsers.self)
            let firstUSer = userArray.first{
                element in element.EmailAddress == HelperClass.userEmailAddres
            }
            
            if let firtuser = firstUSer{
                let usersServices = Array(firtuser.myServices)
				print(firtuser.Name)
				let convertedList = usersServices.fillReceiptList()
                let presetView = PresetBundleViewController(nibName: "PresetBundleViewController", bundle: nil)
				presetView.receiptList = convertedList
                presetView.modalPresentationStyle = .formSheet
                present(presetView, animated: true, completion: nil)
                
			}else{
				print("here")
			}
        }catch(let error){
			print(error.localizedDescription)
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


extension Array where Element == Services{
	
	func fillReceiptList() -> [ReceiptItem] {
		var receiptItems:[ReceiptItem] = []
		for service in self{
			let signleItem = ReceiptItem(productName: service.serviceName, productCost: service.servicePrice)
			receiptItems.append(signleItem)
		}
		
		return receiptItems
		
	}
}

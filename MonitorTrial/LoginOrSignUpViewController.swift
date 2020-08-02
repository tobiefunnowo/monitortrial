//
//  ViewController.swift
//  MonitorTrial
//
//  Created by MAC on 27/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class LoginOrSignUpViewController: UIViewController{
    
    var imageNames = ["screenicon","optimizeicon","budgeticon"]
    var imageTexts = ["Track and monitor all your subscriptions all in one place.","Optimize your subscription services. Discover better services to suit your needs.","Discover new and convenient means to subscribe to your favorite services on a budget. "]
    
    @IBOutlet weak var collviewSignUp: UICollectionView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var signUpPageControl: UIPageControl!
    @IBOutlet weak var curvedCardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collviewSignUp.dataSource = self
        collviewSignUp.delegate = self
        curvedCardView.layer.cornerRadius = 15
        btnLogin.layer.borderWidth = 2
        btnLogin.layer.borderColor = UIColor.black.cgColor
        btnLogin.layer.cornerRadius = 15
        btnSignUp.layer.cornerRadius = 15
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension LoginOrSignUpViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collCell = collviewSignUp.dequeueReusableCell(withReuseIdentifier: "SignUpCell", for: indexPath)
        if let label = collCell.viewWithTag(2000) as? UILabel{
            label.text = imageTexts[indexPath.row]
        }
        if let collImageView = collCell.viewWithTag(1000) as? UIImageView{
            collImageView.image = UIImage(named: imageNames[indexPath.row])
            collImageView.contentMode = .scaleAspectFit
            
        }
        return collCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collviewSignUp.frame.size.width, height: collviewSignUp.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        signUpPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}


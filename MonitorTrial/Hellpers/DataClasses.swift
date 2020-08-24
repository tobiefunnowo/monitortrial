//
//  DataClasses.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import RealmSwift

class Services:Object{
	convenience init(imageName: String = "", serviceName: String = "", servicePrice: String = "", beenSelected: Bool = false) {
		self.init()
		self.imageName = imageName
		self.serviceName = serviceName
		self.servicePrice = servicePrice
		self.hasBeenSelected = beenSelected
	}
	
    @objc dynamic var imageName:String = ""
	@objc dynamic var serviceName:String = ""
    @objc dynamic var servicePrice:String = ""
	@objc dynamic var hasBeenSelected:Bool = false
    
	static var listOfServices:[Services] = []
	
	func convertToReceiptItem() -> ReceiptItem{
		return ReceiptItem(productName: self.serviceName, productCost: self.servicePrice)
	}
}

struct ExploreOptions {
	let imageName:String
	let imageIndex:Int
	let goToDetails:()->()
}

class MonitorTrialUsers: Object{
	@objc dynamic var Name:String?
	@objc dynamic var PhoneNumber:String?
	@objc dynamic var EmailAddress:String?
	@objc dynamic var Password:String?
	@objc dynamic var SelectIExplorendex:String?
	var myServices = List<Services>()

}

class SingleSubscriptionAsset{
	internal init(mainImage: String, cellImage: String, logoImageName: String, title: String, subColor: UIColor) {
		self.mainImage = mainImage
		self.cellImage = cellImage
		self.logoImageName = logoImageName
		self.title = title
		self.subColor = subColor
	}
	
	var mainImage:String
	var cellImage:String
	var logoImageName:String
	var title:String
	var subColor:UIColor
	
	static var lisOfSingleSubAssets = [SingleSubscriptionAsset]()
}

struct ExploreTextContent {
    static let entertainmentString = """
 Movies, music, gaming, e-sports, sports and so much more. Here is your hub for the best of the best services offering the best of the entertainment industry. Live life, have fun, have a laugh, smile and stay happy with these services.
    From movie and tv shows providers such as Netflix, and Hulu, to the best music from all around the world with Apple Music and Spotify. Have a legend worth gaming experience with Playstation Plus and XBOX live. Stream your favorite gamers live on Youtube Plus and Twitch.
    Catch your favorite sportmen and women play with ESPN plus and so much more.
    Movies, music, gaming, e-sports, sports and so much more. Here is your hub for the best of the best services offering the best of the entertainment industry. Live life, have fun, have a laugh, smile and stay happy with these services.
    From movie and tv shows providers such as Netflix, and Hulu, to the best music from all around the world with Apple Music and Spotify. Have a legend worth gaming experience with Playstation Plus and XBOX live. Stream your favorite gamers live on Youtube Plus and Twitch.
    Catch your favorite sportmen and women play with ESPN plus and so much more.
 """
    
    static let urgeToCreateString = """
    Are you what the public considers to be a creative? Do you design, write, or create whatever. Do you have the urge to create?
    The world is moving so fast, and we as creatives want to bew ahead of the curve, subscribing to exclusive premium services to keep us updated and ready to work. Below is a list of amazing services to take to work to the next level.
    Are you what the public considers to be a creative? Do you design, write, or create whatever. Do you have the urge to create?
    The world is moving so fast, and we as creatives want to bew ahead of the curve, subscribing to exclusive premium services to keep us updated and ready to work. Below is a list of amazing services to take to work to the next level.
"""
    
    static let workWiserString = """
    Change the way you work. Work faster,easier, automate your processes. Work wiser. Change the way you work. Work faster,easier, automate your
    processes.Work wiser.
    Have access to apps for storage, for writing and documentation and other services that will make elevate your working experience. Change the way you work. Work faster,easier, automate your processes. Work wiser. Change the way you work. Work faster,easier, automate your
    processes.Work wiser.
    Have access to apps for storage, for writing and documentation and other services that will make elevate your working experience.
"""
    
    static let healthString = """
    Staying healthy is not a days job, it is a process that shouldnt be taken with laxity. It is as important any other aspect of our lives. Calmness, good night sleep, calming anxiety, and much more can be achieved with the apps below.
    Staying healthy is not a days job, it is a process that shouldnt be taken with laxity. It is as important any other aspect of our lives. Calmness, good night sleep, calming anxiety, and much more can be achieved with the apps below.
"""
}

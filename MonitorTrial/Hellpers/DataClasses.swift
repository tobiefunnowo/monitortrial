//
//  DataClasses.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class Services:Equatable{
	static func == (lhs: Services, rhs: Services) -> Bool {
		return lhs.hasBeenSelected == rhs.hasBeenSelected
	}
	
    let imageName:String
    let serviceName:String
    let servicePrice:String
	var hasBeenSelected:Bool
    
	init(imageName: String, serviceName: String, servicePrice: String,beenSelected:Bool) {
        self.imageName = imageName
        self.serviceName = serviceName
        self.servicePrice = servicePrice
		self.hasBeenSelected = beenSelected
    }
	
	static var listOfServices:[Services] = []
	
	
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

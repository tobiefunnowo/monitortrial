//
//  HelperClass.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 17/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import PKHUD

class HelperClass{
	
	static func showFillAllfields(){
		HUD.flash(.label("Fill All Fields"),delay: 1)
		return
	}
	
	static var userEmailAddres = ""
	
	static var sentIndex = 0
	
	static let sampleURLforCard = "https://checkout.stripe.com/pay/ppage_1HHA4WFKnpzPB0MXcIfblaeN#fidkdWxOYHwnPyd1blpxYHZxWm9CPHY2XUhhVm9fQzxOYWgwYjA8f2lcYScpJ3dgY2B3d2B3SndsYmxrJz8nbXFxdXY%2FKip2cXdsdWArZmpoJyknaWpmZGlgJz9rcGlpKSdobGF2Jz9%2BJ2JwbGEnPydgMmA8PGExYSg2PT1mKDE2ZDEoZDE8Yyg1ZDdmYWBmNzcyYGAxMDRnZmMnKSdocGxhJz8nMWAzPTJkZDcoZ2YxPSgxN2FkKDw0NDEoNmExYWc1MjE0MjQ8NmBhPWQ9JykndmxhJz8nNzdkMGYyZjcoYTc9YCgxNTBkKGc8M2AoNzMxMDAzPTVmMWY0PWQxYzY3J3gpJ2dgcWR2Jz9eWHgl"
}

//
//  NetworkManager.swift
//  Catalog
//
//  Created by SDT2 on 2015. 10. 29..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct MyCart {
	var prodName : String
	var prodCount : Int
}

class NetworkManager {
	
	var myCart : [MyCart]
	
	static let sharedManager = NetworkManager()

	let manager: Manager
	
	init() {
		var defaultHeaders = Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
		defaultHeaders["X-Parse-REST-API-Key"] = "kmFkkCvOVbbYwNjla11W0U4Lwm1iOvkcOnR6v0Ob"
		defaultHeaders["X-Parse-Application-Id"] = "ajLkM9eoIQ4ddHaGKb9umaQSV9Sx58iOGxRPoRER"
		
		let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
		configuration.HTTPAdditionalHeaders = defaultHeaders
		manager = Alamofire.Manager(configuration: configuration)
		myCart = [MyCart]()
	}

	func retriveCart() {
		// Fetch Request
		manager.request(.GET, "https://api.parse.com/1/classes/Cart").responseJSON { response in
			let json = JSON(response.result.value!)
			
			for (_, subJson):(String, JSON) in json["results"] {
				let prodName = subJson["name"].string
				let prodCount = (subJson["count"] == nil ? 0 : subJson["count"].int)
				
				print("제품명 : \(prodName), 카운트 : \(prodCount)")
				//? Pass
			    // Delegate O
				// Noti SwiftyJSON X
				self.myCart.append(MyCart(prodName: prodName!, prodCount: prodCount!))
			}
			NSNotificationCenter.defaultCenter().postNotificationName("CartChanged", object: nil)
			
//			self.delegate?.reloadData()
		}
	}
	
}
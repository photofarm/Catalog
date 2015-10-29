//
//  Cart.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import SwiftyJSON

struct MyCart {
	var prodName : String
	var prodCount : Int
}

protocol MyCartDelegate : class {
	func reloadData()
}

class Cart {

	weak var delegate : MyCartDelegate!
	
	static let sharedInstance = Cart()
	var cartItem : Results<CartItem>
	var myCart : [MyCart]

	init() {
		let realm = try! Realm()
		cartItem = realm.objects(CartItem)
		myCart = [MyCart]()
	}

	func removeCart(prodName : String) {
		
	}

	func retriveCart() {
		let realm = try! Realm()
		cartItem = realm.objects(CartItem)

		let headers = [
			"X-Parse-REST-API-Key":"kmFkkCvOVbbYwNjla11W0U4Lwm1iOvkcOnR6v0Ob",
			"X-Parse-Application-Id":"ajLkM9eoIQ4ddHaGKb9umaQSV9Sx58iOGxRPoRER",
			"Content-Type":"application/json",
		]
		
		myCart.removeAll()
		
		// Fetch Request
		Alamofire.request(.GET, "https://api.parse.com/1/classes/Cart", headers: headers).responseJSON { response in
			let json = JSON(response.result.value!)

			for (key, subJson):(String, JSON) in json["results"] {
				let prodName = subJson["name"].string
				let prodCount = (subJson["count"] == nil ? 0 : subJson["count"].int)

				print("제품명 : \(prodName), 카운트 : \(prodCount)")
				self.myCart.append(MyCart(prodName: prodName!, prodCount: prodCount!))
			}
			
			self.delegate?.reloadData()
		}
	}

	func addCart(prodName : String) {
		let cartItem = CartItem()
		cartItem.prodName = prodName
		cartItem.prodCount = 1
		var isFind = false
		
		for var id = 0; id < self.cartItem.count; id++ {
			if self.cartItem[id].prodName == prodName {
				isFind = true
				break
			}
		}
		
		// DB 저장
		let realm = try! Realm()
		try! realm.write {
			realm.add(cartItem, update: isFind)
		}
	}
	
	func addCart(prodName : String, prodCount : Int) {
		let headers = [
			"X-Parse-REST-API-Key":"kmFkkCvOVbbYwNjla11W0U4Lwm1iOvkcOnR6v0Ob",
			"X-Parse-Application-Id":"ajLkM9eoIQ4ddHaGKb9umaQSV9Sx58iOGxRPoRER",
			"Content-Type":"application/json",
		]
		
		// JSON Body
//		let bodyParameters = [
//			"name": prodName
//			"count": prodCount
//		]

		let bodyParameters = [
			"name": prodName
		]
		
		let encoding = Alamofire.ParameterEncoding.JSON
		
		// Fetch Request
		Alamofire.request(.POST, "https://api.parse.com/1/classes/Cart", headers: headers, parameters: bodyParameters, encoding: encoding).validate(statusCode: 200..<300).responseJSON { response in
		}
	}
}

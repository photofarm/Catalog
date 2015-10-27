//
//  Cart.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import RealmSwift

class Cart {

	static let sharedInstance = Cart()
	var cartItem : Results<CartItem>!
	
	func removeCart(prodName : String) {
		
	}

	func retriveCart() {
		let realm = try! Realm()
		cartItem = realm.objects(CartItem)
	}

	func addCart(prodName : String) {
		let cartItem = CartItem()
		cartItem.prodName = prodName
		cartItem.prodCount = 1
		
		// DB 저장
		let realm = try! Realm()
		try! realm.write {
			realm.add(cartItem)
		}
	}
}

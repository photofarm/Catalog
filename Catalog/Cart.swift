//
//  Cart.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation

class Cart {
//	var productCode : String!
//	var productName : String!
//	var productCount : Int!

	static let sharedInstance = Cart()
	var cart:[(productName: String, count: Int)] = []
	
	// Designated Initalizer
//	init(productCode : String, productName : String, productCount : Int) {
//		self.productCode = productCode
//		self.productName = productName
//		self.productCount = productCount
//	}
	
	func addCart(prodName : String) {
		cart.append((prodName, 1))
	}
}

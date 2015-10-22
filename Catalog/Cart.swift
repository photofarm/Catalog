//
//  Cart.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation

class Cart {
	var code : String!
	var name : String!
	var price : String!
	var image : String!
	var count : Int!
	
	
	// Designated Initalizer
	init(code : String, name : String, price : String, image : String, count : Int) {
		self.code = code
		self.name = name
		self.price = price
		self.image = image
		self.count = count
	}
}

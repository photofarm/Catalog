//
//  Cart.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation

class Cart {
	var productCode : String!
	var productCount : Int!
	
	
	// Designated Initalizer
	init(productCode : String, productCount : Int) {
		self.productCode = productCode
		self.productCount = productCount
	}
}

//
//  CartItem.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 27..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import RealmSwift

class CartItem: Object {
	dynamic var prodName: String = ""
	dynamic var prodCount: Int = 0
}
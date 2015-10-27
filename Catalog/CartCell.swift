//
//  CartCell.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 27..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

protocol CartCellDelegate : class {
	func addProduct(prodName : String)
	func removeProduct(prodName : String)
}

class CartCell: UITableViewCell {

	weak var delegate : CartCellDelegate!

	@IBOutlet weak var label상품명: UILabel!
	@IBOutlet weak var label카운트: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBAction func button추가(sender: UIButton) {
	}

	@IBAction func button삭제(sender: UIButton) {
	}
}

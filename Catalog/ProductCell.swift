//
//  ProductCell.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : class {
	func addCart(productCode : String)
}

class ProductCell: UITableViewCell {

	weak var delegate : ProductCellDelegate!
	var productCode: String!

	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var addCart: UIButton!
	
	@IBAction func addCart(sender: UIButton) {
		delegate.addCart(productCode)
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

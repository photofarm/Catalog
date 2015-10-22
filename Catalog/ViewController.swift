//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, ProductCellDelegate {

    @IBOutlet weak var productTable: UITableView!
	
	var productList : [Product]!
	var cartList : [Cart] = [Cart]()
	var numberOfSections : Int = 1

	func addCart(productCode: String, productName : String) {
		numberOfSections = 2;
		
//		cartList += [Cart(productCode: productCode, productCount: 1)]
//		cartList.append(Cart(productCode: productCode, productName: productName, productCount: 1))
		cartList.insert(Cart(productCode: productCode, productName: productName, productCount: 1), atIndex: 0)

		if numberOfSections > 1 {
			productTable.reloadData()
		}
		
		print(productCode)
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return numberOfSections
	}

	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		var title : String!
		
		if section == 0 {
			title = "Catalog"
		} else {
			title = "Cart"
		}
		
		return title
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (section == 0 ? productList.count : cartList.count)
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellID : String = (indexPath.section == 0 ? "PRODUCT_CELL" : "CART_CELL")
		let cell : ProductCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! ProductCell
		

		if indexPath.section == 0 {
			let product = productList[indexPath.row]
			cell.productName.text = product.name
			cell.productPrice.text = product.price
			cell.productImage.image = UIImage(named: product.image)
			
			cell._productCode = product.code
			cell._productName = product.name
			
			// 셀 델리게이트 설정
			cell.delegate = self
		} else {
			let product = cartList[indexPath.row]
			cell.textLabel?.text = product.productName;
		}
		
		return cell
	}

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

		productList = [
			Product(code: "001", name: "Baseball", price: "100", image: "Baseball"),
			Product(code: "002", name: "Basketball", price: "200", image: "Basketball"),
			Product(code: "003", name: "Football", price: "300", image: "Football"),
			Product(code: "004", name: "Golf", price: "400", image: "Golf"),
			Product(code: "005", name: "Rugby", price: "500", image: "Rugby"),
			Product(code: "006", name: "Tennis", price: "600", image: "Tennis"),
			Product(code: "007", name: "Volleyball", price: "700", image: "Volleyball"),
			Product(code: "008", name: "TableTennis", price: "800", image: "TableTennis"),
			Product(code: "009", name: "IceHockey", price: "800", image: "IceHockey"),
			Product(code: "010", name: "Billiard", price: "800", image: "Billiard"),
		]
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


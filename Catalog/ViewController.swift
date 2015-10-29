//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {

    @IBOutlet weak var productTable: UITableView!
	
//	static let cart = Cart()
	var productList : [Product]!
	var cartList : [Cart] = [Cart]()
	var numberOfSections : Int = 1

	func addCart(productCode: String, productName : String) {
		Cart.sharedInstance.addCart(productName, prodCount: 1)
		
		print(productCode)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let url = productList[(productTable.indexPathForSelectedRow?.row)!].url
//		let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PRODUCT_DETAIL") as! DetailViewController
		let vc = segue.destinationViewController as! DetailViewController
		vc.urlString = url
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
		}
		
		return cell
	}

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

		productList = [
			Product(code: "001", name: "Baseball", price: "100", image: "Baseball", url:"https://ko.wikipedia.org/wiki/%EC%95%BC%EA%B5%AC%EA%B3%B5"),
			Product(code: "002", name: "Basketball", price: "200", image: "Basketball", url:"https://ko.wikipedia.org/wiki/%EB%86%8D%EA%B5%AC%EA%B3%B5"),
			Product(code: "003", name: "Football", price: "300", image: "Football", url:"https://ko.wikipedia.org/wiki/%EC%B6%95%EA%B5%AC%EA%B3%B5"),
			Product(code: "004", name: "Golf", price: "400", image: "Golf", url:"https://ko.wikipedia.org/wiki/%EA%B3%A8%ED%94%84%EA%B3%B5"),
			Product(code: "005", name: "Rugby", price: "500", image: "Rugby", url:"https://ko.wikipedia.org/wiki/%EB%9F%AD%EB%B9%84%EA%B3%B5"),
			Product(code: "006", name: "Tennis", price: "600", image: "Tennis", url:"https://ko.wikipedia.org/wiki/%ED%85%8C%EB%8B%88%EC%8A%A4%EA%B3%B5"),
			Product(code: "007", name: "Volleyball", price: "700", image: "Volleyball", url:"https://ko.wikipedia.org/wiki/%EB%B0%B0%EA%B5%AC%EA%B3%B5"),
			Product(code: "008", name: "TableTennis", price: "800", image: "TableTennis", url:"https://ko.wikipedia.org/wiki/%ED%83%81%EA%B5%AC"),
			Product(code: "009", name: "IceHockey", price: "800", image: "IceHockey", url:"https://ko.wikipedia.org/wiki/%EC%95%84%EC%9D%B4%EC%8A%A4%ED%95%98%ED%82%A4"),
			Product(code: "010", name: "Billiard", price: "800", image: "Billiard", url:"https://ko.wikipedia.org/wiki/%EB%8B%B9%EA%B5%AC%EA%B3%B5"),
		]
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


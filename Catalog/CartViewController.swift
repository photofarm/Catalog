//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CartCellDelegate {

    @IBOutlet weak var table카트: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	func addProduct(prodName: String) {
		<#code#>
	}
	
	func removeProduct(prodName: String) {
		<#code#>
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		Cart.sharedInstance.retriveCart()
		table카트.reloadData()
	}

	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let 행수 = (Cart.sharedInstance.cartItem == nil ? 0 : Cart.sharedInstance.cartItem.count)

		return 행수
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL", forIndexPath: indexPath) as! CartCell
		let 상품명 = Cart.sharedInstance.cartItem[indexPath.row].prodName
		let 카운트 = Cart.sharedInstance.cartItem[indexPath.row].prodCount

		cell.label상품명.text = 상품명
		cell.label카운트.text = String(카운트)

		return cell
	}
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

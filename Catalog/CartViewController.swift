//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CartCellDelegate, MyCartDelegate {

    @IBOutlet weak var table카트: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleChange", name: "CartChanged", object: nil)

        // Do any additional setup after loading the view.
    }
	
	func handleChange() {
		print("HHH")
		reloadData()
	}

	func reloadData() {
		table카트.reloadData()
	}
	
	func addProduct(prodName: String) {
		
	}
	
	func removeProduct(prodName: String) {
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		NetworkManager.sharedManager.retriveCart()
//		Cart.sharedInstance.retriveCart()
//		table카트.reloadData()
		
	}

	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		let 행수 = Cart.sharedInstance.cartItem.count
//		let 행수 = Cart.sharedInstance.myCart.count
		let 행수 = NetworkManager.sharedManager.myCart.count
		print(행수)

		return 행수
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL", forIndexPath: indexPath) as! CartCell
//		let 상품명 = Cart.sharedInstance.cartItem[indexPath.row].prodName
//		let 카운트 = Cart.sharedInstance.cartItem[indexPath.row].prodCount
		let 상품명 = NetworkManager.sharedManager.myCart[indexPath.row].prodName
		let 카운트 = NetworkManager.sharedManager.myCart[indexPath.row].prodCount

		cell.label상품명.text = 상품명
		cell.label카운트.text = String(카운트)
		print(상품명)

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

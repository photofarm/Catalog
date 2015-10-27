//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit
import RealmSwift

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table카트: UITableView!
	var cartItem : Results<CartItem>!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		// DB 읽어오기
		cartItem = Cart.sharedInstance.retriveCart()

		table카트.reloadData()
}

	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let 행수 = (cartItem == nil ? 0 : cartItem.count)

		return 행수
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL", forIndexPath: indexPath) as! CartCell
		let 상품명 = cartItem[indexPath.row].prodName
		let 카운트 = cartItem[indexPath.row].prodCount

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

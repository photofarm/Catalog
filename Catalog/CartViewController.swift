//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table카트: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		table카트.reloadData()
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let 행수 = Cart.sharedInstance.cart.count

		return 행수
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL", forIndexPath: indexPath) as! CartCell
		let 상품명 = Cart.sharedInstance.cart[indexPath.row].productName

		cell.label상품명.text = 상품명

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

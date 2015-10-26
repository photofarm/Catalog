//
//  DetailViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 all4web. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	var urlString : String!
	
    @IBOutlet weak var webView: UIWebView!

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		let url = NSURL(string: urlString)
		let request = NSURLRequest(URL: url!)
		
		webView.loadRequest(request)
	}

	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

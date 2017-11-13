//
//  InstaViewController.swift
//  Hackathon
//
//  Created by Mohamed Ghribi on 11/12/17.
//  Copyright © 2017 Mohamed Ghribi. All rights reserved.
//

import UIKit
import WebKit

class InstaViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.instagram.com/hrblock/")!
        webview.load(URLRequest(url: url))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
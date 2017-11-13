//
//  CarMileageViewController.swift
//  Hackathon
//
//  Created by Mohamed Ghribi on 11/10/17.
//  Copyright © 2017 Mohamed Ghribi. All rights reserved.
//

import UIKit

class CarMileageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myArrayDataStructure.myArray.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let returnedItems = UserDefaults.standard.stringArray(forKey: "items") ?? [String]()
        let tempLabel = returnedItems[indexPath.row]
        cell.textLabel?.text = "Nov, 2017  " + tempLabel + " Miles"
        return cell
    }
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var totalAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var total = 0
        for amount in myArrayDataStructure.myArray{
            total += Int(amount)!
        }
        totalAmount.text = String(total) + " Miles"
        
        table.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let returnedItems = UserDefaults.standard.stringArray(forKey: "items") ?? [String]()
        var total = 0
        for amount in returnedItems{
            total += Int(amount)!
        }
        totalAmount.text = String(total) + " Miles"
        print(returnedItems)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            myArrayDataStructure.myArray.remove(at: indexPath.row)
            table.reloadData()
            
            UserDefaults.standard.set(myArrayDataStructure.myArray, forKey: "items")
            let returnedItems = UserDefaults.standard.stringArray(forKey: "items") ?? [String]()
            
            var total = 0
            for amount in returnedItems{
                total += Int(amount)!
            }
            totalAmount.text = String(total) + " Miles"
            
 

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

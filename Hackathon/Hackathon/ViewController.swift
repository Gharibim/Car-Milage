//
//  ViewController.swift
//  Hackathon
//
//  Created by Mohamed Ghribi on 11/9/17.
//  Copyright © 2017 Mohamed Ghribi. All rights reserved.
//

import UIKit
class myArrayDataStructure {
    static var myArray = UserDefaults.standard.stringArray(forKey: "items") ?? [String]()
    private init() {} // prevents unwanted access
}
class ViewController: UIViewController {
    @IBOutlet weak var addGas: UIButton!
    @IBOutlet weak var distanceOnMap: UIButton!
    @IBOutlet weak var carMileage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGas.applyDesign()
        distanceOnMap.applyDesign()
        carMileage.applyDesign()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


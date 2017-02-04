//
//  ViewController.swift
//  ButtonMask
//
//  Created by Costantino Pistagna on 03/02/2017.
//  Copyright © 2017 sofapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button1DidPressed(sender: Any) {
        print("button1DidPressed")
    }

    @IBAction func button2DidPressed(sender: Any) {
        print("button2DidPressed")
    }


}


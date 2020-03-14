//
//  ViewController.swift
//  PresenterRowSample
//
//  Created by Alfredo Luco on 13-03-20.
//  Copyright © 2020 Alfredo Luco. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Presenter row")
            <<< PresenterRowSample(tag: "row").cellSetup({
        cell, row in
        cell.stackedLabel.text = "Sample"
        }).cellUpdate({
            cell,row in
            print(row.value)
        })
        // Do any additional setup after loading the view.
    }


}


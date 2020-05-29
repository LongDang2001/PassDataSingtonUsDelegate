//
//  SecondViewController.swift
//  PassDataSingtonUsDelegate
//
//  Created by admin on 2/26/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
protocol passDataDelegate {
    func passData()
}

class SecondViewController: UIViewController {
    @IBOutlet weak var txtSecond: UITextField!
    var delegate: passDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if singTon.all.dataSecond != nil {
            singTon.all.dataSecond = txtSecond.text
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        txtSecond.text = singTon.all.dataSecond
    }
    
    @IBAction func save() {
        guard let datadelegate = txtSecond.text else {return}
        if (datadelegate.trimmingCharacters(in: .whitespaces).isEmpty) {
            
        } else {
            self.delegate?.passData()
        }
        navigationController?.popViewController(animated: true)
    }
}

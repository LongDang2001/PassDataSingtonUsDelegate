//
//  ViewController.swift
//  PassDataSingtonUsDelegate
//
//  Created by admin on 2/26/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var arrayName: [String] = ["nyy","ghg"]
    var indexLocal: Int?
    var secondviewcontroller = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        indexLocal = nil
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        cell.textLabel?.text = arrayName[indexPath.row]
        return cell
    }
    
    @IBAction func add() {
        secondviewcontroller = (storyboard?.instantiateViewController(identifier: "secondviewcontroller") as? SecondViewController)!
        navigationController?.pushViewController(secondviewcontroller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secondviewcontroller = (storyboard?.instantiateViewController(identifier: "secondviewcontroller") as? SecondViewController)!
        singTon.all.dataSecond = arrayName[indexPath.row]
        indexLocal = indexPath.row
        navigationController?.pushViewController(secondviewcontroller, animated: true)
        secondviewcontroller.delegate = self
    }
}

extension ViewController: passDataDelegate {
    func passData() {
        if indexLocal != nil {
            arrayName[indexLocal!] = singTon.all.dataSecond ?? ""
        } else {
            arrayName.append(singTon.all.dataSecond ?? "")
        }
        tableView.reloadData()
    }
}


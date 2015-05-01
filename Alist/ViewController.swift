//
//  ViewController.swift
//  Alist
//
//  Created by Jeffrey Leonard on 4/27/15.
//  Copyright (c) 2015 Jeffrey Leonard. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var info: UITextField!
    
    var currentName = ""
    var currentAmount = ""
    var currentInfo = ""
  
    var existingItem: NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if existingItem != nil {
        name.text = currentName
        amount.text = currentAmount
        info.text = currentInfo

        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveData(sender: AnyObject) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        
        
        let en = NSEntityDescription.entityForName("Item", inManagedObjectContext: contxt)
        
        if existingItem != nil{
            existingItem.setValue(name.text, forKey: "name")
            existingItem.setValue(amount.text, forKey: "amount")
            existingItem.setValue(info.text, forKey: "info")
        } else{
            var newItem = Model(entity: en!, insertIntoManagedObjectContext: contxt)
            newItem.name = name.text
            newItem.amount = amount.text
            newItem.info = info.text
        }
        contxt.save(nil)
        self.navigationController!.popToRootViewControllerAnimated(true)
    
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.navigationController!.popToRootViewControllerAnimated(true)
    }


}


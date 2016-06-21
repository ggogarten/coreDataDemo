//
//  ViewController.swift
//  Core Data Demo
//
//  Created by George Gogarten on 6/21/16.
//  Copyright © 2016 George Gogarten. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("George", forKey: "username")
        
        newUser.setValue("pass123", forKey: "password")
        
        do {
            
            try context.save()
            
        } catch {
        
            print("There was a problem")
            
        }
        
        
        let request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            print(results)
            
        } catch {
            
            print("Fetch Failed")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


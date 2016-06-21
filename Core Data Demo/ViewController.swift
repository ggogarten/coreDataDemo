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
        
//        newUser.setValue("Dani", forKey: "username")
//        
//        newUser.setValue("pass321", forKey: "password")
//        
//        do {
//            
//            try context.save()
//            
//        } catch {
//        
//            print("There was a problem")
//            
//        }
        
        
        let request = NSFetchRequest(entityName: "Users")
        
        request.predicate = NSPredicate(format: "username = %@", "Gluck")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    result.setValue("Princesa", forKey: "username")
                    
                    do {
                                                
                    try context.save()
                        
                    } catch {
                    
                    }
                    

                    if let username = result.valueForKey("username") as? String {
                    
                    print(username)
                    
                    }
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


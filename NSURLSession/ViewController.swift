//
//  ViewController.swift
//  NSURLSession
//
//  Created by Felix-ITS 004 on 19/08/17.
//  Copyright © 2017 com.felix-its. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let url=NSURL(string: "https://api.github.com/repositories/19438/commits")
        
        let req=NSURLRequest(URL: url!)
        
        let configruation = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: configruation)
        
        let task = session.dataTaskWithRequest(req, completionHandler: { (data, response, error) in
            
            
            do {
                let outerarray = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                
                for i in 0..<outerarray.count {
                    
                    let dic = outerarray.objectAtIndex(i) as! NSDictionary
                    
                    let commitdic = dic.objectForKey("commit");
                    
                    let authordic = commitdic?.objectForKey("author")
                    
                    let str = authordic?.objectForKey("name")
                    
                    print(str!)

                }
                
                
            } catch {
                print(error)
            }
            
        })
        
        
        
        task.resume()
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


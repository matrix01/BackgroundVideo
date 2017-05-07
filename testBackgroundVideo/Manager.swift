//
//  Manager.swift
//  testBackgroundVideo
//
//  Created by Milan Mia on 5/21/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import Foundation

func POST(params:NSDictionary, url:String) {
    let request = NSMutableURLRequest(URL: NSURL(string: url)!)
    let session = NSURLSession.sharedSession()
    request.HTTPMethod = "POST"
    
    do{
        request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
    }catch let err as NSError {
        print(err.localizedDescription)
    }
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        print("Response: \(response)")
        let strData = NSString(data:data!, encoding:NSUTF8StringEncoding)
        print("Body: \(strData)")
    })
    task.resume()
}
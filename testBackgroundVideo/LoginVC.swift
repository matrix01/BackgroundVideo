//
//  LoginVC.swift
//  testBackgroundVideo
//
//  Created by Milan Mia on 5/21/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logginTapped(sender: AnyObject) {
        do{
            let username = try userName.text
        }catch let err as NSError{
            print("Username can't be empty!")
        }
        do{
            let password = try passWord.text
        }catch let err as NSError{
            print("Password can't be empty!")
        }
        let url:String = MH_BASE_URL + MH_USER_LOGIN_URL
        print("Login Url: \(url)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

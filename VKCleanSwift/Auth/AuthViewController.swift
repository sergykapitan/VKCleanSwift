//
//  AuthViewController.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authServise: AuthServise!

    override func viewDidLoad() {
        super.viewDidLoad()
        authServise = AppDelegate.shared().authServise
    }
    @IBAction func signInTouch() {
        authServise.wakeUpSession()
    }
    
}

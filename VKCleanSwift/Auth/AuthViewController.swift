//
//  AuthViewController.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController ,UIViewControllerTransitioningDelegate{
    
    private var authServise: AuthServise!
    var button: TKTransitionSubmitButton!
    
  //  @IBOutlet weak var btnFromNib: TKTransitionSubmitButton!
    @IBOutlet weak var imageLogo: TKTransitionSubmitButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
        

               
               button = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 64, height: 44))
               button.center = self.view.center
               button.setTitle("Sign in", for: UIControl.State())
               button.frame.bottom = self.view.frame.height - 60
               button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
               button.addTarget(self, action: #selector(AuthViewController.signInTouch(_:)), for: UIControl.Event.touchUpInside)
               button.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.7254901961, blue: 0.9529411765, alpha: 1)
             
               self.view.addSubview(button)
               button.isHidden = true
               imageLogo.animate(3) {
                self.button.isHidden = false
                self.imageLogo.isHidden = true
               }
               authServise = AppDelegate.shared().authServise
    }
    @IBAction func signInTouch(_ button: TKTransitionSubmitButton) {
        button.animate(1) {
            self.authServise.wakeUpSession()
        }
        
    }

       // MARK: UIViewControllerTransitioningDelegate
       func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
           return TKFadeInAnimator(transitionDuration: 0.5, startingAlpha: 0.8)
       }
       
       func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
           return nil
       }
    
}

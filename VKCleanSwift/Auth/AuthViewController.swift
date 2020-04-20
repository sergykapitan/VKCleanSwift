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
    var btn: TKTransitionSubmitButton!
    var button: TKTransitionSubmitButton!
    
  //  @IBOutlet weak var btnFromNib: TKTransitionSubmitButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
        

//               let bg = UIImageView(image: UIImage(named: "Login"))
//               bg.frame = self.view.frame
//               self.view.addSubview(bg)

//               btn = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 64, height: 44))
//               btn.center = self.view.center
//              // btn.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.7254901961, blue: 0.9529411765, alpha: 1)
//               btn.frame.bottom = self.view.frame.height - 60
//               btn.setTitle("Sign in", for: UIControl.State())
//               btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
//               btn.addTarget(self, action: #selector(AuthViewController.signInTouch(_:)), for: UIControl.Event.touchUpInside)
//               self.view.addSubview(btn)
        
              
        
               button = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 64, height: 44))
               button.center = self.view.center
               button.setTitle("Sign in", for: UIControl.State())
               button.frame.bottom = self.view.frame.height - 60
               button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
               button.addTarget(self, action: #selector(AuthViewController.signInTouch(_:)), for: UIControl.Event.touchUpInside)
               button.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.7254901961, blue: 0.9529411765, alpha: 1)
             
               self.view.addSubview(button)
        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let verticalConstraint = button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        let widthConstraint = button.widthAnchor.constraint(equalToConstant: 100)
//        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 100)
//        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        
        
        
        

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

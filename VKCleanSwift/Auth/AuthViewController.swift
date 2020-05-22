//
//  AuthViewController.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    //MARK: - Property
    private var authServise: AuthServise!
    var button: TKTransitionSubmitButton!
    let splashImage = UIImageView(image: UIImage(named: "drib"))
    let splashView = UIView()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    //MARK: - ViewLifeCicle
    override func viewDidAppear(_ animated: Bool) {
        startLoadingAnimationLaunchScreen()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - setup
    func setup() {
        button = TKTransitionSubmitButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 64, height: 44))
        button.center = self.view.center
        button.setTitle("Sign in", for: UIControl.State())
        button.frame.bottom = self.view.frame.height - 60
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        button.addTarget(self, action: #selector(AuthViewController.signInTouch(_:)), for: UIControl.Event.touchUpInside)
        button.backgroundColor = UIColor.systemTeal// colorLiteral(red: 0.3333333333, green: 0.7254901961, blue: 0.9529411765, alpha: 1)
        
        self.view.addSubview(button)
        button.isHidden = true
        
        splashView.backgroundColor = UIColor.systemTeal
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        splashImage.contentMode = .scaleAspectFit
        splashView.addSubview(splashImage)
        splashImage.frame = CGRect(x: splashView.frame.midX - 75, y: splashView.frame.midY - 75, width: 150, height: 150)
        
        authServise = AppDelegate.shared().authServise
    }
  
    
    //MARK: - Action
    @IBAction func signInTouch(_ button: TKTransitionSubmitButton) {
        button.animate(2.5) {
            self.authServise.wakeUpSession()
        }
        
    }

    // MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
           return TKFadeInAnimator(transitionDuration: 0.5, startingAlpha: 0.8)
       }
       
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
           return nil
       }
    
}
extension AuthViewController: UIViewControllerTransitioningDelegate {
    func startLoadingAnimationLaunchScreen() {
          scaleDownAnimationLaunchScreen()
      }
    
      func scaleDownAnimationLaunchScreen() {
          UIView.animate(withDuration: 1.0, delay: 0.1,options: .curveLinear, animations: {
            self.splashImage.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            
              }){( success ) in
                     self.scaleUpAnimationLaunchScreen()
                 }
             }
             
      func rotateAnimationLaunchScreen() {
          UIView.animate(withDuration: 0.5, animations: {
            self.splashImage.transform = CGAffineTransform(rotationAngle: CGFloat(-15))
              }) { (succes) in
                     
                 }
             }
          
      func scaleUpAnimationLaunchScreen() {
                 UIView.animate(withDuration: 0.35, delay: 0.2, options: .curveLinear, animations: {
                    self.splashImage.removeFromSuperview()
                    // self.splashImage.transform = CGAffineTransform(scaleX: 5, y: 5)
                    // self.spiner.stopAnimation()
                 }) { (success) in
                     self.removeSplashScreenLaunchScreen()
                 }
             }
             
      func removeSplashScreenLaunchScreen () {
                 splashView.removeFromSuperview()
        button.isHidden = false
             }
}

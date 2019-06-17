//
//  AuthServise.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation
import VKSdkFramework


protocol AuthServiseDelegate: class {
    func authServiseSholdShow (_ viewController: UIViewController)
    func authServiseSignIn()
    func authServiseDidSignInFail()
}

final class AuthServise: NSObject, VKSdkDelegate, VKSdkUIDelegate {

  
    private let appId = "7024154"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiseDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super .init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) {[mydelegate = delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                mydelegate?.authServiseSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("auth problem, state \(state) error \(String(describing: error))")
                mydelegate?.authServiseDidSignInFail()
            }
        }
        
    }
    
    // MARK: VKSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        
        if result != nil {
            delegate?.authServiseSignIn()
        }
        
    }
    
    func vkSdkUserAuthorizationFailed() {
         print(#function)
    }
    //MARK: VKSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
         print(#function)
        delegate?.authServiseSholdShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
         print(#function)
    }
    
}

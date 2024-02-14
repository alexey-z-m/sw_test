//
//  LoginRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: LoginViewController?
    
    func login() {
        let vc = ListModuleBuilder.build()
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .fullScreen
        viewController?.present(navigationVC, animated: false)
    }
    
    func register() {
        let vc = RegisterModuleBuilder.build()
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .fullScreen
        viewController?.present(navigationVC, animated: false)
    }
}

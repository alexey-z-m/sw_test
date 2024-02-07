//
//  LoginRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterLoginProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = LoginViewController()
        
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LoginInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

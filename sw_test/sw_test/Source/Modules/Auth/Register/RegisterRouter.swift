//
//  RegisterRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation
import UIKit

class RegisterRouter: PresenterToRouterRegisterProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = RegisterViewController()
        
        let presenter: ViewToPresenterRegisterProtocol & InteractorToPresenterRegisterProtocol = RegisterPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RegisterRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RegisterInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

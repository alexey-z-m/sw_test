//
//  MenuRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation
import UIKit

class MenuRouter: PresenterToRouterMenuProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MenuViewController()
        
        let presenter: ViewToPresenterMenuProtocol & InteractorToPresenterMenuProtocol = MenuPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MenuRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MenuInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

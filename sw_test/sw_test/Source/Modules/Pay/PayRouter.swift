//
//  PayRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation
import UIKit

class PayRouter: PresenterToRouterPayProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PayViewController()
        
        let presenter: ViewToPresenterPayProtocol & InteractorToPresenterPayProtocol = PayPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PayRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PayInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

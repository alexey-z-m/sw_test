//
//  MapRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation
import UIKit

class MapRouter: PresenterToRouterMapProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MapViewController()
        
        let presenter: ViewToPresenterMapProtocol & InteractorToPresenterMapProtocol = MapPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MapRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MapInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

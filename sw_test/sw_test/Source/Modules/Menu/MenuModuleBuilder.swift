//
//  MenuModuleBuilder.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class MenuModuleBuilder {

    static func build(idCafe: Int) -> UIViewController {
        let interactor = MenuInteractor(idCafe: idCafe)
        let router = MenuRouter()
        let presenter = MenuPresenter(interactor: interactor, router: router)
        let viewController = MenuViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

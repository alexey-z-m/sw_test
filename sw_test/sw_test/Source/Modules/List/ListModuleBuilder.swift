//
//  ListModuleBuilder.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class ListModuleBuilder {

    static func build() -> UIViewController {
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(interactor: interactor, router: router)
        let viewController = ListViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

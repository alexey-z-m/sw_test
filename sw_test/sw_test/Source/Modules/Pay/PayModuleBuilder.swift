//
//  PayModuleBuilder.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class PayModuleBuilder {

    static func build(orderedItems: [ItemModel]) -> UIViewController {
        let interactor = PayInteractor(orderedItems: orderedItems)
        let router = PayRouter()
        let presenter = PayPresenter(interactor: interactor, router: router)
        let viewController = PayViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}

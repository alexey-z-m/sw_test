//
//  PayRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation
import UIKit

class PayRouter: PayRouterProtocol {

    weak var viewController: PayViewController?

    func pay() {
        let vc = ListModuleBuilder.build()
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .fullScreen
        viewController?.present(navigationVC, animated: false)
    }
}

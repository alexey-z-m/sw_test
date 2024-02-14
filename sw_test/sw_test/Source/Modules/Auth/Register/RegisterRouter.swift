//
//  RegisterRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation
import UIKit

class RegisterRouter: RegisterRouterProtocol {

    weak var viewController: RegisterViewController?

    func registerProfile() {
        let vc = ListModuleBuilder.build()
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .fullScreen
        viewController?.present(navigationVC, animated: false)
    }
}

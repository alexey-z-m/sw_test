//
//  MenuRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation
import UIKit

class MenuRouter: MenuRouterProtocol {

    weak var viewController: MenuViewController?

    func pay() {
        let vc = PayModuleBuilder.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

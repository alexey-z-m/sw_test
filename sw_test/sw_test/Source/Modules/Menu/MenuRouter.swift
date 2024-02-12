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

    func pay(orderedItems: [(item: MenuModel, count: Int)]) {
        let vc = PayModuleBuilder.build(orderedItems: orderedItems)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

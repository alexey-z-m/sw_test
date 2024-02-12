//
//  ListRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation
import UIKit

class ListRouter: ListRouterProtocol {

    weak var viewController: ListViewController?

    func map() {
        let vc = MapModuleBuilder.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    func menu(idCafe: Int) {
        let vc = MenuModuleBuilder.build(idCafe: idCafe)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

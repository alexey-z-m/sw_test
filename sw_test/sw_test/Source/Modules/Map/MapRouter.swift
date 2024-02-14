//
//  MapRouter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation
import UIKit

class MapRouter: MapRouterProtocol {
    
    func menu(idCafe: Int) {
        let vc = MenuModuleBuilder.build(idCafe: idCafe)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    weak var viewController: MapViewController?

    
}

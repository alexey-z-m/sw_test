//
//  MenuViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMenuProtocol?
    
}

extension MenuViewController: PresenterToViewMenuProtocol{
    // TODO: Implement View Output Methods
}

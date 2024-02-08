//
//  MenuViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Properties
    var presenter: MenuPresenterProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupHierarchy()
    }
    
    //MARK: - Funcs
    func setupLayout() {

    }

    func setupHierarchy() {

    }
}

extension MenuViewController: MenuViewProtocol{
    // TODO: Implement View Output Methods
}

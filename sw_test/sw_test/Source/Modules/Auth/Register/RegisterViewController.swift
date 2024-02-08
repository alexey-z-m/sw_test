//
//  RegisterViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Properties
    var presenter: RegisterPresenterProtocol?

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

extension RegisterViewController: RegisterViewProtocol{
    // TODO: Implement View Output Methods
}

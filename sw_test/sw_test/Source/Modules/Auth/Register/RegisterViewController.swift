//
//  RegisterViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterRegisterProtocol?
    
}

extension RegisterViewController: PresenterToViewRegisterProtocol{
    // TODO: Implement View Output Methods
}

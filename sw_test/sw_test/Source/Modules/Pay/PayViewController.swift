//
//  PayViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class PayViewController: UIViewController {

    // MARK: - Properties
    var presenter: PayPresenterProtocol?

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

extension PayViewController: PayViewProtocol{
    // TODO: Implement View Output Methods
}

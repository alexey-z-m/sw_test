//
//  ListViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class ListViewController: UIViewController {

    // MARK: - Properties
    var presenter: ListPresenterProtocol?

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

extension ListViewController: ListViewProtocol{
    // TODO: Implement View Output Methods
}

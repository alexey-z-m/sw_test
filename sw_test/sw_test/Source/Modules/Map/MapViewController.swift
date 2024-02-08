//
//  MapViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class MapViewController: UIViewController {

    // MARK: - Properties
    var presenter: MapPresenterProtocol?

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

extension MapViewController: MapViewProtocol{
    // TODO: Implement View Output Methods
}

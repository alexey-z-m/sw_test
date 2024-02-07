//
//  MapViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import UIKit

class MapViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterMapProtocol?
    
}

extension MapViewController: PresenterToViewMapProtocol{
    // TODO: Implement View Output Methods
}

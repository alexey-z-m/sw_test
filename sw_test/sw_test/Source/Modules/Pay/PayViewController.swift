//
//  PayViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import UIKit

class PayViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterPayProtocol?
    
}

extension PayViewController: PresenterToViewPayProtocol{
    // TODO: Implement View Output Methods
}

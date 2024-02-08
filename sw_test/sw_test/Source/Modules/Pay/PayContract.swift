//
//  PayContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol PayViewProtocol: AnyObject {

}

protocol PayPresenterProtocol {
    
    var view: PayViewProtocol? { get set }
    var interactor: PayInteractorProtocol { get set }
    var router: PayRouterProtocol { get set }
}

protocol PayInteractorProtocol {

    var presenter: PayPresenterProtocol? { get set }
}

protocol PayRouterProtocol {

}

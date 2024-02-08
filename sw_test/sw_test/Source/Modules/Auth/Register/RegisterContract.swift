//
//  RegisterContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol RegisterViewProtocol: AnyObject {

}

protocol RegisterPresenterProtocol {
    
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorProtocol { get set }
    var router: RegisterRouterProtocol { get set }
}

protocol RegisterInteractorProtocol {

    var presenter: RegisterPresenterProtocol? { get set }
}

protocol RegisterRouterProtocol {

}

//
//  LoginContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol LoginViewProtocol: AnyObject {

}

protocol LoginPresenterProtocol {
    func register()
    func login()
}

protocol LoginInteractorProtocol: AnyObject {

    var presenter: LoginPresenterProtocol? { get set }
}

protocol LoginRouterProtocol {
    func register()
    func login()
}

//
//  LoginInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {

    // MARK: Properties
    var presenter: LoginPresenterProtocol?

    func login(login: String, password: String, completion: @escaping (Result<TokenModel, Error>) -> ()) {
        Network.shared.login(login: login, password: password) { result in
            completion(result)
        }
    }
}

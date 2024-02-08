//
//  MenuContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol MenuViewProtocol: AnyObject {

}

protocol MenuPresenterProtocol {
    
    var view: MenuViewProtocol? { get set }
    var interactor: MenuInteractorProtocol { get set }
    var router: MenuRouterProtocol { get set }

    func pay()
}

protocol MenuInteractorProtocol {

    var presenter: MenuPresenterProtocol? { get set }
}

protocol MenuRouterProtocol {
    func pay()
}

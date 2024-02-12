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

    func pay()
}

protocol PayInteractorProtocol {

    var presenter: PayPresenterProtocol? { get set }
    var orderedItems: [(item: MenuModel, count: Int)] { get }
}

protocol PayRouterProtocol {
    func pay()
}

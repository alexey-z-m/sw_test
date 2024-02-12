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

    func viewDidLoad()

    func pay()

    func plusItem(item: MenuModel)
    func minusItem(item: MenuModel)
}

protocol MenuInteractorProtocol {

    var presenter: MenuPresenterProtocol? { get set }
    var orderedItems: [(item: MenuModel, count: Int)] { get }

    func getMenu()

    func plusItem(item: MenuModel)
    func minusItem(item: MenuModel)
}

protocol MenuRouterProtocol {
    func pay()
}

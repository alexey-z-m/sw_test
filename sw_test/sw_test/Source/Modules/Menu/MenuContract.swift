//
//  MenuContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation
import UIKit

protocol MenuViewProtocol: AnyObject {
    var collectionView: UICollectionView { get }
}

protocol MenuPresenterProtocol: AnyObject, ItemDelegate {

    var view: MenuViewProtocol? { get set }
    var interactor: MenuInteractorProtocol { get set }
    var router: MenuRouterProtocol { get set }

    func viewDidLoad()

    func pay()
}

protocol MenuInteractorProtocol {

    var presenter: MenuPresenterProtocol? { get set }
    var menuItems: [ItemModel] { get }

    func getMenu(completion: @escaping(Result<[MenuModel],Error>) -> ())

    func plusItem(item: MenuModel)
    func minusItem(item: MenuModel)
}

protocol MenuRouterProtocol {
    func pay(orderedItems: [ItemModel])
}

protocol ItemDelegate: AnyObject {
    func plusItem(item: MenuModel)
    func minusItem(item: MenuModel)
}

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

    func getMenu(completion: @escaping(Result<[MenuModel],Error>) -> ())

    func plusItem(item: MenuModel)
    func minusItem(item: MenuModel)
}

protocol MenuRouterProtocol {
    func pay()
}

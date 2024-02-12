//
//  ListContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol ListViewProtocol: AnyObject {

}

protocol ListPresenterProtocol {
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorProtocol { get set }
    var router: ListRouterProtocol { get set }
    
    func viewDidLoad()
    func map()
    func menu()

}

protocol ListInteractorProtocol {

    var presenter: ListPresenterProtocol? { get set }
    var cafeList: [LocationsModel] { get }
    func getCafeList()
}

protocol ListRouterProtocol {
    func map()
    func menu()
}

//
//  ListContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation
import UIKit

protocol ListViewProtocol: AnyObject {
    var tableView: UITableView { get }
}

protocol ListPresenterProtocol {
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorProtocol { get set }
    var router: ListRouterProtocol { get set }
    
    func viewDidLoad()
    func map()
    func menu(idCafe: Int)

}

protocol ListInteractorProtocol {

    var presenter: ListPresenterProtocol? { get set }
    var cafeList: [LocationsModel] { get }
    func getCafeList(completion: @escaping (Result<[LocationsModel],Error>) -> ()) 
}

protocol ListRouterProtocol {
    func map(cafeList: [LocationsModel])
    func menu(idCafe: Int)
}

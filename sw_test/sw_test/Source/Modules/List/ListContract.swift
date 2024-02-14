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

protocol ListPresenterProtocol: AnyObject, ListCellDelegate {
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
    func getDistanceSring(point: LocPointModel) -> String
}

protocol ListRouterProtocol {
    func map(cafeList: [LocationsModel])
    func menu(idCafe: Int)
}

protocol ListCellDelegate: AnyObject {
    func getDistanceSring(point: LocPointModel) -> String
}

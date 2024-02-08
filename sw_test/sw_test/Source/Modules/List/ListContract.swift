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
    
}

protocol ListInteractorProtocol {

    var presenter: ListPresenterProtocol? { get set }
}

protocol ListRouterProtocol {

}

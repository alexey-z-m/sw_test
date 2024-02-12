//
//  ListInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation

class ListInteractor: ListInteractorProtocol {

    var presenter: ListPresenterProtocol?
    var cafeList: [LocationsModel] = []

    func getCafeList(completion: @escaping (Result<[LocationsModel],Error>) -> ())  {
        Network.shared.getCafes { [weak self] result in
            switch result {
            case .success(let cafes):
                self?.cafeList = cafes
                completion(.success(cafes))
            case .failure(_): print("getCafeList fail")
            }
        }
    }
}

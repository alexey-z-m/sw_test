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

    func getCafeList() {
        cafeList.append(LocationsModel(id: 1, name: "Раз", point: LocPointModel(latitude: "", longitude: "")))
        cafeList.append(LocationsModel(id: 1, name: "Два", point: LocPointModel(latitude: "", longitude: "")))
        cafeList.append(LocationsModel(id: 1, name: "Три", point: LocPointModel(latitude: "", longitude: "")))
    }
}

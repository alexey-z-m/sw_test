//
//  MapInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class MapInteractor: MapInteractorProtocol {

    var presenter: MapPresenterProtocol?

    private var cafeList: [LocationsModel]

    init(cafeList: [LocationsModel]) {
        self.cafeList = cafeList
    }

    func getCafes() -> [LocationsModel] {
        return cafeList
    }

    

}

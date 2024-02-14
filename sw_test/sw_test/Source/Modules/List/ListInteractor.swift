//
//  ListInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation
import YandexMapsMobile
import CoreLocation

class ListInteractor: ListInteractorProtocol {

    var presenter: ListPresenterProtocol?
    var cafeList: [LocationsModel] = []
    let locationManager = CLLocationManager()

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

    func getDistanceSring(point: LocPointModel) -> String {
        let myLocation = locationManager.location?.coordinate
        let curentPoint = YMKPoint(latitude: Double(myLocation?.latitude ?? 0), longitude: Double(myLocation?.longitude ?? 0))
        let cafePoint = YMKPoint(
            latitude: Double(point.latitude) ?? 0,
            longitude: Double(point.longitude) ?? 0)
        //print("\(curentPoint.latitude):\(curentPoint.longitude) | \(cafePoint.latitude):\(cafePoint.longitude)")
        let distance = YMKDistance(curentPoint, cafePoint) / 1000
        return String(format: "%.2f", distance) + " км. от вас"
    }
}

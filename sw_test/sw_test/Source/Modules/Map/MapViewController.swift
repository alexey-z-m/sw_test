//
//  MapViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import UIKit
import YandexMapsMobile
import CoreLocation

class MapViewController: UIViewController {

    // MARK: - Properties
    var presenter: MapPresenterProtocol?
    lazy var mapView = MapView()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Funcs
    func setupLayout() {
        view.backgroundColor = UIColor.white
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        mapView.mapYMK.mapWindow.map.move(
            with: YMKCameraPosition.init(target: YMKPoint(latitude: 44.65, longitude: 44.85), zoom: 9, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: YMKAnimationType.smooth, duration: 2)
        )

    }

    func setupHierarchy() {
        view.addSubview(mapView)
    }

    func setupNavigationBar() {
        title = "Меню"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.98, green: 0.976, blue: 0.976, alpha: 1)
        let titleAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        ]
        appearance.titleTextAttributes = titleAttribute
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = CustomColors.brown
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

extension MapViewController: MapViewProtocol{

    private func addPlacemark(_ map: YMKMap, cafe: LocationsModel) {
        let image = UIImage(named: "coffe") ?? UIImage()
        let placemark = map.mapObjects.addPlacemark()
        placemark.geometry = YMKPoint(
            latitude: Double(cafe.point.latitude) ?? 0,
            longitude: Double(cafe.point.longitude) ?? 0
        )
        let iconStyle = YMKIconStyle()
        iconStyle.scale = 0.6
        placemark.setIconWith(image, style: iconStyle)
        placemark.setTextWithText(
            cafe.name,
            style: YMKTextStyle(
                size: 12,
                color: CustomColors.brown,
                outlineColor: .white,
                placement: .bottom,
                offset: 0.0,
                offsetFromIcon: true,
                textOptional: false)
        )
        placemark.userData = cafe.id
        placemark.addTapListener(with: self)

    }

    func addPoints(cafesList: [LocationsModel]) {
        cafesList.forEach { cafe in
            addPlacemark(
                mapView.mapYMK.mapWindow.map,
                cafe: cafe
            )
        }
    }
}

extension MapViewController: YMKMapObjectTapListener {
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        guard let placamark = mapObject as? YMKPlacemarkMapObject else { return false }
        self.focusOnPoint(placamark.geometry)
        guard let id = placamark.userData as? Int else { return false }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.menu(idCafe: id)
        }
        return true
    }

    func focusOnPoint(_ point: YMKPoint) {
        mapView.mapYMK.mapWindow.map.move(
            with: YMKCameraPosition(target: point, zoom: 9, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: YMKAnimationType.smooth, duration: 1)
        )
    }


}

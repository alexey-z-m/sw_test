//
//  MapViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import UIKit
import YandexMapsMobile

class MapViewController: UIViewController {

    // MARK: - Properties
    var presenter: MapPresenterProtocol?
    lazy var mapView = MapView()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
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
            with: YMKCameraPosition.init(target: YMKPoint(latitude: 55.753921, longitude: 37.620709), zoom: 14, azimuth: 0, tilt: 0),
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

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

extension MapViewController: MapViewProtocol{
    // TODO: Implement View Output Methods
}

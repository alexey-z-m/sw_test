//
//  MapView.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 09.02.2024.
//

import UIKit
import YandexMapsMobile

class MapView: UIView {
    lazy var mapYMK: YMKMapView = {
        let map = YMKMapView()
        return map
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func setupHierarchy() {
        addSubview(mapYMK)
    }

    func setupLayout() {

    }
}

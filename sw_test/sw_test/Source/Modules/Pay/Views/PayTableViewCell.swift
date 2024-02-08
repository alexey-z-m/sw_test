//
//  PayTableViewCell.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//

import UIKit

class PayTableViewCell: UITableViewCell {
    static let identifier = "PayTableViewCell"

    let rectangle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.96, green: 0.9, blue: 0.82, alpha: 1)
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Капучино"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "200 руб"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(red: 0.686, green: 0.58, blue: 0.475, alpha: 1)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(rectangle)
        rectangle.addSubview(nameLabel)
        rectangle.addSubview(priceLabel)

        rectangle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(6)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure() {

    }

}

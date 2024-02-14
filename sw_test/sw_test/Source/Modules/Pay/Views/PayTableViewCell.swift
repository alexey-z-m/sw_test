//
//  PayTableViewCell.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//

import UIKit

class PayTableViewCell: UITableViewCell {
    static let identifier = "PayTableViewCell"

    weak var delegate: ItemDelegate?
    var item: MenuModel?

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

    lazy var minus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = CustomColors.brown
        button.addTarget(self, action: #selector(minusButton), for: .touchUpInside)
        return button
    }()

    let amount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = CustomColors.brown
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    lazy var plus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = CustomColors.brown
        button.addTarget(self, action: #selector(plusButton), for: .touchUpInside)
        return button
    }()

    let stackAmount: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 9
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        selectionStyle = .none

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

    private func setupHierarchy() {
        addSubview(rectangle)
        rectangle.addSubview(nameLabel)
        rectangle.addSubview(priceLabel)
        contentView.addSubview(stackAmount)
        stackAmount.addArrangedSubview(minus)
        stackAmount.addArrangedSubview(amount)
        stackAmount.addArrangedSubview(plus)
    }
    private func setupLayout() {
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
        stackAmount.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(model: ItemModel) {
        self.item = model.item
        amount.text = String(model.count)
        nameLabel.text = model.item.name
        priceLabel.text = String(format: "%.2f", model.item.price * Double(model.count))
    }

    @objc func minusButton() {
        let count = Int(amount.text ?? "0") ?? 0
        if count > 0 {
            guard let item else { return }
            delegate?.minusItem(item: item)
            amount.text = String(count - 1)
            priceLabel.text = String(format: "%.2f", item.price * Double(count - 1))
        }
    }
    
    @objc func plusButton() {
        let count = Int(amount.text ?? "0") ?? 0
        guard let item else { return }
        delegate?.plusItem(item: item)
        amount.text = String(count + 1)
        priceLabel.text = String(format: "%.2f", item.price * Double(count + 1))
    }

}

//
//  MenuCollectionViewCell.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"

    weak var delegate: MenuPresenter?
    var item: MenuModel?

    let cell: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        return view
    }()

    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let itemName: UILabel = {
        let label = UILabel()
        label.text = "Горячий шоколад"
        label.textColor = UIColor(red: 0.686, green: 0.58, blue: 0.475, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()

    let price: UILabel = {
        let label = UILabel()
        label.text = "200 руб"
        label.textColor = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    lazy var minus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
        button.addTarget(self, action: #selector(minusButton), for: .touchUpInside)
        return button
    }()

    let amount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    lazy var plus: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
        button.addTarget(self, action: #selector(plusButton), for: .touchUpInside)
        return button
    }()

    let stackAmount: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 9
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        addSubview(cell)
        addSubview(image)
        addSubview(itemName)
        addSubview(price)
        contentView.addSubview(stackAmount)
        stackAmount.addArrangedSubview(minus)
        stackAmount.addArrangedSubview(amount)
        stackAmount.addArrangedSubview(plus)
    }

    private func setupLayout() {
        cell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(contentView.bounds.size.width * 0.825)
        }
        itemName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().inset(11)
            make.top.equalTo(image.snp.bottom).offset(10)
        }
        price.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(11)
            make.top.equalTo(itemName.snp.bottom).offset(12)
        }
        stackAmount.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(11)
            make.top.equalTo(itemName.snp.bottom).offset(12)
        }

    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(item: MenuModel?) {
        guard let item else { return }
        self.item = item
        itemName.text = item.name
        price.text = String(item.price)
        //backgroundColor = UIColor.red
    }

    @objc func minusButton() {
        let count = Int(amount.text ?? "0") ?? 0
        if count > 0 {
            guard let item else { return }
            delegate?.minusItem(item: item)
            amount.text = String(count - 1)
        } else {
            amount.isEnabled = true
        }
    }

    @objc func plusButton() {
        guard let item else { return }
        delegate?.plusItem(item: item)
        amount.text = String((Int(amount.text ?? "0") ?? 0) + 1)
    }
}

//
//  PayViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import UIKit

class PayViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: PayPresenterProtocol?
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.selectionFollowsFocus = false
        tableView.register(PayTableViewCell.self, forCellReuseIdentifier: PayTableViewCell.identifier)
        return tableView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
        button.addTarget(self, action: #selector(pay), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1)
        button.layer.cornerRadius = 23.5
        return button
    }()

    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.text = "Время ожидания заказа\n 15 минут!\n Спасибо, что выбрали нас."
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = CustomColors.brown
        label.textAlignment = .center
        return label
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Funcs
    func setupLayout() {
        view.backgroundColor = UIColor.white
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(105)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(19)
            make.trailing.equalToSuperview().offset(-19)
            make.bottom.equalToSuperview().inset(47)
            make.height.equalTo(47)
        }
        label.snp.makeConstraints { make in
            make.bottom.equalTo(button.snp.top).offset(-100)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupHierarchy() {
        view.addSubview(tableView)
        view.addSubview(button)
        view.addSubview(label)
    }
    
    func setupNavigationBar() {
        title = "Ваш заказ"
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
    
    @objc func pay() {
        presenter?.pay()
    }

}

extension PayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        77
    }
}

extension PayViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        presenter?.interactor.orderedItems.forEach{ item in
            if item.count > 0 {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PayTableViewCell.identifier,
            for: indexPath
        ) as? PayTableViewCell else {
            return UITableViewCell()
        }
        guard let model = presenter?.interactor.orderedItems[indexPath.item] else { return UITableViewCell() }
        cell.configure(model: model)
        cell.delegate = presenter
        return cell
    }
}

extension PayViewController: PayViewProtocol{
    // TODO: Implement View Output Methods
}

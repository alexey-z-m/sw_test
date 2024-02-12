//
//  ListViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import UIKit
import SnapKit

class ListViewController: UIViewController {

    // MARK: - Properties
    var presenter: ListPresenterProtocol?

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.selectionFollowsFocus = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        return tableView
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("На карте", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
        button.addTarget(self, action: #selector(map), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1)
        button.layer.cornerRadius = 23.5
        return button
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
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
    }

    func setupHierarchy() {
        view.addSubview(tableView)
        view.addSubview(button)
    }

    func setupNavigationBar() {
        title = "Ближайшие кофейни"
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

    @objc func map() {
        presenter?.map()
    }
}

extension ListViewController: ListViewProtocol{
    // TODO: Implement View Output Methods
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.interactor.cafeList.count ?? 0

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ListTableViewCell.identifier,
            for: indexPath
        ) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(cafe: presenter?.interactor.cafeList[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row \(indexPath)")
        guard let id = presenter?.interactor.cafeList[indexPath.item].id else { return }
        presenter?.menu(idCafe: id)
    }

}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        77
    }
}

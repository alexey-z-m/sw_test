//
//  MenuViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {

    // MARK: - Properties
    var presenter: MenuPresenterProtocol?

    private lazy var layout = getLayout()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collectionView.allowsSelection = false
        return collectionView
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Перейти к оплате", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
        button.addTarget(self, action: #selector(pay), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1)
        button.layer.cornerRadius = 23.5
        return button
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Funcs
    func setupLayout() {
        view.backgroundColor = UIColor.white
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        view.addSubview(collectionView)
        view.addSubview(button)
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

    func getLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 90, right: 16)
        let width = (view.frame.size.width / 2) - 10 - 13
        let height = width * 1.24
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 13
        layout.minimumInteritemSpacing = 13
        return layout
    }

    @objc func pay() {
        presenter?.pay()
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.interactor.menuItems.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuCollectionViewCell.identifier,
            for: indexPath
        ) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(item: presenter?.interactor.menuItems[indexPath.item].item)
        cell.delegate = presenter
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select cell \(indexPath)")
    }
}

extension MenuViewController: MenuViewProtocol{
    
}

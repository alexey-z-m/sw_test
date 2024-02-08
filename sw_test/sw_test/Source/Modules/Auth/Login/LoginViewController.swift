//
//  LoginViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Properties
    var presenter: LoginPresenterProtocol?

    // MARK: - Views
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .equalSpacing
        return stack
    }()

    let emailVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7.5
        return stack
    }()

    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "e-mail"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = CustomColors.brown
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@example.ru"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: 1))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = CustomColors.darkBrown.cgColor
        textField.layer.cornerRadius = 23.5
        return textField
    }()

    let passwordVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7.5
        return stack
    }()

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = CustomColors.brown
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "*****"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: 1))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = CustomColors.darkBrown.cgColor
        textField.layer.cornerRadius = 23.5
        return textField
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Логин", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = CustomColors.lightBrown
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.backgroundColor = CustomColors.darkBrown
        button.layer.cornerRadius = 23.5
        return button
    }()

    lazy var buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.tintColor = CustomColors.darkBrown
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
        button.layer.cornerRadius = 23.5
        return button
    }()

    // MARK: - Funcs
    func setupNavigationBar() {
        title = "Вход"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CustomColors.navigationBarColor
        let titleAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
            NSAttributedString.Key.foregroundColor: CustomColors.brown
        ]
        appearance.titleTextAttributes = titleAttribute
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    func setupHierarchy() {
        view.addSubview(vStack)
        vStack.addArrangedSubview(emailVStack)
        emailVStack.addArrangedSubview(emailLabel)
        emailVStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(passwordVStack)
        passwordVStack.addArrangedSubview(passwordLabel)
        passwordVStack.addArrangedSubview(passwordTextField)
        vStack.addArrangedSubview(button)
        vStack.addArrangedSubview(buttonRegister)
    }

    func setupLayout() {
        view.backgroundColor = UIColor.white
        vStack.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-19)
            make.leading.equalToSuperview().offset(19)
        }
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
        button.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
    }

    @objc func register() {
        presenter?.register()
    }

    @objc func login() {
        presenter?.login()
    }
}

extension LoginViewController: LoginViewProtocol{
    // TODO: Implement View Output Methods
}

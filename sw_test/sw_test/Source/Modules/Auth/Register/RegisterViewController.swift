//
//  RegisterViewController.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Properties
    var presenter: RegisterPresenterProtocol?

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
        label.textColor = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@example.ru"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: 1))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1).cgColor
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
        label.textColor = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "*****"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: 1))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1).cgColor
        textField.layer.cornerRadius = 23.5
        return textField
    }()

    let rePasswordVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7.5
        return stack
    }()

    let rePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Повторите пароль"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
        return label
    }()

    let rePasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "*****"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: 1))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1).cgColor
        textField.layer.cornerRadius = 23.5
        return textField
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
        button.addTarget(self, action: #selector(registerProfile), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1)
        button.layer.cornerRadius = 23.5
        return button
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Funcs

    func setupHierarchy() {
        view.addSubview(vStack)
        vStack.addArrangedSubview(emailVStack)
        emailVStack.addArrangedSubview(emailLabel)
        emailVStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(passwordVStack)
        passwordVStack.addArrangedSubview(passwordLabel)
        passwordVStack.addArrangedSubview(passwordTextField)
        vStack.addArrangedSubview(rePasswordVStack)
        rePasswordVStack.addArrangedSubview(rePasswordLabel)
        rePasswordVStack.addArrangedSubview(rePasswordTextField)
        vStack.addArrangedSubview(button)
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
        rePasswordTextField.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
        button.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
    }

    func setupNavigationBar() {
        title = "Регистрация"
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

    @objc func registerProfile() {
        presenter?.registerProfile()
    }
}

extension RegisterViewController: RegisterViewProtocol{
    // TODO: Implement View Output Methods
}

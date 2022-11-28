//
//  LoginFormViewController.swift
//  Weather
//
//  Created by Екатерина Алексеева on 22.11.2022.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    // MARK: - Visual components
    
    var scrollView = UIScrollView()
    var weatherLabel = UILabel()
    var loginLabel = UILabel()
    var passwordLabel = UILabel()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var enterButton = UIButton()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        createViews()
        addSubviews()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),                                       name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Action
    
    // Отрабатываем появление клавиатуры
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyBoardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyBoardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // Отрабатываем исчезновение клавиатуры
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    // Окончание ввода текта в поля
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    // Отрабатываем нажатие кнопки Enter
    @objc func enterButtonPresed(_ sender: UIButton) {
        let login = loginTextField.text
        let password = passwordTextField.text
        //if login == "admin" && password == "123456" {
            pushNextViewController()
//        } else {
//            showAlert()
//        }
    }
    
    // MARK: - Private Methods
    
    private func createScrollView() -> Void {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)// * 1.5)
    }
    
    private func createViews() -> Void {
        weatherLabel.translatesAutoresizingMaskIntoConstraints = true
        weatherLabel = UILabel(frame: CGRect(x: (Int(view.frame.width) - ViewSizes.labelWidth)/2,
                                             y: 60,
                                             width: ViewSizes.labelWidth,
                                             height: ViewSizes.labelHeight))
        weatherLabel.center.x = view.center.x
        weatherLabel.textAlignment = .center
        weatherLabel.font = .boldSystemFont(ofSize: 30)
        weatherLabel.text = "Weather"
        
        loginLabel = UILabel(frame: CGRect(x: (Int(scrollView.frame.width) - ViewSizes.labelWidth)/2,
                                             y: 140,
                                             width: ViewSizes.labelWidth,
                                             height: ViewSizes.labelHeight))
        loginLabel.textAlignment = .center
        loginLabel.font = .boldSystemFont(ofSize: 17)
        loginLabel.text = "Login"
        
        loginTextField = UITextField(frame: CGRect(x: (Int(view.frame.width) - ViewSizes.textFieldWidth)/2,
                                             y: 190,
                                             width: ViewSizes.textFieldWidth,
                                             height: ViewSizes.textFieldHeight))
        loginTextField.textAlignment = .left
        loginTextField.backgroundColor = .white
        loginTextField.layer.cornerRadius = 5
        loginTextField.font = .boldSystemFont(ofSize: 17)
        loginTextField.placeholder = "Enter login"
        
        passwordLabel = UILabel(frame: CGRect(x: (Int(view.frame.width) - ViewSizes.labelWidth)/2,
                                             y: 270,
                                             width: ViewSizes.labelWidth,
                                             height: ViewSizes.labelHeight))
        passwordLabel.textAlignment = .center
        passwordLabel.font = .boldSystemFont(ofSize: 17)
        passwordLabel.text = "Password"
        
        passwordTextField = UITextField(frame: CGRect(x: (Int(view.frame.width) - ViewSizes.textFieldWidth)/2,
                                             y: 320,
                                             width: ViewSizes.textFieldWidth,
                                             height: ViewSizes.textFieldHeight))
        passwordTextField.textAlignment = .left
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.font = .boldSystemFont(ofSize: 17)
        passwordTextField.placeholder = "Enter password"
        passwordTextField.isSecureTextEntry = true
        
        enterButton = UIButton(frame: CGRect(x: (Int(view.frame.width) - ViewSizes.buttonWidth)/2,
                                             y: 370,
                                             width: ViewSizes.buttonWidth,
                                             height: ViewSizes.buttonHeight))
        enterButton.titleLabel?.textAlignment = .center
        enterButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        enterButton.setTitle("Enter", for: .normal)
        enterButton.setTitleColor(.systemBlue, for: .normal)
        enterButton.setTitleColor(.clear, for: .highlighted)
        enterButton.addTarget(self, action: #selector(enterButtonPresed), for: .touchUpInside)
    }

    private func addSubviews() -> Void {
        scrollView.addSubview(weatherLabel)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(enterButton)
        view.addSubview(scrollView)
    }
    
    private func pushNextViewController() -> Void {
        let nextController = AvailableCitiesTableViewController(style: .plain)
        self.navigationItem.backButtonTitle = "To login page"
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
    
    private func showAlert() -> Void {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Введены неверные данные пользователя",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler:nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Constants

fileprivate struct ViewSizes {
    static var labelWidth = 170
    static var labelHeight = 30
    static var textFieldWidth = 250
    static var textFieldHeight = 30
    static var buttonWidth = 170
    static var buttonHeight = 30
}

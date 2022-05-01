//
//  LoginViewController.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let storedUserName:String = "chenuka@info.com"
    let storedPassword:String = "qwertyui"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToPreviousVC(_:)), for: .touchUpInside)
        loginButton.layer.cornerRadius = 5
    }

    @IBAction func loginAction(_ sender: Any) {
        
        let inputUserName = userNameTextField.text
        let inputPassword = passwordTextField.text
        
        if (inputUserName?.count == 0 || inputPassword?.count == 0){
            self.displayAlert(title: "Error", message: "User Name Or Email Cannot Be Empty")
        }else if !emailValidator(inputUserName!){
            self.displayAlert(title: "Error", message: "Please enter a valid email address")
        }else if (storedUserName != inputUserName || storedPassword != inputPassword){
            self.displayAlert(title: "Error", message: "Your username or password is incorrect")
        }else if (storedUserName == inputUserName && storedPassword == inputPassword){
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let mainTabBC = storyBoard.instantiateViewController(withIdentifier: "main_tab_bar_controller") as? MainTabBarController else {
                return
            }
            self.navigationController?.pushViewController(mainTabBC, animated: true)
        }
    }
    
}

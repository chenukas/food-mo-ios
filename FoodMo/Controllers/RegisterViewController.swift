//
//  SignupViewController.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import UIKit

class RegisterViewController: BaseViewController {
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password1TextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToPreviousVC(_:)), for: .touchUpInside)
        signupButton.layer.cornerRadius = 5
    }

    
    @IBAction func signupAction(_ sender: Any) {
        let nameInput = nameTextField.text
        let emailInput = emailTextField.text
        let password1Input = password1TextField.text
        let password2Input = password2TextField.text
        
        if nameInput?.count == 0 || emailInput?.count == 0 || password1Input?.count == 0 || password2Input?.count == 0 {
            displayAlert(title: "Error", message: "Some Fields Are Missing")
        }else if !emailValidator(emailInput!){
            displayAlert(title: "Error", message: "Invalid Email")
        }else if password1Input != password2Input{
            displayAlert(title: "Error", message: "Passwords mismatch")
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let mainTabBC = storyBoard.instantiateViewController(withIdentifier: "main_tab_bar_controller") as? MainTabBarController else {
                return
            }
            self.navigationController?.pushViewController(mainTabBC, animated: true)
        }
    }
}

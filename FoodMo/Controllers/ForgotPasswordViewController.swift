//
//  ForgotPasswordViewController.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    @IBOutlet weak var sendResetLinkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToPreviousVC(_:)), for: .touchUpInside)
        sendResetLinkButton.layer.cornerRadius = 8
        
    }

    @IBAction func resendPasswordAction(_ sender: Any) {
        let emailInput = emailTextField.text
        
        if (!emailValidator(emailInput!)){
            displayAlert(title: "Error", message: "Your email is invalid!")
        }else{
            let alert = UIAlertController(title: "Success", message: "Password reset link successfully sent to your inbox. Please check your email to continue.", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
                let mainStoryBoard = UIStoryboard(name: "Main", bundle: .main)
                guard let passwordResetVC = mainStoryBoard.instantiateViewController(withIdentifier: "reset_password_vc") as? ResetPasswordViewController else {
                    return
                }
                self.navigationController?.pushViewController(passwordResetVC, animated: true)
            }
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

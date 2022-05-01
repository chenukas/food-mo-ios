//
//  ResetPasswordViewController.swift
//  Assignment03
//
//  Created by Chenuka Virajith on 2022-04-29.
//

import UIKit

class ResetPasswordViewController: BaseViewController {

    @IBOutlet weak var password1TextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetPasswordButton.layer.cornerRadius = 8
    }
    
    @IBAction func resetPasswordAction(_ sender: Any) {
        let password1Input = password1TextField.text
        let password2Input = password2TextField.text
        
        if (password1Input?.count == 0 || password2Input?.count == 0){
            displayAlert(title: "Error", message: "Some fields are missing")
        }else if(password1Input != password2Input){
                displayAlert(title: "Error", message: "Your passwords do not match")
        }else{
            let alertController = UIAlertController(title: "Password resetted successfully", message: "Please login with your new credentials", preferredStyle: .alert)
            let successAction = UIAlertAction(title: "Go To Login >", style: .default) { (UIAlertAction) in
                let storyBoard = UIStoryboard(name: "Main", bundle: .main)
                guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "main_tab_bar_controller") as? MainTabBarController else {
                    return
                }
                self.navigationController?.pushViewController(productListVC, animated: true)
            }
            alertController.addAction(successAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

}

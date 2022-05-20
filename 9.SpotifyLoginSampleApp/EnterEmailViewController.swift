//
//  EnterEmailViewController.swift
//  9.SpotifyLoginSampleApp
//
//  Created by JIHA on 2022/05/19.
//

import Foundation
import UIKit

class EnterEmailViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextButton.layer.cornerRadius = 30
        self.nextButton.isEnabled = false
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = self.emailTextField.text == ""
        let isPasswordEmpty = self.passwordTextField.text == ""
        
        self.nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}

//
//  LoginViewController.swift
//  9.SpotifyLoginSampleApp
//
//  Created by JIHA on 2022/05/19.
//

import Foundation
import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [self.emailLoginButton, self.googleLoginButton, self.appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //NavigationBar 숨기기
        self.navigationController?.navigationBar.isHidden = true
        
        // google sign in
        GIDSignIn.sharedInstance().presentingViewController = self
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        
    }
}

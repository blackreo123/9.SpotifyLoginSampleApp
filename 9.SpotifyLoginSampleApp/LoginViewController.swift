//
//  LoginViewController.swift
//  9.SpotifyLoginSampleApp
//
//  Created by JIHA on 2022/05/19.
//

import Foundation
import UIKit
import GoogleSignIn
import Firebase

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
    }
    
    private func showMainViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.show(mainViewController, sender: nil)
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
          if let error = error {
              print("ERROR", error.localizedDescription)
            return
          }

          guard let authentication = user?.authentication,
                let idToken = authentication.idToken else { return }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

            Auth.auth().signIn(with: credential) { _, _ in
                self.showMainViewController()
            }
        }
    }
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        
    }
}

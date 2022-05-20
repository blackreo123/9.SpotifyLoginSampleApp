//
//  MainViewController.swift
//  9.SpotifyLoginSampleApp
//
//  Created by JIHA on 2022/05/19.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
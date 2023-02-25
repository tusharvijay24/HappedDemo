//
//  CreateProfileViewController.swift
//  HappedDemo
//
//  Created by Siddharth on 25/02/23.
//

import UIKit

class CreateProfileViewController: UIViewController {

    @IBOutlet weak var navigationBar: ViewNavigationBar! {
        didSet {
            navigationBar.setUpUserInterface(.back_with_title,title: "Create Profile", left_icon_color: .black)
            navigationBar.btn_Left_Icon.setImage(UIImage(named: "back"), for: .normal)
            navigationBar.btn_Left_Icon.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func backToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    

    
}

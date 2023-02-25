//
//  GetStartedViewController.swift
//  HappedDemo
//
//  Created by Tushar on 25/02/23.
//

import UIKit

class GetStartedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapGetStarted(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

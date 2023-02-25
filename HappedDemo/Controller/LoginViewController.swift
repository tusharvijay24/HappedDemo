//
//  LoginViewController.swift
//  HappedDemo
//
//  Created by Tushar on 25/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mobileNumberTxtField: UITextField!
    @IBOutlet weak var navigationBar: ViewNavigationBar! {
        didSet {
            navigationBar.setUpUserInterface(.back_with_title, left_icon_color: .black)
            navigationBar.btn_Left_Icon.addTarget(self, action: #selector(backToHomeView), for: .touchUpInside)
            navigationBar.btn_Left_Icon.setImage(UIImage(named: "back"), for: .normal)
        }
        
    }
    @IBOutlet weak var otpAlertView: UIView!
    @IBOutlet weak var otpAlertViewTxtField: UITextField!
    
    var mobileNumber = ""
    var firstTwoNumber = ""
    var lastTwoNumber = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    @IBAction func didTapRequestOTPAction(_ sender: UIButton) {
        self.fetchFirstAndLastDigits()
        if self.firstTwoNumber != "" && self.lastTwoNumber != "" {
            self.otpAlertView.isHidden = false
            self.otpAlertViewTxtField.text = "\(self.firstTwoNumber + self.lastTwoNumber)"
            let seconds = 2.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.otpAlertView.isHidden = true
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
        
    }
    
    @objc func backToHomeView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchFirstAndLastDigits() {
        self.mobileNumber = self.mobileNumberTxtField.text!
        self.firstTwoNumber = String(self.mobileNumber.prefix(2))
        self.lastTwoNumber = String(self.mobileNumber.suffix(2))
        ApplicationManager.shared.otp = "\(firstTwoNumber+lastTwoNumber)"
        ApplicationManager.shared.mobileNumber = "\(mobileNumber)"
        print(self.firstTwoNumber)
        print(self.lastTwoNumber)
        
    }
    
}

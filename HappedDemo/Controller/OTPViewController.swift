//
//  OTPViewController.swift
//  HappedDemo
//
//  Created by Tushar on 25/02/23.
//

import UIKit


class OTPViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var navigationBar: ViewNavigationBar! {
        didSet {
            navigationBar.setUpUserInterface(.back_with_title, left_icon_color: .black)
            navigationBar.btn_Left_Icon.setImage(UIImage(named: "back"), for: .normal)
            navigationBar.btn_Left_Icon.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        }
    }
    @IBOutlet weak var otpView: OTPFieldView!
    
    var loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOtpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mobileNumberLabel.text = ApplicationManager.shared.mobileNumber
    }
    
    func setupOtpView(){
        self.otpView.fieldsCount = 4
        self.otpView.filledBorderColor = #colorLiteral(red: 1, green: 0.9715420604, blue: 0.9677690864, alpha: 1)
        self.otpView.displayType = .square
        self.otpView.fieldSize = 60
        self.otpView.separatorSpace = 30
        self.otpView.defaultBackgroundColor = #colorLiteral(red: 1, green: 0.9715420604, blue: 0.9677690864, alpha: 1)
        self.otpView.filledBackgroundColor = #colorLiteral(red: 1, green: 0.9715420604, blue: 0.9677690864, alpha: 1)
        self.otpView.shouldAllowIntermediateEditing = false
        self.otpView.delegate = self
        self.otpView.defaultBorderColor = UIColor.clear
        self.otpView.initializeUI()
    }
    
    @objc func didTapSubmitAction() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateProfileViewController") as! CreateProfileViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backToLogin() {
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension OTPViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
        
        if (ApplicationManager.shared.otp) == otpString {
            submitButton.addTarget(self, action: #selector(didTapSubmitAction), for: .touchUpInside)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Your OTP is Wrong", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

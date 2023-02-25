//
//  ViewNavigationBar.swift
//  NaqiWashUser
//
//  Created by New on 14/10/22.
//

import UIKit

class ViewNavigationBar: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var btn_Left_Icon: UIButton!
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var btn_Right_Icon: UIButton!
    @IBOutlet weak var btn_SecondRight_Icon: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInilized()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInilized()
    }
    
    func setupInilized() {
        
        Bundle.main.loadNibNamed("ViewNavigationBar", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    func setUpUserInterface(_ status:NavigationBarVisibilityStatus, title:String = String(), title_first_right:String = String(), bg_color:UIColor = .white, left_icon_color:UIColor = .black, title_color:UIColor = .black) {
        
        //        UIImage(named: "play.png")
        lbl_Title.text = title
        btn_Right_Icon.setTitle(title_first_right, for: .normal)
        viewMain.backgroundColor = bg_color
        btn_Left_Icon.tintColor = left_icon_color
        lbl_Title.textColor = title_color
        if status == .show_all
        {
            btn_Left_Icon.isHidden = false
            lbl_Title.isHidden = false
            btn_Right_Icon.isHidden = false
            btn_SecondRight_Icon.isHidden = false
        }
        else if status == .only_title
        {
            btn_Left_Icon.isHidden = true
            lbl_Title.isHidden = false
            btn_Right_Icon.isHidden = true
            btn_SecondRight_Icon.isHidden = true
        }
        else if status == .back_with_title {
            
            btn_Left_Icon.isHidden = false
            lbl_Title.isHidden = false
            btn_Right_Icon.isHidden = true
            btn_SecondRight_Icon.isHidden = true
        }
        else if status == .only_title_with_firstright {
            
            btn_Left_Icon.isHidden = true
            lbl_Title.isHidden = false
            btn_Right_Icon.isHidden = false
            btn_SecondRight_Icon.isHidden = true
        }
    }
    
}

enum NavigationBarVisibilityStatus {
    case show_all, only_title, back_with_title, only_title_with_firstright
    
}

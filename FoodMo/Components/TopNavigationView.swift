//
//  TopNavigationView.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import UIKit
@IBDesignable class TopNavigationView: NibView {
    
    
    
    @IBOutlet weak var dropdownContainerView: UIView!
    
    @IBOutlet weak var rightIconContainerView: UIView!
    @IBOutlet weak var rightIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var centerLogoImageView: UIImageView!
    @IBOutlet weak var trademarkLabel: UILabel!
    @IBOutlet weak var rightIconHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightIconWidthConstraint: NSLayoutConstraint!
    
    
    @IBInspectable var flag: String = "MAIN"{
        didSet{
            if(flag == "MAIN"){
                self.centerLogoImageView.isHidden = true
                trademarkLabel.isHidden = true
                titleLabel.isHidden = true
            }else if (flag == "SUB"){
                rightIconImageView.image = UIImage(named: "ic_search")
                backButton.setImage(UIImage(named: "ic_menu"), for: .normal)
                rightIconHeightConstraint.constant = 20
                rightIconWidthConstraint.constant = 20
                titleLabel.isHidden = true
              
            }else if (flag == "TITLE"){
                    self.centerLogoImageView.isHidden = true
                    trademarkLabel.isHidden = true
                titleLabel.isHidden = false
                
            }
        }

    }
    
   
   
    
    
    
    override func layoutSubviews() {
    }

    
    private func commonInit(){
        
    }

}


class CustomButton: UIButton {

    // MARK: - Functions

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let newArea = CGRect(
            x: self.bounds.origin.x - 5.0,
            y: self.bounds.origin.y - 5.0,
            width: self.bounds.size.width + 60.0,
            height: self.bounds.size.height + 100.0
        )
        return newArea.contains(point)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
       // fatalError("init(coder:) has not been implemented")
    }
}


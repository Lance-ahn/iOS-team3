//
//  UIButtonExtension.swift
//  MarketBroccoli
//
//  Created by Hongdonghyun on 2020/03/25.
//  Copyright © 2020 Team3. All rights reserved.
//

import UIKit

extension UIButton {
  func roundPurpleBtnStyle() {
    self.setTitleColor(.white, for: .normal)
    self.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    self.backgroundColor = .kurlyPurple
    self.layer.cornerRadius = 4
  }
  
  func roundLineBtnStyle() {
    self.setTitleColor(.kurlyPurple, for: .normal)
    self.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    self.backgroundColor = .white
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.kurlyPurple.cgColor
    self.layer.cornerRadius = 4
  }
}



class RoundPurpleBtn: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .purple
    self.setTitleColor(.yellow, for: .normal)
  }
  
  convenience init(round: CGFloat) {
    self.init()
    self.layer.cornerRadius = round
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}

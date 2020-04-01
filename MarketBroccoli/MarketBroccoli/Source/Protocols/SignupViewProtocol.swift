//
//  SignupViewProtocol.swift
//  MarketBroccoli
//
//  Created by Hongdonghyun on 2020/04/01.
//  Copyright © 2020 Team3. All rights reserved.
//

import UIKit

protocol SignupViewDelegate: class {
  func idTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func secretTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func checkSecretNumberTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func nameTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func emailTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func cellphoneTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func checkingReceivingNumberTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func birthdayYearTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func birthdayMonthTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func birthdayDayTextField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool
  
  func idTextFieldDidBeginEditing(_ textField: UITextField)
  func secretTextFeildDidBeginEditing(_ textField: UITextField)
  func checkSecretNumberTextFeildDidBeginEditing(_ textField: UITextField)
  func idTextFieldEditingChanged(_ textField: UITextField, text: String)
  func checkIDButtonTouched(_ button: UIButton)
  func secretTextFeildEditingChanged(_ textField: UITextField, text: String)
  func checkSecretNumberTextFeildEditingChanged(_ textField: UITextField, text: String)
  func emailTextFeildEditingChanged(_ textField: UITextField, text: String)
  func cellphoneTextFieldEditingChanged(_ textField: UITextField, text: String)
  func receivingCellphoneNumberButtonTouched()
  func checkingCodeButtonTouched()
  func genderRoundButtonTouched(button: UIButton, noChoice: [UIButton])
  func recoAndEventRoundButtonTouched(button: UIButton, eventButton: [UIButton])
  func squareButtonTouched(button: UIButton, leftButtons: [UIButton])
  func signupButtonTouched(button: UIButton)
}

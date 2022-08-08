//
//  ViewController.swift
//  ProgramingAutoLayoutSnapkit
//
//  Created by xhieu21 on 05/08/2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    //MARK: - Create UI
    
    let btnBack: UIButton = {
        let btnBack = UIButton(type: .system)
        btnBack.setImage(UIImage(named: "btn_back"), for: .normal)
        btnBack.tintColor = .black
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        return btnBack
    }()
    
    let stepView: UIView = {
       let stepView = UIView()
        stepView.backgroundColor = UIColor.systemGray6
        stepView.layer.cornerRadius = 10
        return stepView
    }()
    
    let stepLabel: UILabel = {
        let stepLabel = UILabel()
        stepLabel.text = "Bước 1/3"
        stepLabel.font = UIFont.systemFont(ofSize: 13)
        stepLabel.textAlignment = .center
        stepLabel.textColor = UIColor.darkGray
        return stepLabel
    }()
    
    let titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.text = "Điền số điện thoại của bạn và tiếp tục"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    let inputPhoneNumberView: UIView = {
        let inputPhoneNumberView = UIView()
        inputPhoneNumberView.layer.cornerRadius = 15
        inputPhoneNumberView.layer.borderWidth = 1
        inputPhoneNumberView.layer.borderColor = UIColor.systemOrange.cgColor
        return inputPhoneNumberView
    }()
    
    let flagVN: UIImageView = {
        let flagVN = UIImageView()
        flagVN.image = UIImage(named: "flag_vn")
        return flagVN
    }()
    
    let lineView: UIView = {
       let lineView = UIView()
        lineView.backgroundColor = .systemGray3
        return lineView
    }()
    
    let phoneNumberTextFiled: UITextField = {
       let phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "Nhập số điện thoại"
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.font = UIFont.systemFont(ofSize: 15)
        phoneNumberTextField.addTarget(self, action: #selector(phoneNumberTextChanged), for: .editingChanged)
        return phoneNumberTextField
    }()
    
    let noteLabel: UILabel = {
       let noteLabel = UILabel()
        noteLabel.text = "Bạn nên sử dụng số điện thoại chính chủ để khoản vay được phê duyệt nhanh hơn !"
        noteLabel.numberOfLines = 0
        noteLabel.font = UIFont.systemFont(ofSize: 13)
        noteLabel.textAlignment = .left
        return noteLabel
    }()
    
    let bottomView: UIView = {
       let bottomView = UIView()
        return bottomView
    }()
    
    let noteLabel2: UILabel = {
       let noteLabel2 = UILabel()
        noteLabel2.text = "Bấm vào nút tiếp tục nếu bạn đồng ý với Điều khoản của Credita"
        noteLabel2.textAlignment = .center
        noteLabel2.font = UIFont.systemFont(ofSize: 13)
        noteLabel2.numberOfLines = 0
        return noteLabel2
    }()
    
    let btnNext: UIButton = {
        let btnNext = UIButton(type: .system)
        btnNext.setTitle("Tiếp tục", for: .normal)
        btnNext.setTitleColor(.white, for: .normal)
        btnNext.backgroundColor = UIColor.systemGray4
        btnNext.layer.cornerRadius = 15
        btnNext.addTarget(self, action: #selector(btnNextTapped), for: .touchUpInside)
        return btnNext
    }()
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dismissKeyboard()
        disableBtnNext()
        phoneNumberTextFiled.becomeFirstResponder()
        addConstraints()
    }
    
    //MARK: - func

    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        view.addGestureRecognizer(tap)
    }
    
    func enableBtnNext() {
        btnNext.backgroundColor = .tintColor
        btnNext.isUserInteractionEnabled = true
    }
    
    func disableBtnNext() {
        btnNext.backgroundColor = .systemGray4
        btnNext.isUserInteractionEnabled = false
    }
    
    func validatePhoneNumber() -> Bool {
        if phoneNumberTextFiled.text?.first == "0" && phoneNumberTextFiled.text!.count == 10 {
            return true
        } else { return false }
    }

}


//MARK: - Add Constraints

extension ViewController {
    func addConstraints() {
        
        //MARK: - add sub view
        view.addSubview(btnBack)
        view.addSubview(stepView)
        stepView.addSubview(stepLabel)
        view.addSubview(titleLabel)
        view.addSubview(inputPhoneNumberView)
        inputPhoneNumberView.addSubview(flagVN)
        inputPhoneNumberView.addSubview(lineView)
        inputPhoneNumberView.addSubview(phoneNumberTextFiled)
        view.addSubview(noteLabel)
        view.addSubview(bottomView)
        bottomView.addSubview(noteLabel2)
        bottomView.addSubview(btnNext)
        
        //MARK: - add constraints
        
        btnBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(16)
        }
        
        stepView.snp.makeConstraints { make in
            make.centerY.equalTo(btnBack.snp_centerY)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        stepLabel.snp.makeConstraints { make in
            make.top.equalTo(stepView.snp_top).offset(5)
            make.bottom.equalTo(stepView.snp_bottom).offset(-5)
            make.leading.equalTo(stepView.snp_leading).offset(12)
            make.trailing.equalTo(stepView.snp_trailing).offset(-12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(stepView.snp_bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-70)
        }
        
        inputPhoneNumberView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp_bottom).offset(23)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
        }
        
        flagVN.snp.makeConstraints { make in
            make.centerY.equalTo(inputPhoneNumberView.snp_centerY)
            make.leading.equalTo(inputPhoneNumberView.snp_leading).offset(16)
            make.width.height.equalTo(28)
            make.top.equalTo(inputPhoneNumberView.snp_top).offset(16)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(1)
            make.centerY.equalTo(inputPhoneNumberView.snp_centerY)
            make.leading.equalTo(flagVN.snp_trailing).offset(12)
        }
        
        phoneNumberTextFiled.snp.makeConstraints { make in
            make.leading.equalTo(lineView.snp_trailing).offset(12)
            make.trailing.equalTo(inputPhoneNumberView).offset(-16)
            make.centerY.equalTo(inputPhoneNumberView.snp_centerY)
        }
        
        noteLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(inputPhoneNumberView.snp_bottom).offset(8)
        }
        
        bottomView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        noteLabel2.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(bottomView)
        }
        
        btnNext.snp.makeConstraints() { make in
            make.top.equalTo(noteLabel2.snp_bottom).offset(24)
            make.bottom.trailing.equalTo(bottomView)
            make.leading.equalTo(bottomView)
            make.height.equalTo(44)
        }
        
    }
}




//MARK: - objc func
extension ViewController {
    
    @objc func btnBackTapped() {
        print("Back")
    }
    
    @objc func tapOnView() {
        phoneNumberTextFiled.resignFirstResponder()
    }
    
    @objc func btnNextTapped() {
        print("Next")
    }
    
    @objc func phoneNumberTextChanged() {
        if phoneNumberTextFiled.text!.count > 10 {
            phoneNumberTextFiled.text?.removeLast()
        }
        
        if validatePhoneNumber() {
            enableBtnNext()
        } else { disableBtnNext() }
        
    }
    
    
}


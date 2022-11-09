//
//  DatePickerView.swift
//  ModalPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 11/2/22.
//

import UIKit

class DatePickerView: UIView {
    
    // To dismiss the DatePickerView
    var dismissClosure: (()->())?
    
    @objc func tapHandler(_ g: UITapGestureRecognizer) -> Void {
        dismissClosure?()
    }
    
    private lazy var blurredEffectView: UIVisualEffectView = {
        
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    // To get the selected Date
    var changeClosure: ((Date)->())?
    
    @objc func didChangeDate(_ sender: UIDatePicker) -> Void {
        changeClosure?(sender.date)
    }
    
    private lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        
        datePicker.addTarget(self, action: #selector(didChangeDate(_:)), for: .valueChanged)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
        
    }()
    
    private lazy var pickerHolderView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        return view
        
    }()
    
    private func applyConstraints(){
        
        let blurredEffectViewConstraints = [
            
            blurredEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurredEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ]
        
        let pickerHolderViewConstraints = [
            
            pickerHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            pickerHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            pickerHolderView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ]
        
        let datePickerConstraints = [
        
            datePicker.topAnchor.constraint(equalTo: pickerHolderView.topAnchor, constant: 20.0),
            datePicker.leadingAnchor.constraint(equalTo: pickerHolderView.leadingAnchor, constant: 20.0),
            datePicker.trailingAnchor.constraint(equalTo: pickerHolderView.trailingAnchor, constant: -20.0),
            datePicker.bottomAnchor.constraint(equalTo: pickerHolderView.bottomAnchor, constant: -20.0)
            
        ]
        
        NSLayoutConstraint.activate(blurredEffectViewConstraints)
        NSLayoutConstraint.activate(pickerHolderViewConstraints)
        NSLayoutConstraint.activate(datePickerConstraints)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)
        
        applyConstraints()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)
        
        applyConstraints()
    }
    
}

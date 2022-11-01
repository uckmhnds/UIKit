//
//  DatePicker.swift
//  Button
//
//  Created by Abdurrahman Gazi Yavuz on 11/1/22.
//

import UIKit



class DatePicker: UIStackView {
    
    private lazy var calendarPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.minuteInterval = 5
        picker.countDownDuration = 4500
        return picker
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.minuteInterval = 5
        picker.countDownDuration = 4500
        return picker
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        isLayoutMarginsRelativeArrangement = true
        alignment = .center
        axis = .horizontal
        spacing = 12
        
        addArrangedSubview(calendarPicker)
        addArrangedSubview(timePicker)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

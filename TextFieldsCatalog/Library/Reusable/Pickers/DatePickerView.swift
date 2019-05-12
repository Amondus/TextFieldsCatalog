//
//  DatePickerView.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 12/05/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit

/// Custom input view for text fields with UIDatePicker.
/// Have date picker and top view with custom "return" button.
public final class DatePickerView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let topViewHeight: CGFloat = 47
    }

    // MARK: - Properties

    public let datePicker = UIDatePicker()

    // MARK: - Private Properties

    private weak var textField: DateTextField?
    private var dateFormat = "dd.MM.yyyy"

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static public func view(size: CGSize,
                            textField: DateTextField,
                            dateFormat: String? = nil) -> DatePickerView {
        let view = DatePickerView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.textField = textField
        if let dateFormat = dateFormat {
            view.dateFormat = dateFormat
        }
        return view
    }

}

// MARK: - Configure

private extension DatePickerView {

    func configureAppearance() {
        configureDatePicker()
    }

    func configureDatePicker() {
        guard bounds.height > Constants.topViewHeight else {
            fatalError("Height of DatePickerView must be more than 47 points (height of topView)")
        }
        let datePickerFrame = CGRect(x: 0,
                                     y: Constants.topViewHeight,
                                     width: bounds.width,
                                     height: bounds.height - Constants.topViewHeight)
        datePicker.frame = datePickerFrame
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.date = Date(timeIntervalSince1970: 0)
        datePicker.addTarget(self, action: #selector(dateChanged(picker:)), for: .valueChanged)
        addSubview(datePicker)
    }

}

// MARK: - Actions

private extension DatePickerView {

    @objc
    func dateChanged(picker: UIDatePicker) {
        let date = picker.date
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        textField?.processDateChange(date, text: formatter.string(from: date))
    }

}

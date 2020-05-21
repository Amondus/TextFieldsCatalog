//
//  UnderlinedFieldPreset.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 24/01/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit
import TextFieldsCatalog

enum UnderlinedFieldPreset: CaseIterable, AppliedPreset {
    case password
    case name
    case email
    case phone
    case cardExpirationDate
    case cvc
    case cardNumber
    case qrCode
    case birthday
    case sex

    var name: String {
        switch self {
        case .password:
            return L10n.Presets.Password.name
        case .name:
            return L10n.Presets.Name.name
        case .email:
            return L10n.Presets.Email.name
        case .phone:
            return L10n.Presets.Phone.name
        case .cardExpirationDate:
            return L10n.Presets.Cardexpirationdate.name
        case .cvc:
            return L10n.Presets.Cvc.name
        case .cardNumber:
            return L10n.Presets.Cardnumber.name
        case .qrCode:
            return L10n.Presets.Qrcode.name
        case .birthday:
            return L10n.Presets.Birthday.name
        case .sex:
            return L10n.Presets.Sex.name
        }
    }

    var description: String {
        switch self {
        case .password:
            return L10n.Presets.Password.description
        case .name:
            return L10n.Presets.Name.description
        case .email:
            return L10n.Presets.Email.description
        case .phone:
            return L10n.Presets.Phone.description
        case .cardExpirationDate:
            return L10n.Presets.Cardexpirationdate.description
        case .cvc:
            return L10n.Presets.Cvc.description
        case .cardNumber:
            return L10n.Presets.Cardnumber.description
        case .qrCode:
            return L10n.Presets.Qrcode.description
        case .birthday:
            return L10n.Presets.Birthday.description
        case .sex:
            return L10n.Presets.Sex.description
        }
    }

    func apply(for field: Any, with heightConstraint: NSLayoutConstraint) {
        guard let field = field as? UnderlinedTextField else {
            return
        }
        apply(for: field, heightConstraint: heightConstraint)
    }

}

// MARK: - Tune

private extension UnderlinedFieldPreset {

    func apply(for textField: UnderlinedTextField, heightConstraint: NSLayoutConstraint) {
        switch self {
        case .password:
            tuneFieldForPassword(textField, heightConstraint: heightConstraint)
        case .name:
            tuneFieldForName(textField)
        case .email:
            tuneFieldForEmail(textField)
        case .phone:
            tuneFieldForPhone(textField)
        case .cardExpirationDate:
            tuneFieldForCardExpirationDate(textField)
        case .cvc:
            tuneFieldForCvc(textField)
        case .cardNumber:
            tuneFieldForCardNumber(textField)
        case .qrCode:
            tuneFieldForQRCode(textField)
        case .birthday:
            tuneFieldForBirthday(textField)
        case .sex:
            tuneFieldForSex(textField)
        }
    }

    func tuneFieldForPassword(_ textField: UnderlinedTextField, heightConstraint: NSLayoutConstraint) {
        textField.configure(placeholder: L10n.Presets.Password.placeholder)
        textField.configure(correction: .no, keyboardType: .asciiCapable)
        textField.configure(heightConstraint: heightConstraint)
        textField.disablePasteAction()
        textField.setHint(L10n.Presets.Password.hint)
        textField.setReturnKeyType(.next)
        textField.setTextFieldMode(.password(.visibleOnNotEmptyText))

        let validator = TextFieldValidator(minLength: 8, maxLength: 20, regex: SharedRegex.password)
        validator.shortErrorText = L10n.Presets.Password.shortErrorText
        validator.largeErrorText = L10n.Presets.Password.largeErrorText(String(20))
        textField.validator = validator

        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.password)
    }

    func tuneFieldForName(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Name.placeholder)
        textField.configure(maxLength: 20)
        textField.configure(correction: .no, keyboardType: .default)
        textField.configure(autocapitalizationType: .words)
        textField.setHint(L10n.Presets.Name.hint)

        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.name, notations: FormatterMasks.customNotations())

        let validator = TextFieldValidator(minLength: 1, maxLength: 20, regex: SharedRegex.name)
        validator.notValidErrorText = L10n.Presets.Name.notValidError
        validator.largeErrorText = L10n.Presets.Name.largeTextError
        textField.validator = validator

        textField.onEndEditing = { field in
            let text = field.currentText()
            field.setText(text?.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }

    func tuneFieldForEmail(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Email.placeholder)
        textField.configure(correction: .no, keyboardType: .emailAddress)
        textField.validator = TextFieldValidator(minLength: 1, maxLength: nil, regex: SharedRegex.email)
    }

    func tuneFieldForPhone(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Phone.placeholder)
        textField.configure(correction: .no, keyboardType: .phonePad)
        textField.validator = TextFieldValidator(minLength: 18, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Phone.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.phone)
    }

    func tuneFieldForCardExpirationDate(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Cardexpirationdate.placeholder)
        textField.configure(correction: .no, keyboardType: .numberPad)
        textField.validator = TextFieldValidator(minLength: 5, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Cardexpirationdate.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.cardExpirationDate)
    }

    func tuneFieldForCvc(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Cvc.placeholder)
        textField.configure(correction: .no, keyboardType: .numberPad)
        textField.validator = TextFieldValidator(minLength: 3, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Cvc.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.cvc)
    }

    func tuneFieldForCardNumber(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Cardnumber.placeholder)
        textField.configure(correction: .no, keyboardType: .numberPad)
        textField.validator = TextFieldValidator(minLength: 19, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Cardnumber.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.cardNumber)
    }

    func tuneFieldForQRCode(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Qrcode.placeholder)
        textField.configure(maxLength: 10)
        textField.configure(correction: .no, keyboardType: .asciiCapable)
        textField.setHint(L10n.Presets.Qrcode.hint)
        textField.validator = TextFieldValidator(minLength: 10, maxLength: 10, regex: nil)

        let actionButtonConfig = ActionButtonConfiguration(image: UIImage(asset: Asset.qrCode),
                                                           normalColor: Color.Button.active,
                                                           pressedColor: Color.Button.pressed)
        textField.setTextFieldMode(.custom(actionButtonConfig))
        textField.onActionButtonTap = { field, _ in
            field.setText("12 345-678")
        }

        if let boxTextField = textField as? BoxTextField {
            boxTextField.configure(supportPlaceholder: "XX XXX-XXX")
        } else if type(of: textField) == UnderlinedTextField.self {
            textField.setup(supportPlaceholder: "XX XXX-XXX")
        }
    }

    func tuneFieldForBirthday(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Birthday.placeholder)
        textField.validator = TextFieldValidator(minLength: 1,
                                                 maxLength: nil,
                                                 regex: nil,
                                                 globalErrorMessage: L10n.Presets.Birthday.hint)

        let inputView = DatePickerView.default(for: textField)
        textField.inputView = inputView

        textField.onDateChanged = { date in
            print("this is selected date - \(date)")
        }
    }

    func tuneFieldForSex(_ textField: UnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Sex.placeholder)
        textField.validator = TextFieldValidator(minLength: 1,
                                                 maxLength: nil,
                                                 regex: nil,
                                                 globalErrorMessage: L10n.Presets.Sex.hint)

        let inputView = PlainPickerView.default(for: textField,
                                                data: Sex.allCases.map { $0.value })
        textField.inputView = inputView

        textField.onTextChanged = { field in
            if let value = Sex.sex(by: field.currentText()) {
                print(value)
            } else {
                print("sex is undefined")
            }
        }
    }

}

//
//  ConfigurationParameters.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 25/01/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit

/// Configuration class with parameters for line in UnderlinedTextField
final class LineConfiguration {
    /// This height will be applied when text field is inactive
    let smallHeight: CGFloat
    /// This height will be applied when text field is active
    let bigHeight: CGFloat
    /// Corner radius for line under text field
    let cornerRadius: CGFloat
    /// Colors for line under text field
    let colors: ColorConfiguration

    init(smallHeight: CGFloat,
         bigHeight: CGFloat,
         cornerRadius: CGFloat,
         colors: ColorConfiguration) {
        self.smallHeight = smallHeight
        self.bigHeight = bigHeight
        self.cornerRadius = cornerRadius
        self.colors = colors
    }
}

/// Configuration class with parameters for floating placeholder
final class FloatingPlaceholderConfiguration {
    /// This is text font for placeholder
    let font: UIFont
    /// This is frame for placeholder in top position
    let topPosition: CGRect
    /// This is frame for placeholder in bottom position
    let bottomPosition: CGRect
    /// Font size for placeholder in top position
    let smallFontSize: CGFloat
    /// Font size for placeholder in bottom position
    let bigFontSize: CGFloat
    /// Colors for text in top position
    let topColors: ColorConfiguration
    /// Colors for text in bottom position
    let bottomColors: ColorConfiguration

    init(font: UIFont,
         topPosition: CGRect,
         bottomPosition: CGRect,
         smallFontSize: CGFloat,
         bigFontSize: CGFloat,
         topColors: ColorConfiguration,
         bottomColors: ColorConfiguration) {
        self.font = font
        self.topPosition = topPosition
        self.bottomPosition = bottomPosition
        self.smallFontSize = smallFontSize
        self.bigFontSize = bigFontSize
        self.topColors = topColors
        self.bottomColors = bottomColors
    }
}

/// Configuration class with parameters for static placeholder
final class PlaceholderConfiguration {

}

/// Configuration class with parameters for inner text field inside custom text fields
final class TextFieldConfiguration {
    /// Text font in text field
    let font: UIFont
    /// Default text padding for text in text field
    let defaultPadding: UIEdgeInsets
    /// This padding for text in text field will be applied when action button will be shown
    let increasedPadding: UIEdgeInsets
    /// Text field tint color
    let tintColor: UIColor
    /// Text colors for text in text field
    let colors: ColorConfiguration

    init(font: UIFont,
         defaultPadding: UIEdgeInsets,
         increasedPadding: UIEdgeInsets,
         tintColor: UIColor,
         colors: ColorConfiguration) {
        self.font = font
        self.defaultPadding = defaultPadding
        self.increasedPadding = increasedPadding
        self.tintColor = tintColor
        self.colors = colors
    }
}

/// Configuration class with parameters for text field border in BorderedTextField
final class TextFieldBorderConfiguration {

}

/// Configuration class with parameters for hint label
final class HintConfiguration {
    /// Text font for hint label
    let font: UIFont
    /// Text colors for hint label
    let colors: ColorConfiguration

    init(font: UIFont, colors: ColorConfiguration) {
        self.font = font
        self.colors = colors
    }
}

/// Configuration class with parameters for tuning action button inside custom text fields
final class PasswordModeConfiguration {
    /// The image that will be shown in secure mode state
    let secureModeOnImage: UIImage
    /// The image that will be shown in not secure mode state
    let secureModeOffImage: UIImage
    /// Color of button image in normal state
    let normalColor: UIColor
    /// Color of button image in highlighted and selected state
    let pressedColor: UIColor

    init(secureModeOnImage: UIImage,
         secureModeOffImage: UIImage,
         normalColor: UIColor,
         pressedColor: UIColor) {
        self.secureModeOnImage = secureModeOnImage
        self.secureModeOffImage = secureModeOffImage
        self.normalColor = normalColor
        self.pressedColor = pressedColor
    }
}

/// Configuration class with parameters for tuning background color
final class BackgroundConfiguration {
    /// Text field background color
    let color: UIColor

    init(color: UIColor) {
        self.color = color
    }
}

/// Configuration class with parameters for tuning color in various text feild states
final class ColorConfiguration {
    /// Item color in error state. Error has top priority over other states
    let error: UIColor
    /// Item color in inactive state
    let normal: UIColor
    /// Item color in active state
    let active: UIColor
    /// Item color in disabled state
    let disabled: UIColor

    init(error: UIColor, normal: UIColor, active: UIColor, disabled: UIColor) {
        self.error = error
        self.normal = normal
        self.active = active
        self.disabled = disabled
    }
}

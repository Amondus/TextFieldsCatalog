//
//  BorderedFieldPresetsViewInput.swift
//  TextFieldsCatalog
//
//  Created by Alexander Chausov on 23/01/2019.
//  Copyright © 2019 Surf. All rights reserved.
//

protocol BorderedFieldPresetsViewInput: class {
    /// Method for setup initial state of view
    func setupInitialState(with presets: [BorderedFieldPreset])
}

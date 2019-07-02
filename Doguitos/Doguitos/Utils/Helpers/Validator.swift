//
//  Validator.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct Validator {
    static func isEmailValid(email: String) -> Error? {
        if email.isEmpty { return DError.mandatoryEmail }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if !email.matchRegex(emailRegEx) { return DError.invalidEmail }
        return nil
    }
}

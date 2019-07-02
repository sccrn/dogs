//
//  DError.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

enum DError: Error {
    case mandatoryEmail
    case invalidEmail
}

extension DError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .mandatoryEmail: return Constants.Error.mandatoryEmail
        case .invalidEmail: return Constants.Error.invalidEmail
        }
    }
}

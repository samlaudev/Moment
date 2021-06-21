//
//  UniversalLinks.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/21.
//

import Foundation

enum UniversalLinks: String {
    case internalMenu

    // swiftlint:disable no_hardcoded_strings
    static let baseURL = "https://momentsapp.com/"
    // swiftlint:enable no_hardcoded_strings

    var url: URL? {
        URL(string: "\(Self.baseURL)\(self.rawValue)")
    }
}

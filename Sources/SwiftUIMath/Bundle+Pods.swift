//
//  Bundle+Pods.swift
//  swiftui-math
//
//  Created by Aswath Narayanan on 7/3/26.
//

import Foundation

public extension Bundle {
    static var disambiguatedModule: Bundle {
        guard let bundleURL = Bundle.main.url(forResource: "swiftui-math_SwiftUIMath", withExtension: "bundle") else {
            fatalError("swiftui-math_SwiftUIMath.bundle not found!")
        }
        guard let bundle = Bundle(url: bundleURL) else {
            fatalError("swiftui-math_SwiftUIMath.bundle not accessible!")
        }
        return bundle
    }
}

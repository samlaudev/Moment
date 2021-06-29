//
//  Functions.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/23.
//

import Foundation

func configure<T: AnyObject>(_ object: T, closure: (T) -> Void) -> T {
    closure(object)

    return object
}

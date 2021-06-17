//
//  TogglesDataStoreType.swift
//  Moment
//
//  Created by Sam Lau on 2021/6/17.
//

protocol TogglesType { }

protocol TogglesDataStoreType {
    func isToggleOn(_ toggle: TogglesType) -> Bool
    func update(toggle: TogglesType, value: Bool)
}

//
//  PurchaseValidator.swift
//  orecon
//
//  Created by Kenji Tanaka on 2018/09/13.
//  Copyright © 2018年 Kenji Tanaka. All rights reserved.
//

import Foundation

struct Item {
    enum ItemType {
        case physical
        case digital
    }

    let itemType: ItemType
}

struct Cart {
    let items: [Item]

    var hasPhysicalItem: Bool {
        return items.contains(where: {
            $0.itemType == .physical
        })
    }
}

struct Address {
    let postalCode: String
    let address1: String
    let address2: String?
}

struct PurchaseValidator {
    func isValid(cart: Cart, address: Address?) -> Bool {
        if cart.hasPhysicalItem {
            if address == nil {
                return false
            }
        }

        return true
    }
}








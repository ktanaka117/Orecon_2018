//
//  PurchaseValidatorTests.swift

// ## サービス紹介
// ECサービス
// 物理商品とデジタル商品を取り扱っている

// ## モチベーション
// 購入という処理は、ECサービスにおいてクリティカルな部分なのでテストを書きたい！！！
// 書きやすいところから、購入前に行われるバリデーションのテストを書きたい！！！

// ## テスト書きの手順
// - この条件で
// - この操作をしたら
// - この結果になること

// ## TODO
//- [x] カートに物理商品が入っていて、住所情報が入力されていれば、カートが正常であること
//- [x] カートに物理商品が入っていて、住所情報が入っていなければ、カートが異常であること
//- [x] カートにデジタル商品のみが入っている場合、住所情報が入っていなくても、カートが正常であること
//- [ ] カートに物理商品とデジタル商品が1件ずつ入っている場合、住所が情報が入っていれば、カートが正常であること
//----- 余力あれば -----
//- [ ] カートに入っている商品が1件以上なら、カートが正常であること
//- [ ] カートに入っている商品が0件以下なら、カートが異常であること

import XCTest
@testable import orecon

class PurchaseValidatorTests: XCTestCase {
    func testIsCartValid() {
        let validator = PurchaseValidator()
        let address = Address(postalCode: "1110000", address1: "東京都北区ほげほげ", address2: nil)

        XCTContext.runActivity(named: "カートに物理商品が1件入っていて") { _ in
            let items = [Item(itemType: .physical)]
            let cart = Cart(items: items)

            XCTContext.runActivity(named: "住所情報が入力されていれば") { _ in
                XCTAssertTrue(validator.isValid(cart: cart, address: address))
            }

            XCTContext.runActivity(named: "住所情報が入っていなければ") { _ in
                XCTAssertFalse(validator.isValid(cart: cart, address: nil))
            }
        }

        XCTContext.runActivity(named: "カートにデジテル商品のみが入っている場合、住所情報が入っていなくても") { _ in
            let items = [Item(itemType: .digital)]
            let cart = Cart(items: items)

            XCTContext.runActivity(named: "住所情報が入っていたら") { _ in
                XCTAssertTrue(validator.isValid(cart: cart, address: address))
            }

            XCTContext.runActivity(named: "住所情報が入っていなかったら") { _ in
                XCTAssertTrue(validator.isValid(cart: cart, address: nil))
            }
        }

        XCTContext.runActivity(named: "カートに物理商品とデジタル商品が1件ずつ入っている場合、住所が情報が入っていれば") { _ in
            let items = [Item(itemType: .digital), Item(itemType: .physical)]
            let cart = Cart(items: items)

            XCTAssertTrue(validator.isValid(cart: cart, address: address))
        }
    }
}























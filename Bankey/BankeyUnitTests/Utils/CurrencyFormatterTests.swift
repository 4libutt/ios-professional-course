//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Ali Butt on 12/12/2022.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakEurosIntoCents() throws {
        let result = formatter.breakIntoEurosAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testEurosFormatted() {
        let result = formatter.eurosFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }
    
    func testZeroEurosFormatted() {
        let result = formatter.eurosFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
}

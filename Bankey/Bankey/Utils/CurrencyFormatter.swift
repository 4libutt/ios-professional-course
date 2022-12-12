//
//  CurrencyFormatter.swift
//  Bankey
//
//  Created by Ali Butt on 12/12/2022.
//

import UIKit

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoEurosAndCents(amount)
        return makeBalanceAttributed(euros: tuple.0, cents: tuple.1)
    }
    
    // Converts 929466.23 > "929,466" "23"
    func breakIntoEurosAndCents(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.doubleValue)
        
        let euros = convertEuro(tuple.0)
        let cents = convertCents(tuple.1)
        
        return (euros, cents)
    }
    
    // Converts 929466 > 929,466
    private func convertEuro(_ euroPart: Double) -> String {
        let eurosWithDecimal = eurosFormatted(euroPart) // "$929,466.00"
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_us")
        let decimalSeparator = formatter.decimalSeparator! // "."
        let euroComponents = eurosWithDecimal.components(separatedBy: decimalSeparator) // "$929,466" "00"
        var euros = euroComponents.first! // "$929,466"
        euros.removeFirst() // "929,466"

        return euros
    }
    
    // Convert 0.23 > 23
    private func convertCents(_ centPart: Double) -> String {
        let cents: String
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
    // Converts 929466 > $929,466.00
    func eurosFormatted(_ euros: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: euros as NSNumber) {
            return result
        }
        
        return ""
    }
    
    private func makeBalanceAttributed(euros: String, cents: String) -> NSMutableAttributedString {
        let euroSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let euroAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "€", attributes: euroSignAttributes)
        let euroString = NSAttributedString(string: euros, attributes: euroAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(euroString)
        rootString.append(centString)
        
        return rootString
    }
}

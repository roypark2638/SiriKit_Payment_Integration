//
//  BankAccount.swift
//  SiriKit_Payment_Integration
//
//  Created by Roy Park on 5/3/21.
//

import Foundation

class BankAccount {
    static let identifier = "BankAccount"
    
    static let suiteName = "com.roypark.SiriKit-Payment-Integration"

    var bankID: String
    var balance: Double
    var firstName: String
    var lastName: String

    init(balance: Double?, firstName: String, lastName: String) {
        self.bankID = UUID().uuidString
        self.balance = balance ?? 0.0
        self.firstName = firstName
        self.lastName = lastName
    }
    
//    private init() {}
    
    private func checkBalanced() -> Double {
        return UserDefaults.standard.double(forKey: "balance")
        
    }
    
    private func setBalance(with amount: Double?) {
        self.balance = amount ?? 0
//        UserDefaults.standard.set(amount, forKey: "balance")
    }
    
    @discardableResult
    private func withdraw(of amount: Double) -> Double {
        let newBalance = self.balance - amount
        self.balance = newBalance
        return newBalance
//        let balance = UserDefaults.standard.double(forKey: "balance")
//        let newBalance = balance - amount
//        setBalance(with: newBalance)
//        return newBalance
    }
    
    @discardableResult
    private func deposit(of amount: Double) -> Double {
        let newBalance = self.balance + amount
        self.balance = newBalance
        return newBalance
//        let balance = UserDefaults.standard.double(forKey: "balance")
//        let newBalance = balance + amount
//        setBalance(with: newBalance)
//        return newBalance
    }
}

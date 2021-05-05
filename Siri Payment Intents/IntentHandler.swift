//
//  IntentHandler.swift
//  Siri Payment Intents
//
//  Created by Roy Park on 5/4/21.
//

import Intents

protocol IntentHandlerDelegate: AnyObject {
    func intentHandler(_ handler: IntentHandler, sendIntentWith amount: Double)
    func intentHandler(_ handler: IntentHandler, requestIntentWith amount: Double)
}

class IntentHandler: INExtension {
    weak var delegate: IntentHandlerDelegate?
    
}

extension IntentHandler: INSendPaymentIntentHandling {
    func handle(intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        guard let amount = intent.currencyAmount?.amount?.doubleValue else {
            completion(INSendPaymentIntentResponse(
                        code: .failure,
                        userActivity: nil))
            return
        }
//        BankAccount.withdraw
        print("Send amount: \(amount)")
        delegate?.intentHandler(self, sendIntentWith: amount)
        completion(INSendPaymentIntentResponse(
                    code: .success,
                    userActivity: nil))
        
    }
    
}

extension IntentHandler: INRequestPaymentIntentHandling {
    func handle(intent: INRequestPaymentIntent, completion: @escaping (INRequestPaymentIntentResponse) -> Void) {
        
        guard let amount = intent.currencyAmount?.amount?.doubleValue else {
            completion(INRequestPaymentIntentResponse(
                        code: .failure,
                        userActivity: nil))
            return
        }
        print("Request amount: \(amount)")
        delegate?.intentHandler(self, requestIntentWith: amount)
        completion(INRequestPaymentIntentResponse(
                    code: .success,
                    userActivity: nil))
    }
    
}

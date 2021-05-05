//
//  IntentHandler.swift
//  Siri Payment Intents
//
//  Created by Roy Park on 5/4/21.
//

import Intents

protocol IntentHandlerDelegate: AnyObject {
    func intentHandler(_ handler: IntentHandler, sendIntentWith: Double)
    func intentHandler(_ handler: IntentHandler, requestIntentWith: Double)
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
         
        delegate?.intentHandler(self, sendIntentWith: amount)
        
    }
    
}

extension IntentHandler: INRequestPaymentIntentHandling {
    func handle(intent: INRequestPaymentIntent, completion: @escaping (INRequestPaymentIntentResponse) -> Void) {
        
    }
    
}

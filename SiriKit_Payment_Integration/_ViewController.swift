//
//  ViewController.swift
//  SiriKit_Payment_Integration
//
//  Created by Roy Park on 5/3/21.
//

import UIKit

class _ViewController: UIViewController {
    
    private let myAccount = BankAccount(
        balance: 0.0,
        firstName: "Roy",
        lastName: "Park"
    )
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Payment App"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("Refresh Balance", for: .normal)
        button.backgroundColor = .label
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15.0
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(balanceLabel)
        view.addSubview(refreshButton)
        
        configureBalance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(
            x: (view.frame.width-titleLabel.frame.width)/2,
            y: view.safeAreaInsets.top + 30,
            width: titleLabel.frame.width,
            height: titleLabel.frame.height
        )
        
        balanceLabel.sizeToFit()
        balanceLabel.frame = CGRect(
            x: (view.frame.width-balanceLabel.frame.width)/2,
            y: titleLabel.frame.origin.y + titleLabel.frame.height + 30,
            width: balanceLabel.frame.width,
            height: balanceLabel.frame.height
        )
        
        refreshButton.frame = CGRect(
            x: (view.frame.width-150)/2,
            y: balanceLabel.frame.origin.y + balanceLabel.frame.height + 40,
            width: 150,
            height: 40
        )
    }
    
    private func configureBalance() {
        balanceLabel.text = "\(myAccount.firstName) \(myAccount.lastName)'s Balance:\n $\(myAccount.balance)"
    }
}

extension _ViewController: IntentHandlerDelegate {
    func intentHandler(_ handler: IntentHandler, sendIntentWith: Double) {
        <#code#>
    }
    
    func intentHandler(_ handler: IntentHandler, requestIntentWith: Double) {
        <#code#>
    }
    
    
}

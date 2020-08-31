//
//  StartingViewController.swift
//  Ionix Test
//
//  Created by Javier González Ovalle on 30-08-20.
//  Copyright © 2020 Gov Elo Works. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func gridButtonAction(_ sender: UIButton) {
        var buttonName: String
        switch sender.tag {
        case 0:
            buttonName = "easy payment"
            requestUserIdentification()
        case 1:
            buttonName = "gas stations"
        case 2:
            buttonName = "my route"
        case 3:
            buttonName = "my benefits"
        case 4:
            buttonName = "messages"
        case 5:
            buttonName = "settings"
        default:
            buttonName = "unknown"
        }
        
        print(" did touch button: " + buttonName)
    }
    
    func requestUserIdentification() {
        let idAlert = UIAlertController(title: "Se solicita identificación",
                                        message: "Por favor ingrese su RUT", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        let comply = UIAlertAction(title: "Aceptar", style: .default) { [weak idAlert] (action) in
            guard
                let alertController = idAlert,
                let fields = alertController.textFields,
                let textField = fields.first else {
                return
            }
            print(" user did comply, and wrote this: \(textField.text ?? "nothing")")
        }
        idAlert.addAction(comply)
        idAlert.addAction(cancel)
        idAlert.addTextField { textField in
            textField.keyboardType = .numbersAndPunctuation
        }
        present(idAlert, animated: true) {
            print(" did present alert")
        }
    }
}

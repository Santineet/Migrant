//
//  Alerts.swift
//  Migrant Handbook
//
//  Created by Mairambek on 8/25/20.
//  Copyright © 2020 Mairambek Abdrasulov. All rights reserved.
//

import UIKit

struct Alert {

    static func showMessage(title: String? = nil, message: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
            guard let currentVC = UIApplication.getTopViewController() else { return }
            currentVC.present(alert, animated: true, completion: nil)
        }
    }
}


//
//  NotificationManager.swift
//  POC_NotificationClass
//
//  Created by Julia Morales on 27/05/24.
//

import Foundation
import SwiftUI

class NotificationManager: ObservableObject {
    @Published var receivedColor: Color?
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .showMessage, object: nil)
    }
    
    @objc func handleNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo, let color = userInfo["buttonColor"] as? Color {
            self.receivedColor = color
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .showMessage, object: nil)
    }
}




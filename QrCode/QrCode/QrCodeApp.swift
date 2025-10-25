//
//  QrCodeApp.swift
//  QrCode
//
//  Created by vadym vasylaki on 25.10.2025.
//

import SwiftUI

@main
struct QrCodeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView()
                .preferredColorScheme(.light)
        }
    }
}

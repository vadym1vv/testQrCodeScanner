//
//  ScreenEnum.swift
//  QrCode
//
//  Created by Vadym Vasylaki on 25.10.2025.
//

import Foundation
import SwiftUI

enum ScreenEnum: String, CaseIterable {
    case scanCodeScreen = "Scan Qr", generateCode = "Generate Qr"
    
    @ViewBuilder
    var screen: some View {
        switch self {
        case .scanCodeScreen:
            QrScannerView()
        case .generateCode:
            GenerateCodeView()
        }
    }
    
    var icon: String {
        switch self {
        case .scanCodeScreen:
            "camera.viewfinder"
        case .generateCode:
            "qrcode"
        }
    }
}

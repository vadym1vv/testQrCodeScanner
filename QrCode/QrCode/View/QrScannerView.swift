//
//  CodeScannerView.swift
//  QrCode
//
//  Created by Vadym Vasylaki on 25.10.2025.
//

import SwiftUI
import CodeScanner

struct QrScannerView: View {
    
    @State private var isShowingScanner = false
    @State private var isShowingBarcodeScanner = false
    @State private var scannedCode: String?
    
    var body: some View {
        VStack {
            Spacer()
            if let code = scannedCode {
                Text("\(code)")
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding(.bottom)
            }
            Button {
                self.isShowingScanner = true
            } label: {
                Text("Scan QR Code")
                    .foregroundStyle(.white)
                    .padding(.vertical, 7)
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
            }
            .buttonStyle(.borderedProminent)
            .tint(.gray)
            
            Spacer()
        }
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(
                codeTypes: [.qr, .ean8, .ean13, .pdf417],
                completion: self.handleScanResult
            )
        }
    }
    
    func handleScanResult(result: Result<ScanResult, ScanError>) {
        self.isShowingScanner = false
        switch result {
        case .success(let result):
            self.scannedCode = result.string
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    QrScannerView()
}

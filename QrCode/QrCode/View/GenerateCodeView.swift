//
//  GenerateCodeView.swift
//  QrCode
//
//  Created by Vadym Vasylaki on 25.10.2025.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import UIKit

struct GenerateCodeView: View {
    
    @State private var textInput: String = ""
    @State private var uiImage: UIImage? = nil
    
    var body: some View {
        VStack {
            
            VStack {
                if let uiImage, !textInput.isEmpty {
                    Image(uiImage: uiImage)
                } else {
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(height: UIScreen.main.bounds.height / 3)
            
            Spacer()
            VStack {
                TextField("Enter data for Qr encryption", text: $textInput)
                    .foregroundStyle(.black)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                
                Button {
                    uiImage = QrCodeGeneratorService.generateQRCode(from: textInput)
                } label: {
                    Text("Generate Qr code")
                        .foregroundStyle(.white)
                        .padding(.vertical, 7)
                        .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.gray)
                .disabled(textInput.isEmpty)
            }
            .frame(height: UIScreen.main.bounds.height / 2.4)
        }
    }
    
    
}

#Preview {
    GenerateCodeView()
}

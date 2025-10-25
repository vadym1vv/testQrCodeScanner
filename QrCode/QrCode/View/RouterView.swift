//
//  RouterView.swift
//  QrCode
//
//  Created by Vadym Vasylaki on 25.10.2025.
//

import SwiftUI

struct RouterView: View {
    
    @State private var screenEnum: ScreenEnum = .scanCodeScreen
    
    var body: some View {
        VStack {
            screenEnum.screen
            Spacer()
            HStack {
                ForEach(ScreenEnum.allCases, id: \.self) { screen in
                    Spacer()
                    Button {
                        screenEnum = screen
                    } label: {
                        VStack {
                            Image(systemName: screen.icon)
                            Text(screen.rawValue)
                                .foregroundStyle(.black)
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    RouterView()
}

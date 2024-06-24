//
//  ContentView.swift
//  POC_NotificationClass
//
//  Created by Julia Morales on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var notificationManager = NotificationManager()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Notificação recebida:")
                    .bold()
                    .font(.title3)
                RoundedRectangle(cornerRadius: 10)
                    .fill(notificationManager.receivedColor ?? .gray)
                    .frame(width: 35, height: 35)
            }
            PostButton(color: .red)       
            PostButton(color: .green)
        }
    }
}

struct PostButton: View {
    var color: Color
    
    var body: some View {
        VStack {
            Button {
                postNotification(color)
            } label: {
                Text("Postar Notificação")
                    .bold()
                    .padding()
                    .foregroundColor(color)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 20,
                            style: .continuous
                        )
                        .stroke(color, lineWidth: 3)
                    )
            }
        }
    }
    
    func postNotification(_ color: Color) {
        NotificationCenter.default.post(name: .showMessage, object: nil, userInfo: ["buttonColor": color])
    }
}

#Preview {
    ContentView()
}

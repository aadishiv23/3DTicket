//
//  ContentView.swift
//  3DTicket
//
//  Created by Aadi Shiv Malhotra on 1/10/25.
//

import SwiftUI

struct ContentView: View {

    @State private var rotationAngle: Double = 0
    var body: some View {
        VStack {
            cardView

            Spacer()
            Slider(value: $rotationAngle, in: 0...360, step: 1)
                .padding()
            Text("\(Double(rotationAngle))")
                .contentTransition(.numericText(value: rotationAngle))
        }
    }

    // MARK: Card View

    private var cardView: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .frame(width: 350, height: 400)
                    .foregroundStyle(
                        LinearGradient(colors: [
                            .blue, .red
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .rotation3DEffect(
                        .degrees(rotationAngle),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .opacity(rotationAngle <= 90 || rotationAngle >= 270 ? 1 : 0)

                Text("Hello")
                    .rotation3DEffect(
                        .degrees(rotationAngle),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .opacity(rotationAngle <= 90 || rotationAngle >= 270 ? 1 : 0)
            }

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: 350, height: 400)
                .foregroundStyle(
                    LinearGradient(colors: [
                        .green, .red
                    ], startPoint: .top, endPoint: .bottom)
                )
                .rotation3DEffect(
                    .degrees(rotationAngle),
                    axis: (x: 0, y: 1, z: 0)
                )
                .opacity(rotationAngle > 90 && rotationAngle < 270 ? 1 : 0)
        }
        .padding(.top, 50)
    }
}

#Preview {
    ContentView()
}

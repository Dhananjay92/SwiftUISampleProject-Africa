//
//  MotionAnimationView.swift
//  Africa
//
//  Created by mehmet karanlık on 16.12.2021.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK:  properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating : Bool = false
    
    // MARK:  functions
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 0...300)
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2)
    }
    
    private func randomSpeed() -> Double {
        return Double.random(in: 0.025...1)
    }
    private func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK:  body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation( Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                        .repeatForever()
                                        .speed(randomSpeed())
                                        .delay(randomDelay()), value: isAnimating
                           
                        )
                }
                .onAppear {
                    isAnimating = true
                }
            }
            .drawingGroup()
     
        }
    }
}


// MARK:  preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

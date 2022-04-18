//
//  ArcShape.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 18/4/22.
//

import Foundation
import SwiftUI


struct ArcShape : Shape {
    var curveSize: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            // Top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // Top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            // bottom
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + curveSize))
            
            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.closeSubpath()
            
        }
        
//        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height / 2, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)

//        return p.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        
    }
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        ArcShape(curveSize: 100.0)
            .fill(.red)
            .rotationEffect(Angle(degrees: 180))
            .frame(height: 100)
//            .previewLayout(.sizeThatFits)
//            .frame(width: UIScreen.main.bounds.width, height: 200)
//            .frame(width: UIScreen.main.bounds.width, height: 100)

    }
}

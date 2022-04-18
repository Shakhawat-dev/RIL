//
//  ArcShape.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 18/4/22.
//

import Foundation
import SwiftUI


struct ArcShape : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            // Top left
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            
            // Top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            // bottom
            path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY), radius: rect.width / 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
            
            // mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
        }
        
//        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height / 2, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)

//        return p.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
        
    }
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        ArcShape()
//            .previewLayout(.sizeThatFits)
            .frame(width: , height: 200)
    }
}

//
//  Colors.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//

import SwiftUI

struct CustomColors: Hashable {
    static let brown = UIColor(red: 0.518, green: 0.388, blue: 0.251, alpha: 1)
    static let darkBrown = UIColor(red: 0.204, green: 0.176, blue: 0.102, alpha: 1)
    static let lightBrown = UIColor(red: 0.965, green: 0.898, blue: 0.82, alpha: 1)
    static let navigationBarColor = UIColor(red: 0.98, green: 0.976, blue: 0.976, alpha: 1)
}

struct PreviewColors: View {
    var body: some View {
        List{
            ZStack{
                Color(CustomColors.brown)
                Text("brown")
                    .shadow(color: .white, radius: 3)
            }
            ZStack{
                Color(CustomColors.darkBrown)
                Text("darkBrown")
                    .shadow(color: .white, radius: 3)
            }
            ZStack{
                Color(CustomColors.lightBrown)
                Text("lightBrown")
                    .shadow(color: .white, radius: 3)
            }
            ZStack{
                Color(CustomColors.navigationBarColor)
                Text("navigationBarColor")
                    .shadow(color: .white, radius: 3)
            }
        }
    }
}

struct PreviewColors_Preview: PreviewProvider {
    static var previews: some View {
        PreviewColors()
    }
}



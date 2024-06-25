//
//  MyDevView.swift
//  NewBMICalculator
//
//  Created by Thapat Auechaikasem on 24/6/67.
//

import SwiftUI

struct MyDevView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("pf")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .overlay(Circle().stroke(Color.white,lineWidth: 10))
                    .clipShape(Circle())
                    .shadow(radius: 20)
                    .padding(.bottom, 30)
                Text("Thapat Auechaikasem")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: 310, maxHeight: 50)
                    .background(.green)
                    .cornerRadius(10)
                    .padding(.bottom, 5)
                Text("Assumption College Thonburi")
                    .font(.system(.headline, design: .rounded))
                    .frame(maxWidth: 250)
                    .background(.black)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                // This is a real email btw
                Link("game@thapat.me", destination: URL(string: "mailto:game@thapat.me")!)
                    .font(.system(.headline,design: .rounded))
                    .fontWeight(.bold)
                    .padding(.top, 10)
            }
            .navigationTitle("About Developer")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
    
#Preview {
    MyDevView()
}

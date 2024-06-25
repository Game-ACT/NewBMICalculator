//
//  ContentView.swift
//  NewBMICalculator
//
//  Created by Thapat Auechaikasem on 24/6/67.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: MyCalcView()) {
                    Image(uiImage: UIImage(named: "bmi")!)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                Text("Calculate BMI")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: 200)
                    .background(.black)
                    .cornerRadius(20)
                    .opacity(0.8)
                    .offset(y:-75)
                    .padding(.bottom, -75)
                
                NavigationLink(destination: MyDevView()) {
                    Image(uiImage: UIImage(named: "dev")!)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                Text("About Developer")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: 240)
                    .background(.black)
                    .cornerRadius(20)
                    .opacity(0.8)
                    .offset(y:-70)
                    .padding(.bottom, -75)
            }
            
            .navigationTitle("NewBMICalculator")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

#Preview {
    MainView()
}

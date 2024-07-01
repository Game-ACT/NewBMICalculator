//
//  MyCalcView.swift
//  NewBMICalculator
//
//  Created by Thapat Auechaikasem on 24/6/67.
//

import SwiftUI

struct MyCalcView: View {
    
    // delare values
    
    //  • @State is a property wrapper in SwiftUI that allows a value to be mutable and notifies the view when the value changes.
    //  • private is an access control modifier that restricts access to the property within the same scope.
    //  • var declares a variable.
    //  • myWeight is the name of the variable.
    //  • : Int specifies the type of the variable as Int.
    //  • = 55 initializes the variable with a value of 55.
    
    // Replace values here to change placeholder
    @State private var myWeightALT : Int = 55
    @State private var myHeightALT : Int = 165
    // Results variables.
    @State private var myBMIResultALT : String = ""
    @State private var myBMIInterpert : String = ""
    @State private var showmyBMIInterpert : Bool = false
    
    init() {
        // change stepper icons to stepper set accentcolor | Note : Soon to be deprecated
        UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
    }
    
    func bmicalculate(bmiValue: Double) -> String {
        // Add "BMI Value = " and round the value
        let result : String = "BMI Value = \(round(bmiValue * 100) / 100) \n"
        return result
    }
    
    func refetchvals() {
        myBMIResultALT = bmicalculate(bmiValue: Double(self.myWeightALT) / (pow(Double(self.myHeightALT) / 100, 2)))
        myBMIInterpert = bmiresultinterpert(bmiValue: Double(self.myWeightALT) / (pow(Double(self.myHeightALT) / 100, 2)))
    }
    
    func bmiresultinterpert(bmiValue: Double) -> String {
        var result : String = ""
        
        if bmiValue >= 40 {
            result = "You are extremely obese. Please seek medical attention immediately."
        } else if bmiValue >= 35 {
            result = "You are obese, level 2. You are at risk of developing obesity-related diseases. If your waist circumference is greater than normal, you are at higher risk of developing obesity. You must control your diet. and exercise seriously"
        } else if bmiValue >= 28.5 {
            result = "You are obese, level 1. You are more likely to develop high blood pressure and diabetes. You need to control your diet and exercise."
        } else if bmiValue >= 23.5 {
            result = "Overweight, If you are genetically affected by diabetes or high blood cholesterol, you must lose weight so that your body mass index is less than 23."
        } else if bmiValue >= 18.5{
            result = "Normal weight, If the amount of fat is within the normal range, there is rarely an incidence of diabetes and high blood pressure."
        } else {
            result = "Underweight, You should eat high quality food. and has sufficient energy and exercise appropriately."
        }
        
        return result
        
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Stepper("Weight \(self.myWeightALT) kilograms") {
                        if myWeightALT < 200 {
                            self.myWeightALT += 1
                            refetchvals()
                        }
                    } onDecrement: {
                        if myWeightALT > 1 {
                            self.myWeightALT -= 1
                            refetchvals()
                        }
                    }
                    .font(.system(size: 20, weight: .heavy))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                    .background(.cyan)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .accentColor(.white)
                    
                    Stepper("Height \(self.myHeightALT) centimeters"){
                        if myHeightALT < 200 {
                            self.myHeightALT += 1
                            refetchvals()
                        }
                    } onDecrement: {
                        if myHeightALT > 1 {
                            self.myHeightALT -= 1
                            refetchvals()
                        }
                    }
                    .font(.system(size: 20, weight: .heavy))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                    .background(.cyan)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    .accentColor(.white)
                    
                }
                
                /*
                 VStack {
                 Button(action: {
                 refetchvals()
                 }){
                 Text("Show BMI Value")
                 .fontWeight(.bold)
                 .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0 ,maxHeight: 45)
                 .background(.red)
                 .cornerRadius(10)
                 .padding(.horizontal, 10)
                 .foregroundColor(.white)
                 }
                 }
                 */
                
                VStack {
                    Button(action: {
                        showmyBMIInterpert.toggle()
                    }){
                        if showmyBMIInterpert {
                            Text("Hide BMI Summary")
                                .fontWeight(.bold)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0 ,maxHeight: 45)
                                .background(.teal)
                                .cornerRadius(10)
                                .padding(.horizontal, 10)
                                .foregroundColor(.white)
                        } else {
                            Text("Show BMI Summary")
                                .fontWeight(.bold)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0 ,maxHeight: 45)
                                .background(.teal)
                                .cornerRadius(10)
                                .padding(.horizontal, 10)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Spacer()
                
                VStack {
                    Text(myBMIResultALT)
                        .fontWeight(.bold)
                    if showmyBMIInterpert {
                        Text(myBMIInterpert)
                            .fontWeight(.light)
                            .padding(.horizontal, 10)
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                /*VStack {
                 Text("DEBUG")
                 Text("myWeight = \(self.myWeight)")
                 Text("myHeight = \(self.myHeight)")
                 Text("myBMIResult = \(self.myBMIResult)")
                 Text("myBMIInterpert = \(self.myBMIInterpert)")
                 }*/
                
            }
        }
        .navigationTitle("Calculate BMI")
    }
}

#Preview {
    MyCalcView()
}

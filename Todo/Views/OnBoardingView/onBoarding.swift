//
//  onBoarding.swift
//  Todo
//
//  Created by Marvis Ighedosa on 22/11/2023.
//

import SwiftUI

struct onBoarding: View {
    var body: some View {
        
            VStack {
                TabView {
                   DetailedBoardingiew(
                    onBoardingModel: OnBoardingModel(header: "Multiple Device", subHeading: "Please enter your email address or phone to reset your password", image: "Accountable"))
                    DetailedBoardingiew(
                        onBoardingModel: OnBoardingModel(header: "Time Saving machinee", subHeading: "Please enter your email address or phone to reset your password", image: "MultipleDevice"))
                    DetailedBoardingiew(
                        onBoardingModel: OnBoardingModel(header: "Get accountable for your task", subHeading: "Please enter your email address or phone to reset your password", image: "TimeSavingMachine"))
                        
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                NavigationLink {
                    EmptyState()
                } label: {
                    HStack {
                        Text("GET STARTED")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(24)
                            .frame(maxWidth: .infinity)
                            .background(Color("SecondaryColor"))
                            .cornerRadius(16)
                            
                    }
                    .padding(.horizontal,24)
                }
                
                Spacer()

            }
        
    }
}

struct onBoarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding()
    }
}

struct DetailedBoardingiew: View {
    
    var onBoardingModel:OnBoardingModel
    var body: some View {
        VStack(spacing:32){
            Image(onBoardingModel.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
            VStack(spacing: 16) {
                Text(onBoardingModel.header)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text(onBoardingModel.subHeading)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
            }
        }
        .padding(24)
    }
    
}


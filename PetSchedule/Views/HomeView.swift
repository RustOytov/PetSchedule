//
//  HomeView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI

struct HomeView: View {
    let viewModel: HomeVM
    
    var body: some View {
        VStack {
            Button {
                viewModel.showDetails()
            } label: {
                Text("Show details")
            }
            
            Button {
                viewModel.changeFeed()
            } label: {
                Text("change feed")
            }
            Button {
                viewModel.getWeatherTest()
            } label: {
                Text("get weather")
            }
        }
        .onAppear {
            viewModel.getLocation()
        }
    }
}


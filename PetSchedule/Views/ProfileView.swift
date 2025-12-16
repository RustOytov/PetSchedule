//
//  ProfileView.swift
//  PetSchedule
//
//  Created by Polaroytov on 12/16/25.
//

import SwiftUI

struct ProfileView: View {
    let viewModel: ProfileVM
    var body: some View {
        Button {
            viewModel.changeProfile()
        } label: {
            Text("changeProfile")
        }
        
        Button {
            viewModel.showImages()
        } label: {
            Text("showImages")
        }
    }
}

struct ImagesCollectionView: View {
    let viewModel: ProfileVM
    var body: some View {
        Button {
            viewModel.dismissImageCollection()
        } label: {
            Text("dismiss image collection")
        }
    }
}

struct ChangeProfileView: View {
    let viewModel: ProfileVM
    var body: some View {
        Button {
            viewModel.dismissChangeProfile()
        } label: {
            Text("dismiss change profile")
        }
    }
}


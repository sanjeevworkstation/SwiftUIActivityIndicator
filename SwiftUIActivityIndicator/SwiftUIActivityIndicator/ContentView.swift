//
//  ContentView.swift
//  SwiftUIActivityIndicator
//
//  Created by Sanjeev Gautam on 09/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var isHideLoader: Bool = true
    
    var body: some View {
        VStack {
            LoaderView(tintColor: .red, scaleSize: 3.0).padding(.bottom,50).hidden(isHideLoader)
            
            Button(action: {
                self.isHideLoader = !self.isHideLoader
            }, label: {
                if self.isHideLoader {
                    Text("Click to show Loader")
                } else {
                    Text("Click to hide Loader")
                }
            }).foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}

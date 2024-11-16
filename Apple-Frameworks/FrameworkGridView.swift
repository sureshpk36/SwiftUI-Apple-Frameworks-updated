//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Suresh PK on 04/09/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    
var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(MockData.frameworks){ framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                    
                }
                
            }.navigationTitle("🍎 Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetialView){
                    FrameworkDetialView(framework: viewModel.selectedFramework!,
                                        isShowingDetialView : $viewModel.isShowingDetialView)
                }
    }}}

struct FrameworkTitleView: View{
    let framework : Framework
    var body: some View{
        VStack{
            Image(framework.imageName)
                    .resizable()
                    .frame(width:90, height:90)
            Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                
        }
        .padding()
    }
}

#Preview {
    FrameworkGridView()
}














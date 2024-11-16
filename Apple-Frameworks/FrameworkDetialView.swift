//
//  FrameworkDetialView.swift
//  Apple-Frameworks
//
//  Created by Suresh PK on 07/09/24.
//

import SwiftUI

struct FrameworkDetialView: View {
    
    var framework: Framework
    @Binding var isShowingDetialView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack{
    
            HStack{
                Spacer()
                Button{
                    isShowingDetialView = false
                    
                }label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                    
                }
                
            }.padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()

            Button{
                isShowingSafariView = true
            }label: {
               AFButton(title: "Learn More")
            }
        }
        //can use .sheet instead of .fullScreenCover
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
        
    }
}

#Preview {
    FrameworkDetialView(framework: MockData.sampleFramework,
                        isShowingDetialView: .constant(false))
}


//
//  FrameGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Suresh PK on 07/09/24.
//

import SwiftUI

final class FrameGridViewModel: ObservableObject{
    
    var selectedFramework: Framework? {
        didSet{
            isShowingDetialView = true
        }
    }
    
    @Published var isShowingDetialView = false
}

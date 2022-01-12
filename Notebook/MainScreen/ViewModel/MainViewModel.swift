//
//  MainViewModel.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import Foundation

protocol MainViewModel {
    var data: [String] { get set }
}

class MainViewModelImpl {
    var data = ["Birthday", "Measure", "Anniversary", "Event"]
    
    init() {
        
    }
}

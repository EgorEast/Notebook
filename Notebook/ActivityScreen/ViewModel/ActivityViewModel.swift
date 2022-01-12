//
//  ActivityViewModel.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import Foundation

protocol ActivityViewModel {
    var data: [String] { get set }
}

class ActivityViewModelImpl {
    
    var data = ["Jeremy", "Maria Lul", "Jony Stark"]
    
    init() {
        
    }
}

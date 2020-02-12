//
//  ViewModelType.swift
//  ViewModels_RxSwift
//
//  Created by Adriano Ramos on 12/02/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//


protocol ViewModelType {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

//
//  SayHelloViewModel.swift
//  ViewModels_RxSwift
//
//  Created by Adriano Ramos on 12/02/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//

import RxSwift
import RxCocoa

final class SayHelloViewModel: ViewModelType {
    
    struct Input {
        let name: Observable<String>
        let validate: Observable<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let greeting = input.validate
            .withLatestFrom(input.name)
            .map { name in
                return "Hello \(name)"
            }
            .startWith("")
            .asDriver(onErrorJustReturn: ":-(")
        
        return Output(greeting: greeting)
    }
    
}

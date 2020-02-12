//
//  SayHelloViewController.swift
//  ViewModels_RxSwift
//
//  Created by Adriano Ramos on 12/02/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SayHelloViewController: UIViewController {
    typealias ViewModel = SayHelloViewModel
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let inputs = SayHelloViewModel.Input(name: nameTextField.rx.text.orEmpty.asObservable(),
                                             validate: validateButton.rx.tap.asObservable())
        
        let outputs = viewModel.transform(input: inputs)
        outputs.greeting
            .drive(greetingLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

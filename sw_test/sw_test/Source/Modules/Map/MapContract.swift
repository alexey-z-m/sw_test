//
//  MapContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMapProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMapProtocol {
    
    var view: PresenterToViewMapProtocol? { get set }
    var interactor: PresenterToInteractorMapProtocol? { get set }
    var router: PresenterToRouterMapProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMapProtocol {
    
    var presenter: InteractorToPresenterMapProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMapProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMapProtocol {
    
}

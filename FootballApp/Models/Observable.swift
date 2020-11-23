//
//  Observable.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
class Observable<T>{
    var value:T{
        didSet{
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    private var valueChanged:( (T)->() )?
    
    init(_ value:T) {
        self.value = value
    }
    
    //Add closure as an observer and trigger the closure imeediately if fireNow = true
    func addObserver(fireNow:Bool , _ onChange:( (T)->() )?){
        self.valueChanged = onChange
        
        if fireNow{
            onChange?(value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}

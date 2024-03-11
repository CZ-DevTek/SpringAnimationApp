//
//  DataStore.swift
//  SpringAnimationApp
//
//  Created by Carlos Garcia Perez on 12/3/24.
//

final class DataStore {
    
    static let shared = DataStore()

    let effects = [
        (
        preset: "",
        curve: "",
        force: "",
        duration: "",
        delay: ""
        )
    ]
    
  private init() {}
}

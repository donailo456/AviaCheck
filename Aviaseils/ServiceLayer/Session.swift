//
//  Session.swift
//  Aviaseils
//
//  Created by Danil Komarov on 05.08.2023.
//

import Foundation

class Session {
    static let shared = Session()
    private init() {}
    
    var departAt: String = ""
    var returnAt: String = ""
}

//
//  StarWarsAffiliation.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 17/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import Foundation

enum StarWarsAffiliation : String{
    
    case galacticEmpire = "Galactic Empire"
    case rebelAlliance = "Rebel Alliance"
    case firstOrder = "First Order"
    case jabbaCriminalEmpire = "Jabba's Crimial Empire"
    case unknow = "Unknown"
    
    static func by(name: String) -> StarWarsAffiliation{
        
        let aff : StarWarsAffiliation
        switch name {
        case StarWarsAffiliation.galacticEmpire.rawValue:
            aff = .galacticEmpire
            
        case StarWarsAffiliation.rebelAlliance.rawValue:
            aff = .rebelAlliance
            
        case StarWarsAffiliation.firstOrder.rawValue:
            aff = .firstOrder
            
        case StarWarsAffiliation.jabbaCriminalEmpire.rawValue:
            aff = .jabbaCriminalEmpire
        default:
            aff = .unknow
        }
        
        return aff
        
    }
    
    
    static func by(name: String?) -> StarWarsAffiliation{
        
        guard let realName = name else{
           return .unknow
        }
        
        return self.by(name: realName)
        
    }
    
}

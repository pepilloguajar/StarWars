//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 23/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import Foundation
import UIKit


// Representa a un conjunto de personajes
class StarWarsUniverse {
    
    //MARK: Utility types
    typealias StarWarsArray = [StarWarsCharacter]
    fileprivate typealias StarWarsDictionary = [StarWarsAffiliation : StarWarsArray]
    
    //MARK: - Propiedades
    fileprivate var dict : StarWarsDictionary = StarWarsDictionary()
    
    
    //MARK: Inicializador
    init(characters chars: StarWarsArray) {
        
        // Asignamos afiliaciones y un StarWarsArray vacio a cada una de ellas
        
        dict = makeEmptyAffiliations()
        
        
        // Nos pateamos el array de starwars y asignamos según afiliación
        
        for char in chars {
            dict[char.affiliation]?.append(char)
        }
        
    }
    
    
    
    //MARK: - Accessors
    var affiliationCount : Int{
        get{
            //Cuantas afiliaciones hay?
            return dict.count
        }
    }
    
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int {
        
        guard let count = dict[affiliation]?.count else {
            return 0
        }
        return count
    }
    
    func character(atIndex index: Int, forAffiliation affiliation: StarWarsAffiliation) -> StarWarsCharacter {
        
        // El personaje nº index de la afiliacion affiliation
        // Hacer de manera más segura
        let chars = dict[affiliation]!
        let char = chars[index]
        return char
        
    }
    
    // Devuelve el nombre de la afiliación
    func affiliationName(_ affiliation: StarWarsAffiliation) -> String {
        return affiliation.rawValue
    }
    
    
    
    
    
    
    //MARK: - Utils
    fileprivate func makeEmptyAffiliations() -> StarWarsDictionary {
        
        var d = StarWarsDictionary()
        
        d[.rebelAlliance] = StarWarsArray()
        d[.galacticEmpire] = StarWarsArray()
        d[.firstOrder] = StarWarsArray()
        d[.jabbaCriminalEmpire] = StarWarsArray()
        
        return d
    }
    

    
}

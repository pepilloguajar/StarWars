//
//  StarWarsCharacters.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 17/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import Foundation
import UIKit


class StarWarsCharacter {
    
    //MARK: - Stored properties
    let firstName    :   String?
    let lastName    :   String?
    let alias       :   String
    let soundData   :   Data
    let photo       :   UIImage
    let url         :   URL
    let affiliation :   StarWarsAffiliation
    
    
    //MARK: - Computed properties
    var name : String? {
        get{
            guard let first = firstName else {
                return lastName
            }
            
            guard let last = lastName else{
                return first
            }
            
            return "\(first) \(last)"
        }
    }
    
    
    
    //MARK: - Inicializador designado
    init(firstName: String?,
         lastName: String?,
         alias: String,
         sound: Data,
         photo: UIImage,
         wikiURL: URL,
         affiliation: StarWarsAffiliation){
        
        self.firstName = firstName
        self.lastName = lastName
        self.alias = alias
        soundData = sound
        self.photo = photo
        url = wikiURL
        self.affiliation = affiliation
        
    }
    
    
    convenience init(alias: String,
                     soundData: Data,
                     photo: UIImage,
                     affiliation: StarWarsAffiliation,
                     url: URL){
        self.init(firstName: nil, lastName: nil, alias: alias, sound: soundData, photo: photo,wikiURL: url, affiliation: affiliation)
        
        
    }
    
    
    
    
    
    
}

//
//  ForceSensitives.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 17/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import Foundation
import UIKit

class ForceSensitive: StarWarsCharacter {
    
    //MARK:  Stored properties
    let midichlorians: Int
    
    
    //MARK: Inicializador
    init(firstName: String?, lastName: String?,
         alias: String, sound: Data,
         photo: UIImage, wikiURL: URL,
         affiliation: StarWarsAffiliation, midichlorians: Int) {
        
        self.midichlorians = midichlorians
        super.init(firstName: firstName, lastName: lastName, alias: alias,
                   sound: sound, photo: photo, wikiURL: wikiURL, affiliation: affiliation)
        
        
    }
    
    convenience init(jediWithFirstName: String?,
                     lastName: String?,
                     alias: String,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     midichlorians: Int) {
        
        self.init(firstName: jediWithFirstName, lastName: lastName,
                  alias: alias, sound: soundData,
                  photo: photo, wikiURL: url,
                  affiliation: .rebelAlliance, midichlorians: midichlorians)
        
    }
    
    convenience init(sithWithFirstName: String?,
                     lastName: String?,
                     alias: String,
                     soundData: Data,
                     photo: UIImage,
                     url: URL,
                     midichlorians: Int) {
        
        self.init(firstName: sithWithFirstName, lastName: lastName,
                  alias: alias, sound: soundData,
                  photo: photo, wikiURL: url,
                  affiliation: .galacticEmpire, midichlorians: midichlorians)
        
    }
    
    
    
    
    
    
}

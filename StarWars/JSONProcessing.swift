//
//  JSONProcessing.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 19/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import Foundation
import UIKit

/*
{
    "firstName"    : "Anakin",
    "lastName"     : "Skywalker",
    "alias"        : "Darth Vader",
    "soundFile"    : "vader.caf",
    "imageFile"    : "vader.jpg",
    "jedi"         : false,
    "sith"         : true,
    "affiliation"  : "Galactic Empire",
    "url"          : "https://en.wikipedia.org/wiki/Darth_Vader",
    "midichlorians": 15000
}
*/

//MARK: - Aliases
typealias JSONObject    =   AnyObject
typealias JSONDictionary = [String : JSONObject]
typealias JSONArray = [JSONDictionary]


//MARK: Decodification
func decode(starWarsCharacter json: JSONDictionary) throws -> StarWarsCharacter{
    
        
    //Validamos el diccionario
    guard let urlString = json["url"] as? String, let url = URL(string: urlString) else{
        // la pringamos :(
        throw StarWarsError.wrongURLFormatForJSONResource
    }
    
    guard let imageName = json["imageFile"] as? String, let image = UIImage(named: imageName) else {
        throw StarWarsError.resourcePointdBYURLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String, let soundURL = Bundle.main.url(forResource: soundName), let sound = try? Data(contentsOf: soundURL) else{
        throw StarWarsError.resourcePointdBYURLNotReachable
    }

    // hemos comprobado todo lo más peligroso
    
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    guard let alias =  json["alias"] as? String else {
        throw StarWarsError.wrongJSONFormat
    }
    
    // Solo queda affiliation
    
    if let affiliationName = json["affiliation"] as? String{
        
        // Todo ha salido bien
        // Creamos el StarWarsCharacter
        return StarWarsCharacter(firstName: firstName, lastName: lastName,
                                 alias: alias, sound: sound,
                                 photo: image, wikiURL: url,
                                 affiliation: StarWarsAffiliation.by(name: affiliationName))
    }else{
        throw StarWarsError.wrongJSONFormat
    }
    
}


func decode(starWarsCharacter json: JSONDictionary?) throws -> StarWarsCharacter{
    guard let json = json else {
        throw StarWarsError.nilJSONObject
    }
    return try decode(starWarsCharacter: json)
}


func decode(forceSensitive json: JSONDictionary) throws -> ForceSensitive{
    
    //Validamos el diccionario
    guard let urlString = json["url"] as? String, let url = URL(string: urlString) else{
        // la pringamos :(
        throw StarWarsError.wrongURLFormatForJSONResource
    }
    
    guard let imageName = json["imageFile"] as? String, let image = UIImage(named: imageName) else {
        throw StarWarsError.resourcePointdBYURLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String, let soundURL = Bundle.main.url(forResource: soundName), let sound = try? Data(contentsOf: soundURL) else{
        throw StarWarsError.resourcePointdBYURLNotReachable
    }
    
    
    
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    guard let alias =  json["alias"] as? String else {
        throw StarWarsError.wrongJSONFormat
    }
    
    
    guard let jedi = json["jedi"] as? Bool, let sith = json["sith"] as? Bool, let md = json["midichlorians"] as? Int else {
        throw StarWarsError.wrongJSONFormat
    }
    
    guard jedi != sith else{
        throw StarWarsError.wrongJSONFormat
    }
    
    
    if let affiliationName = json["affiliation"] as? String{
        
        // Todo ha salido bien
        // Creamos el StarWarsCharacter
        return ForceSensitive(firstName: firstName, lastName: lastName,
                                 alias: alias, sound: sound,
                                 photo: image, wikiURL: url,
                                 affiliation: StarWarsAffiliation.by(name: affiliationName),
                                 midichlorians: md)
    }else{
        throw StarWarsError.wrongJSONFormat
    }

}


func decode(forceSensitive json: JSONDictionary?) throws -> ForceSensitive{
    
    guard let json = json  else {
        throw StarWarsError.nilJSONObject
    }
    
    return try decode(forceSensitive: json)
    
}


//MARK: - Loading
func loadFromLocalFile(fileName name :String, bundle: Bundle = Bundle.main) throws -> JSONArray{
    
    if let url = bundle.url(forResource: name),
        let data = try? Data(contentsOf: url),
        let maybeArray = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? JSONArray,
        let array = maybeArray{
        
        return array
    
    }else{
        throw StarWarsError.jsonParsingError
    }
    
    
}







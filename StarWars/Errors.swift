//
//  Errors.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 19/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import Foundation

enum StarWarsError : Error{
    case wrongURLFormatForJSONResource
    case resourcePointdBYURLNotReachable
    case wrongJSONFormat
    case nilJSONObject
    case jsonParsingError
    
}

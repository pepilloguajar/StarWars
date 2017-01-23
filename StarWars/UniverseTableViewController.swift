//
//  UniverseTableViewController.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 23/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import UIKit

class UniverseTableViewController: UITableViewController {
    
    //MARK: - Properties
    let model : StarWarsUniverse
    
    
    //MARK: - Inicializador
    init(model : StarWarsUniverse){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return model.affiliationCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Cuantos personajes hay en esta aff??
        return model.characterCount(forAffiliation: getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.affiliationName(getAffiliation(forSection: section))
    }

    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Definir un ide para el tip de celda
        let cellId = "StarWarsCell"
        
        // Averiguar la afiliación
        let aff = getAffiliation(forSection: indexPath.section)
        
        // Averiguar quién es el personaje
        let char = model.character(atIndex: indexPath.row, forAffiliation: aff)
        
        // Crear la celda -- Deberiamos meterlo dentro de un guard para quitar la obligación de return cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil{
            // El opcinal está vacio y toca crear la celda desde cero
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        // Configurarla
        cell?.imageView?.image = char.photo
        cell?.textLabel?.text = char.alias
        cell?.detailTextLabel?.text = char.name
        
        // Devolverla
        return cell!
    }

    
    
    //MARK: - Utils
    func getAffiliation(forSection section: Int) -> StarWarsAffiliation {
        
        var aff : StarWarsAffiliation = .unknow
        
        switch section {
        case 0:
            aff = .galacticEmpire
        case 1:
            aff = .rebelAlliance
        case 2:
            aff = .jabbaCriminalEmpire
        case 3:
            aff = .firstOrder
        default:
            aff = .unknow
        }
        
        return aff
        
    }
    
    
    
    
    
    
    
    
    

  }

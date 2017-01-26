//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 24/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var photoView: UIImageView!
    var model : StarWarsCharacter
    var player : AVAudioPlayer?
    
    
    //MARK: - Inicializadores
    init(model: StarWarsCharacter){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
        edgesForExtendedLayout = []
    }
    
    
    //MARK: - Sync model -> View
    func syncViewWithModel(){
        photoView.image = model.photo
        title = model.alias ?? model.name
    }
    
    
    
    //MARK: - Actions
    @IBAction func playSound(_ sender: UIBarButtonItem) {
        
        
        
        do{
            
            //Avisamos que vamos a reproducir un sonido
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // Le decimos qué formato de sonido vamos a reproducir
            player = try AVAudioPlayer(data: model.soundData, fileTypeHint: AVFileTypeCoreAudioFormat)
            player?.play()
            
            
        }catch let error as NSError{
            print("Errpr reproduciendo sonido")
            print("\(error)")
        }
        
        
        
    }
    
    
    @IBAction func displayWikipedia(_ sender: UIBarButtonItem) {
        
        print("llega")
        // Crear un WikiVC
        let wikiVC = WikiViewController(model: model)
        //Hacer un push
        navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
}



//MARK: - Protocolos
extension CharacterViewController : UniverseTableViewControllerDelegate{
    
    func universeTableViewController(_ uVC: UniverseTableViewController, didSelectCharacter char: StarWarsCharacter) {
        
        // Cambiamos el modelo
        model = char
        syncViewWithModel()
        
    }
    
    
}










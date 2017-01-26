//
//  WikiViewController.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 24/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var browser: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    let model : StarWarsCharacter
    
    //MARK: - Initialization
    init(model: StarWarsCharacter) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Sync model -> view
    func sycnViewWithModel(){
        
        // Creamos una URLRequest
        let req = URLRequest(url: model.url)
        
        // La cargamos
        browser.loadRequest(req)
        
    }

    
    //MARK: - Ciclo de vida 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sycnViewWithModel()
        browser.delegate = self
    }
    

}


//MARK : - UIWebViewDelegate
extension WikiViewController : UIWebViewDelegate{
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        // Mostrar el spinner 
        spinner.isHidden = false
        // Spinnearlo
        spinner.startAnimating()
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        // Oculto el spinner
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    
    
    
}






//
//  AppDelegate.swift
//  StarWars
//
//  Created by Jose Javier Montes Romero on 17/1/17.
//  Copyright © 2017 Jose Javier Montes Romero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Crear una Window de verdad
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Crear una instancia del modelo -- lanza errores por lo que tenemos que poner un do-catch
        do{
            // Array de diccionares de JSON
            var json = try loadFromLocalFile(fileName: "regularCharacters.json")
            let force = try loadFromLocalFile(fileName: "forceSensitives.json")
            json.append(contentsOf: force)
            
            // Crear un array de clases de Swift
            var chars = [StarWarsCharacter]()
            for dict in json{
                do{
                    let char = try decode(starWarsCharacter: dict)
                    chars.append(char)
                }catch{
                    print("Error al procesar \(dict)")
                }
                
            }
            
            // Podemos crar el modelo
            let model = StarWarsUniverse(characters: chars)
            
            // Creamos el UniverseVC
            let uVC = UniverseTableViewController(model: model)
            
            // Lo metemos en un Nav
            let uNav = UINavigationController(rootViewController: uVC)
            
            // Le decimos a la window quien es su root view controller
            window?.rootViewController = uNav
            
            // Mostramos la window
            window?.makeKeyAndVisible()
            
            return true
        }catch{
            fatalError("Error while loading Model from JSON")
        }
        
        

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//
//  SingleViewController.swift
//  mis recetas
//
//  Created by carlos aguilar hernandez on 24/10/16.
//  Copyright © 2016 carlos aguilar hernandez. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController{

    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*   por codigo  el delegado del viewcontroller de la tabla
         
        self.tableView.dataSource = self
        
        self.tableView.delegate = self
        
      */
        var recipe = Recipe(name: "tortilla de patatas", imagen: #imageLiteral(resourceName: "tortilla"), time: 20, ingredients : ["patatas", "huevos","cebolla"],steps : ["pelar las patatas y la cebolla","cortar las patatas y la cebolla y sofreir","batir los huevos y echarlos durante 1 minuto y echarlos al sarten con el resto"] )
        
        recipes.append(recipe)
        
        recipe = Recipe(name:"pizza margarita", imagen: #imageLiteral(resourceName: "pizza"),time : 60,ingredients : ["harina","levadira","aceite","sal","salsa de tomate","queso"],steps : ["hacemos la masa con harina ,levadura y huevos","dejamos reposar la masa 30 min","extendemos la masa encima de una bandeja y a;adimos el resto de ingredientes","hornear durante 12 min"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "hambuerguesa con queso", imagen: #imageLiteral(resourceName: "hamburguesa"),time : 10 ,ingredients: ["tomate","pan de hamburguesa","lechuga","queso","carne de hamburguesa"], steps : ["poner al fuego la carne al gusto","montar la hamburguesa con sus ingredientes con sus panes"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "ensalada cesar", imagen : #imageLiteral(resourceName: "ensalada"), time : 15 , ingredients : ["tomate","cebolla","lechuga","pimientos","pollo"], steps : ["limpiar todas la verdura y trocearlas","cocer el pollo","juntar todos los ingredientes en una ensaladera","servir con salsa cesar"])
        
        recipes.append(recipe)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ocultar barra de arriba
    override var prefersStatusBarHidden : Bool {
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SingleViewController : UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "FullRecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        
 /*       cell.textLabel?.text = recipe.name
        
        cell.imageView?.image = recipe.image
        */
        
        cell.imageTab.image  = recipe.image
        
        cell.labelComida.text = recipe.name
        
        return cell
    }
    


}

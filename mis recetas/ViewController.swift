//
//  ViewController.swift
//  mis recetas
//
//  Created by carlos aguilar hernandez on 24/10/16.
//  Copyright © 2016 carlos aguilar hernandez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    
    var recipes : [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///el titulo de la siguiente view de la barra de navegacion
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
          
        var recipe = Recipe(name: "tortilla de patatas", imagen: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients : ["patatas", "huevos","cebolla"],
                            steps : ["pelar las patatas y la cebolla","cortar las patatas y la cebolla y sofreir","batir los huevos y echarlos durante 1 minuto y echarlos al sarten con el resto"] )
        
        recipes.append(recipe)
        
        recipe = Recipe(name:"pizza margarita",
                        imagen: #imageLiteral(resourceName: "pizza"),
                        time : 60,
                        ingredients : ["harina","levadira","aceite","sal","salsa de tomate","queso"],
                        steps : ["hacemos la masa con harina ,levadura y huevos","dejamos reposar la masa 30 min","extendemos la masa encima de una bandeja y a;adimos el resto de ingredientes","hornear durante 12 min"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "hambuerguesa con queso", imagen: #imageLiteral(resourceName: "hamburguesa"),
                        time : 10 ,
                        ingredients: ["tomate","pan de hamburguesa","lechuga","queso","carne de hamburguesa"], steps : ["poner al fuego la carne al gusto","montar la hamburguesa con sus ingredientes con sus panes"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "ensalada cesar", imagen : #imageLiteral(resourceName: "ensalada"),
                        time : 15 ,
                        ingredients : ["tomate","cebolla","lechuga","pimientos","pollo"],
                        steps : ["limpiar todas la verdura y trocearlas","cocer el pollo","juntar todos los ingredientes en una ensaladera","servir con salsa cesar"])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Tacos", imagen: #imageLiteral(resourceName: "tacos"), time: 10, ingredients: ["tortilla","carne de res","aguacate","sal","salsa","cebolla","pepino"], steps: [""])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Enchiladas", imagen: #imageLiteral(resourceName: "enchilada"), time: 20, ingredients: ["tortilla","pollo","lechuga","crema","queso en polvo","tomate","limon"], steps: [""])
        
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ceviche", imagen: #imageLiteral(resourceName: "ceviche"), time: 15, ingredients: ["camarones","pepino","jugo de tomate","aguacate","cebolla","silatnro","chiles"], steps: ["cocer el camaron","picar las verduras ","mezclar todo en el jugo de tomate"])
        
        recipes.append(recipe)
        
    }

   
    
    /// aparece cada vez que se carga la pantlla
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //ocultar barra de arriba
    override var prefersStatusBarHidden : Bool {
    return true
    }
   
    
    ///// MARK : - UITableviewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
     
        cell.thumbnailImageView.image = recipe.image
        
        cell.nameLabel.text = recipe.name
        
        cell.timeLabel.text = "\(recipe.time) min"
        
        cell.ingredientsLabel.text = "ingredientes: \(recipe.ingredients.count)"
        
   /*     cell.thumbnailImageView.layer.cornerRadius = 91.5/2
        
        cell.thumbnailImageView.clipsToBounds = true
        */
        
        
  /*      if recipe.isFavourite {
            cell.accessoryType = .checkmark
        }else{
        
           cell.accessoryType = .none
        }
        */
        cell.accessoryType = .none
        
        return cell
    }
    
    
    // para llevar a cabo una edicion de un elemento
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
        self.recipes.remove(at: indexPath.row)
        
        
        
        }
        
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    ///a;adir acciones como compartir
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
       ///// //compatir por redes sociales
      
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexpath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App del curso de IOS 10 con juan gabriel"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText], applicationActivities: nil)
            
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
       ///borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexpath) in
            self.recipes.remove(at: indexpath.row)
            
            self.tableView.deleteRows(at: [indexpath], with: .fade)
        }
        
        
        deleteAction.backgroundColor = UIColor(colorLiteralRed: 202.0/255, green: 202.0/255, blue: 202.0/255, alpha: 1.0)
        
        
        return [shareAction, deleteAction]
    }
    


    
    
   // MARK : UITableViewDelegate
        //// cuando seleccionamos una fila se hace una accion
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
      /*
        
        let recipe = self.recipes[indexPath.row]
        
        
        let alertController : UIAlertController = UIAlertController(title: recipe.name, message: "valora este plato", preferredStyle: .actionSheet)
    
        let cancelAction : UIAlertAction = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        
        var favouriteActionTitle = "Favorita"
        var favouriteActionStyle = UIAlertActionStyle.default
      
        if recipe.isFavourite {
            favouriteActionTitle = "No favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        
        let favouriteAction : UIAlertAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            
            recipe.isFavourite = !recipe.isFavourite
            
            self.tableView.reloadData()
        }
        
        alertController.addAction(favouriteAction)
        
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)*/
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowRecipeDetail"{
        
            if let indexPath = self.tableView.indexPathForSelectedRow{
            
                let selectRecipe = self.recipes[indexPath.row]
                
                let destinationViewController = segue.destination as! DetailViewController
                
                destinationViewController.recipe = selectRecipe
            
            }
            
        
        }
        
    }
    
    

}


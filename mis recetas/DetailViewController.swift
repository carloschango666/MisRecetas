//
//  DetailViewController.swift
//  mis recetas
//
//  Created by carlos aguilar hernandez on 25/10/16.
//  Copyright © 2016 carlos aguilar hernandez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var recipeImageView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var recipe : Recipe!
    @IBOutlet var nameComida: UILabel!
    
    
    @IBOutlet var raitingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /// el titulo se pone el de cada receta q este seleccionada
        self.title = recipe.name
        
        
        self.recipeImageView.image = self.recipe.image
        
        self.nameComida.text = self.recipe.name
        
        ///cambiar el color de la tabla
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        
       ///// elimina las celdaslas rayas de las celdas vacias
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
        ///// el color de la linea de separacion de las celdas
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
       
        
        //// el tama;o de la celda para que se ajuste a nuestras caracteristicas
        self.tableView.estimatedRowHeight = 44.0
        
        ///  que se ajuste al contenido de la celda
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
        
        let image = UIImage(named: self.recipe.rating)
        ///cambiar la imagen del boton de raiting
        self.raitingButton.setImage(image, for: .normal)
        
        
        
        
    }

   // se llama cada vez que va a aparecer
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       ///
        //no ocultar la barra de navegacion
        navigationController?.hidesBarsOnSwipe = false
            
            ///si estaba oculto lo mostramos
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //// ocultar la barra de estado
    override var prefersStatusBarHidden: Bool {
    
         return true
    }
    
    
    
    ///// vincular el segue de la siguiente pantalla
 @IBAction func close(segue: UIStoryboardSegue) {
    
    
    if let reviewVC = segue.source as? ReviewViewController {
    
        if let rating = reviewVC.ratingSelected {
        
            ///// asignarle el valor de si es favortio a la receta
             self.recipe.rating = rating
            
             let image = UIImage(named: self.recipe.rating)
            ///cambiar la imagen del boton de raiting
            self.raitingButton.setImage(image, for: .normal)
       
            
        switch rating {
        case "dislike":
             self.raitingButton.backgroundColor = UIColor.red
        case "good":
            self.raitingButton.backgroundColor = UIColor.orange
            case "great":
            self.raitingButton.backgroundColor = UIColor.green
        default:
            break
        }
      
    

        }
    }
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



//para poder utilizar la tabla necesita estas extensiones

extension DetailViewController : UITableViewDataSource {

    /////////// CUANDO SE UTILIZA EL DELEGADO UITABLEVIEWDATASOURCE NO ESTAMOS OBLIGADOS A PONER "OVERRIDE"
    
    
    ///// PARA DEVOLVER SOLAMENTE UNA SOLA SECCION O LAS QUE SE NECESITEN
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    ////// NUMERO DE SECCIONES A CREAR EN LA TABLA
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2 :
            return self.recipe.steps.count
        default:
            return 0
        }
        
        
    }
    
    ////  PARA CONFIGURAR LA CELDA
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCellTableViewCell
  
        /// hace las celdas trasparentespara ver el color de fondo
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
             switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Nombre:"
            cell.valueLabel.text = self.recipe.name
        case 1 :
            cell.keyLabel.text = "Tiempo:"
            cell.valueLabel.text = "\(self.recipe.time!) min"
     /*   case 2:
            cell.keyLabel.text = "Favorita: "
            if self.recipe.isFavourite {
                cell.valueLabel.text = "Si"
            }else{
               cell.valueLabel.text = "No"
            }
       */
        default:
            break
        }
        case 1 :
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes:"
            }else{
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0{
                cell.keyLabel.text = "Pasos:"
            }else{
                cell.keyLabel.text = ""
            }
            
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
  
        default:
            break
        }
        
               return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var Title = ""
        
        switch section {
        case 1:
         Title = "Ingredientes"
        case 2:
            Title = "Pasos"
        default:
           break
            
            
        }
        
        return Title
    }

}

extension DetailViewController : UITableViewDelegate {



}





//
//  ReviewViewController.swift
//  mis recetas
//
//  Created by carlos aguilar hernandez on 26/10/16.
//  Copyright © 2016 carlos aguilar hernandez. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var firstButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    

    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    
    
    var ratingSelected : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //// efectos de con stilo difunidado
     let blurEffect = UIBlurEffect(style: .light)

        ///a partir de un efecto  le mandamos el efecto creado anterior mente
        
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        ///// para cjer el tama;o total de mipantalla
        blurEffectView.frame = view.bounds
        
        ///pasamos el efecto a la inagen que se coloca encima de ella se se coloca como una capa
        backgroundImageView.addSubview(blurEffectView)
    
    
    
    /////escalar la stackview para lograr un efecto
      /////para hacer variar tranformaciones tenemos que concatenarlas////
        
        ///que la estack view tubiera tama;o nulo
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        // para que poderlo mover de su posicion donde aparecera 
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
       // ratingStackView.transform = scale.concatenating(translation)  ///combinar escalado con translation
        
        /// mover los botones fuera de la stackview
        self.firstButton.transform = scale.concatenating(translation)
        
        self.secondButton.transform = scale.concatenating(translation)
        
        self.thirdButton.transform = scale.concatenating(translation)
    }
    
    
    ///// sobreecribir el metodo
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    /*    ///animacion de la stackView para que regrese a su estado original
        UIView.animate(withDuration: 0.5,delay: 0.0, options: [], animations: {
            
            ///transforma la stackview  a escalado de 1:1
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        /////////////////////////
       */
   
       /////////  otro metodo de animacion                coeficiente de rebote          velocidad de rebote
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
            
               self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
                    
                    self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                    }, completion: { (success) in
                        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
                            
                            self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                            
                            }, completion: nil )
                        
                } )
        } )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        ////// seleccionar por el tag que tiene los botones  y regresar el nombre del boton
        switch sender.tag {
        case 1:
            ratingSelected = "dislike" ///nombre dle primer boton
        case 2 :
            ratingSelected = "good" // nombre dle segundo boton
        case 3:
            ratingSelected = "great" // nombre
        default:
            break
        }
        
      /// forzar un segue   // fuerza unwindsegue para atras 
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
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

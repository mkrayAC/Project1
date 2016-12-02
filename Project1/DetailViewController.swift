//
//  DetailViewController.swift
//  Project1
//
//  Created by Oscar Hiram Alvarez Campos on 29/11/16.
//  Copyright © 2016 Mk-Projects. All rights reserved.
//

import UIKit
import Social


class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = selectedImage
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
            
            
            
        }
        // Do any additional setup after loading the view.
        
        
            imageView.isUserInteractionEnabled = true
            let longPG = UILongPressGestureRecognizer(target: self, action: #selector(self.memoryLongPressed))
            longPG.minimumPressDuration = 1
            imageView.addGestureRecognizer(longPG)
            
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(DetailViewController.barButtonItemClicked)), animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func barButtonItemClicked(){
        
            
            let alertController = UIAlertController(title: "Compartir", message: nil, preferredStyle: .actionSheet)
            
        
        
        let facebook = UIAlertAction(title: "Facebook", style: .default) { (_) in
            print("Facebook")
            let facebookService = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookService?.setInitialText("Mi imagen")
            facebookService?.add(self.imageView.image)
            self.present(facebookService!, animated: true, completion: nil)
            
        
            
        }
        let twitter = UIAlertAction(title: "Twitter", style: .default) { (_) in
            print("Twitter")
            let twitterService = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterService?.setInitialText("Mi imagen")
            twitterService?.add(self.imageView.image)
            self.present(twitterService!, animated: true, completion: nil)
            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("Cancel")
            
        }
        
        alertController.addAction(facebook)
        alertController.addAction(twitter)
        alertController.addAction(cancelAction)
   
        

            self.present(alertController, animated: true, completion: nil)
        }
        
    
    
    func memoryLongPressed(sender: UILongPressGestureRecognizer){
        if sender.state == .began{
            
            let alertController = UIAlertController(title: "Guardar foto", message: "¿Desea guardar la imagen?", preferredStyle: .alert)
            
            let accion1 = UIAlertAction(title: "Sí",
                                        style: UIAlertActionStyle.default) { _ in
                                            alertController.dismiss(animated: true, completion: nil)
                                            print("Sí")
                                            UIImageWriteToSavedPhotosAlbum(self.imageView.image!, nil, nil, nil)
            }
            
            
            
            let accion2 = UIAlertAction(title: "No",
                                        style: UIAlertActionStyle.cancel) { _ in
                                            print("no")
            }
            alertController.addAction(accion1)
            alertController.addAction(accion2)
            
            self.present(alertController, animated: true, completion: nil)
        }
        if sender.state == .ended{
        print("termino")
            
            
        }
        
        
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

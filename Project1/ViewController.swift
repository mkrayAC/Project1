//
//  ViewController.swift
//  Project1
//
//  Created by Oscar Hiram Alvarez Campos on 28/11/16.
//  Copyright © 2016 Mk-Projects. All rights reserved.
//

import UIKit

struct cellData {
    
    let cell : Int!
    let text : String!
    let image : UIImage!
}
class ViewController: UITableViewController {
    var pictures = [String]()
    
    //stard viewDidload
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
        
        title = "Storm viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try!fm.contentsOfDirectory(atPath: path)
        
        for items in items {
            if items.hasPrefix("nssl"){
            pictures.append(items)
                
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        print(pictures)
        
    }
    // end viewDidload

    //start numberofRows function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  pictures.count
    }
    //end numberofrows function

    //start cellforrow function
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //cell.textLabel?.text = pictures[indexPath.row]
        
        
        
        if indexPath.row % 2 == 0{
            
            
            
        let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1

        cell.mainImageView.image = UIImage(named: pictures[indexPath.row])
            cell.mainImageView.layer.cornerRadius = 99/2
            cell.mainImageView.clipsToBounds = true
        cell.mainLabel.text = pictures[indexPath.row]
            
        
        return cell
        }
        else{
        
            let cell2 = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
           cell2.mainImageView2.image = UIImage(named: pictures[indexPath.row])
            cell2.mainImageView2.layer.cornerRadius = 99/2
            cell2.mainImageView2.clipsToBounds = true
           cell2.mainLabel2.text = pictures[indexPath.row]
            
         
            
            return cell2
        
        }
    }
    //end cellforrow function
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
}


//
//  ViewController.swift
//  Project1
//
//  Created by Oscar Hiram Alvarez Campos on 28/11/16.
//  Copyright © 2016 Mk-Projects. All rights reserved.
//

import UIKit

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    //end cellforrow function
    
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


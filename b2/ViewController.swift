//
//  ViewController.swift
//  2
//
//  Created by Cntt24 on 7/5/17.
//  Copyright © 2017 Demo1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var imageView: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var url1: UITextField!
    @IBOutlet weak var url2: UITextField!
    
    @IBAction func download(_ sender: Any) {
        let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
        concurrentQueue.async {
            if(self.url1.text != ""){
                let catPictureURL = URL(string: self.url1.text!)!
                let session = URLSession(configuration: .default)
                
                
                let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
                    
                    if let e = error {
                        print("Error downloading cat picture: \(e)")
                    } else {
                        if let res = response as? HTTPURLResponse {
                            print("Downloaded cat picture with response code \(res.statusCode)")
                            // print(data ?? <#default value#>)
                            if let imageData = data {
                                let image = UIImage(data: imageData)
                                self.imageView.image = image
                                // Do something with your image.
                            } else {
                                print("Couldn't get image: Image is nil")
                            }
                        } else {
                            print("Couldn't get response code for some reason")
                        }
                        
                    }
                    
                    
                }
                downloadPicTask.resume()
            }
            
            
        }
        
        
        let concurrentQueue1 = DispatchQueue(label: "queuename1", attributes: .concurrent)
        concurrentQueue1.async {
            if(self.url2.text != ""){
                let catPictureURL = URL(string: self.url2.text!)!
                let session = URLSession(configuration: .default)
                
                
                let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
                    
                    if let e = error {
                        print("Error downloading cat picture: \(e)")
                    } else {
                        if let res = response as? HTTPURLResponse {
                            print("Downloaded cat picture with response code \(res.statusCode)")
                            // print(data ?? <#default value#>)
                            if let imageData = data {
                                let image = UIImage(data: imageData)
                                self.image2.image = image
                                // Do something with your image.
                            } else {
                                print("Couldn't get image: Image is nil")
                            }
                        } else {
                            print("Couldn't get response code for some reason")
                        }
                        
                    }
                    
                    
                }
                downloadPicTask.resume()
            }
            
            
        }
        
        
        
    }
    
    
}



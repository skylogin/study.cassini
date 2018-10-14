//
//  ImageViewController.swift
//  Cassini
//
//  Created by Awesome S on 15/10/2018.
//  Copyright © 2018 Awesome S. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageURL: NSURL? {
        didSet{
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage(){
        if let url = imageURL {
            if let imageData = NSData(contentsOf: url as URL){
                image = UIImage(data: imageData as Data)
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage?{
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
        get{
            return imageView.image
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(imageView)
        imageURL = NSURL(string: DemoURL.Stanford)

    }

   

}

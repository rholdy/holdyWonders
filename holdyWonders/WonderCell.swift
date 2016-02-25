//
//  WonderCell.swift
//  holdyWonders
//
//  Created by Ryan Holdaway on 2/3/16.
//  Copyright © 2016 Ryan Holdaway. All rights reserved.
//

import UIKit

class WonderCell: UICollectionViewCell {

  @IBOutlet weak var cellImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!

  var wonder: Wonder!

  func configureCell(wonder: Wonder) {
    self.wonder = wonder
    nameLabel.text = self.wonder.name.capitalizedString
    let url = self.wonder.image

    var image: UIImage?
//    this should probably by a helper method somewhere...
    let request: NSURLRequest = NSURLRequest(URL: url)
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
      image = UIImage(data: data!)
      self.cellImage.image = image
    })
  }


}

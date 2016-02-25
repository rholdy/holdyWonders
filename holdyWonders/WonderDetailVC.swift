//
//  WonderDetailVC.swift
//  holdyWonders
//
//  Created by Ryan Holdaway on 2/9/16.
//  Copyright © 2016 Ryan Holdaway. All rights reserved.
//

import UIKit
import MapKit

class WonderDetailVC: UIViewController {

  var wonder: Wonder!
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var regionLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var year_builtLabel: UILabel!

  @IBAction func wikiLinkButton(sender: AnyObject) {
    if let url = NSURL(string: wonder.wikipedia) {
      UIApplication.sharedApplication().openURL(url)
    }
  }

  @IBOutlet weak var wonderImage: UIImageView!
  @IBOutlet weak var wonderMap: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad()

    nameLabel.text = wonder.name
    regionLabel.text = wonder.region
    locationLabel.text = wonder.location
    year_builtLabel.text = wonder.year_built

    let initialLocation = CLLocation(latitude: wonder.latitude, longitude: wonder.longitude)
    centerMapOnLocation(initialLocation)

    let url = self.wonder.image

    var image: UIImage?
    let request: NSURLRequest = NSURLRequest(URL: url)
    //    not the right place for this... use the helper
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
      image = UIImage(data: data!)
      self.wonderImage.image = image
      })

  }

  let regionRadius: CLLocationDistance = 1000
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
      regionRadius * 2.0, regionRadius * 2.0)
    wonderMap.setRegion(coordinateRegion, animated: true)
  }

  @IBAction func backBtn(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }

}

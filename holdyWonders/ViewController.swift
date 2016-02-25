//
//  ViewController.swift
//  holdyWonders
//
//  Created by Ryan Holdaway on 2/3/16.
//  Copyright © 2016 Ryan Holdaway. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collection: UICollectionView!

  var wonders = [Wonder]()

  override func viewDidLoad() {
    super.viewDidLoad()
//    var wonder = Wonder(name: "Holdy's House", location: "Awesometown")
    collection.delegate = self
    collection.dataSource = self

    goGetCellData()
  }

//  TODO: Refactor this out to a module that loads this data.
  func goGetCellData() {
    let url = NSURL(string: "https://jsonblob.com/api/56ba9f54e4b01190df4dd0e4")!
    let data = NSData(contentsOfURL: url)

    do {
      let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
      if let wonderDict = object as? [Dictionary<String, AnyObject>] {
        //    readJSONObject(dictionary)
        for dict in wonderDict {
          let name = dict["name"]!
          let imageUrl = NSURL(string: dict["image"] as! String)
          let wikipedia = dict["wikipedia"]!
          let location = dict["location"]!
          let region = dict["region"]!
          let longitude = dict["longitude"]!
          let latitude = dict["latitude"]!
          let year_built = dict["year_built"]!

          let wonder = Wonder(
            name: name as! String,
            image: imageUrl!,
            wikipedia: wikipedia as! String,
            location: location as! String,
            region: region as! String,
            year_built: year_built as! String,
            longitude: longitude as! Double,
            latitude: latitude as! Double
          )

          wonders.append(wonder)
        }

      } else {
        print("its broken")
      }
    }
    catch {
      
    }
    
  }


  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

    if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WonderCell", forIndexPath: indexPath) as? WonderCell {

      let wonder = wonders[indexPath.row]
      cell.configureCell(wonder)
      return cell

    } else {
      return UICollectionViewCell()
    }
  }

  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    var wonder: Wonder!

    wonder = wonders[indexPath.row]

    performSegueWithIdentifier("WonderDetailVC", sender: wonder)
  }

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return wonders.count
  }

  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

    return CGSizeMake(200,200)
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "WonderDetailVC" {
      if let detailsVC = segue.destinationViewController as? WonderDetailVC {
        if let wonder = sender as? Wonder {
          detailsVC.wonder = wonder
        }
      }
    }
  }

}


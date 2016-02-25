//
//  Wonder.swift
//  holdyWonders
//
//  Created by Ryan Holdaway on 2/3/16.
//  Copyright © 2016 Ryan Holdaway. All rights reserved.
//

import Foundation

class Wonder {

  private var _name: String!
  private var _wikipedia: String!
  private var _location: String!
  private var _region: String!
  private var _longitude: Double!
  private var _latitude: Double!
  private var _image: NSURL!
  private var _year_built: String!

  var name: String {
    return _name
  }

  var image: NSURL {
    return _image
  }

  var wikipedia: String {
    return _wikipedia
  }

  var location: String {
    return _location
  }

  var region: String {
    return _region
  }

  var longitude: Double! {
    return _longitude
  }

  var latitude: Double! {
    return _latitude
  }

  var year_built: String! {
    return _year_built
  }

  init(name: String, image: NSURL, wikipedia: String, location: String, region: String, year_built: String, longitude: Double, latitude: Double) {
    self._name = name
    self._image = image
    self._wikipedia = wikipedia
    self._location = location
    self._region = region
    self._year_built = year_built
    self._longitude = longitude
    self._latitude = latitude
  }

}
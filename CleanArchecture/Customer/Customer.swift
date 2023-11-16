//
//  Customer.swift
//  CleanArchecture
//
//  Created by Hologram1 on 11/15/23.
//

import Foundation

struct Customer {
 let company: String
 let firstName: String
 let lastName: String
 let email: String
 let phone: String
 let billingAddress: Address
 let shippingAddress: Address
}

struct Country {
 let countryCode: String
 let countryId: String
 let countryName: String
}

struct Address {
  let address1: String
  let address2: String
  let state: String
  let city: String
  let country: Country
}

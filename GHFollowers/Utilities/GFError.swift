//
//  GFError.swift
//  GHFollowers
//
//  Created by Shilpa Joy on 2023-03-28.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from server was invalid. Please try again"
    case unableToFavorite = "There was an error favoriting this user"
    case alreadyInFavoirtes = "You have already favorited this user"
}

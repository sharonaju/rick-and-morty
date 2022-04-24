//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//


import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
    let info: Info?
    let results: [Character]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
}

// MARK: - Character
struct Character: Codable {
    let id: Int?
    let name: String?
    let episode: [String]?
    let image: String?
    let status: Status?
    let species: Species?
    let gender: Gender?
    let origin, location: Location?
    let type: String?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

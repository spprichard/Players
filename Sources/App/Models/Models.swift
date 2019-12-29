//
//  Models.swift
//  
//
//  Created by Steven Prichard on 12/27/19.
//

import Foundation
import MLBScrapperLib

struct HydrateRosterRequest: Codable {
    var teamID: Int
    
    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
    }
}

struct HydratePlayerCareerHittingStatsRequest: Codable {
    var playerID: Int
    var gameType: GameType
    
    enum CodingKeys: String, CodingKey {
        case playerID = "player_id"
        case gameType = "game_type"
    }
}

//
//  PlayerController.swift
//  
//
//  Created by Steven Prichard on 12/24/19.
//

import Foundation
import Vapor
import MLBScrapperLib

struct PlayerController: RouteCollection {
    func boot(router: Router) throws {
        router.get("api", "players", use: getAllHandler)
        router.post("api", "players", use: hydratePlayersHandler)
        router.get("api", "players", "hitting", "stats", use: getAllHittingStats)
        router.post("api", "players", "hitting", "stats", use: hydratePlayerCareerHittingStatsHandler)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[Player]> {
        return Player.query(on: req).all()
    }
    
    func hydratePlayersHandler(_ req: Request) throws -> Future<[Player]> {        
        return try req
            .content
            .decode(HydrateRosterRequest.self)
            .flatMap(to: [Player].self, { hydrate in
                let players = try Roster.GetPlayers(for: hydrate.teamID)
                return players
                    .map { $0.create(on: req) }
                    .flatten(on: req)
            })
            .catchMap({ error in
                throw Abort(.internalServerError, reason: "\(error)")
            })
    }
    
    func getAllHittingStats(_ req: Request) throws -> Future<[Player.CareerHittingStats]> {
        return Player.CareerHittingStats.query(on: req).all()
    }
    
    func hydratePlayerCareerHittingStatsHandler(_ req: Request) throws -> Future<Player.CareerHittingStats> {
        return try req
            .content
            .decode(HydratePlayerCareerHittingStatsRequest.self)
            .flatMap(to: Player.CareerHittingStats.self, { hydrate in
                let stats = try Player.CareerHittingStats.GetCareerHittingStats(gameType: hydrate.gameType, playerID: hydrate.playerID)
                return stats.create(on: req)
            })
    }
}

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
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[Player]> {
        return Player.query(on: req).all()
    }
}

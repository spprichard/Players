//
//  Extensions.swift
//  
//
//  Created by Steven Prichard on 12/24/19.
//

import Foundation
import Vapor
import FluentPostgreSQL
import MLBScrapperLib

extension Player: PostgreSQLModel {}
extension Player: Migration {}
extension Player: Content {}
extension Player: Model {}

extension Player: PostgreSQLMigration {
    public static func prepare(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return PostgreSQLDatabase.create(Player.self, on: connection) { builder in
            builder.field(for: \.id, isIdentifier: true)
            builder.field(for: \.Bats)
            builder.field(for: \.FullName)
            builder.field(for: \.Postion)
            builder.field(for: \.TeamID)
            builder.field(for: \.TeamName)
        }
    }
    
    public static func revert(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return PostgreSQLDatabase.delete(Player.self, on: connection)
    }
}


extension Player.CareerHittingStats: PostgreSQLModel {}
extension Player.CareerHittingStats: Migration {}
extension Player.CareerHittingStats: Content {}
extension Player.CareerHittingStats: Model {}

extension Player.CareerHittingStats: PostgreSQLMigration {
    public static func prepare(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return PostgreSQLDatabase.create(Player.CareerHittingStats.self, on: connection) { builder in
            builder.field(for: \.id, isIdentifier: true)
            builder.field(for: \.Homeruns)
            builder.field(for: \.AtBats)
            builder.field(for: \.BaseOnBalls)
            builder.field(for: \.BattingAverage)
            builder.field(for: \.BattingAverageOnBallsInPlay)
            builder.field(for: \.Games)
            builder.field(for: \.GroundedIntoDoublePlay)
            builder.field(for: \.HitByPitch)
            builder.field(for: \.Hits)
            builder.field(for: \.NumberOfPitches)
            builder.field(for: \.OnBasePercentage)
            builder.field(for: \.OnBasePlusSlugging)
            builder.field(for: \.Runs)
            builder.field(for: \.RunsBattedIn)
            builder.field(for: \.SluggingAverage)
            builder.field(for: \.TotalBases)
        }
    }
    
    public static func revert(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return PostgreSQLDatabase.delete(Player.CareerHittingStats.self, on: connection)
    }
}

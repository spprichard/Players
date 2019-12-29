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

extension Player.CareerHittingStats: PostgreSQLModel {}
extension Player.CareerHittingStats: Migration {}
extension Player.CareerHittingStats: Content {}
extension Player.CareerHittingStats: Model {}

//
//  Generate.swift
//  
//
//  Created by Vladislav Fitc on 09/11/2021.
//

import Foundation
import ArgumentParser

struct Generate: ParsableCommand {
    
  func run() throws {
    
    func randomParams() -> [TelemetryComponentParams] {
      return Array(TelemetryComponentParams.allCases.shuffled()[0..<Int.random(in: 1..<5)])
    }
    
    func randomComponentTypes() -> [TelemetryComponentType] {
      return Array(TelemetryComponentType.allCases.shuffled()[2..<Int.random(in: 3..<10)])
    }
    
    let schema = TelemetrySchema.with {
      $0.components = randomComponentTypes().map { type in
        TelemetryComponent.with { w in
          w.type = type
          w.isConnector = Bool.random()
          w.parameters = randomParams()
        }
      }
    }
    
    let schemaString = try schema.serializedData().base64EncodedString()
    
    print(schemaString)
  }
  
}

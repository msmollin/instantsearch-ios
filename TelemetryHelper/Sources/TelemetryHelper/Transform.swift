//
//  Transform.swift
//  
//
//  Created by Vladislav Fitc on 09/11/2021.
//

import Foundation
import ArgumentParser

struct Transform: ParsableCommand {
  
  @Argument(help: "application ID")
  var applicationID: String
  
  @Argument(help: "telemetry base64 encoded string")
  var encodedTelemetry: String
  
  func run() throws {
    guard let data = Data(base64Encoded: encodedTelemetry) else {
      throw Error.base64DecodingFailure
    }
    let schema = try TelemetrySchema(serializedData: data)
    for component in schema.components {
      var output = "\(applicationID),\(component.type)"
      var rawParams = component.parameters.map(\.description)
      if component.isConnector {
        rawParams.append("isConnector")
      }
      output += ",'\(rawParams.joined(separator: ","))'"
      print(output)
    }
  }
  
  enum Error: Swift.Error {
    case base64DecodingFailure
  }
  
}

extension TelemetryComponentParams {
  
  var description: String {
    return "\(self)"
  }
  
}

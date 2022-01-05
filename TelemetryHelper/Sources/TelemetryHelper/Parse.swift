//
//  Parse.swift
//  
//
//  Created by Vladislav Fitc on 09/11/2021.
//

import Foundation
import ArgumentParser

struct Parse: ParsableCommand {
  
  @Argument(help: "telemetry base64 encoded string")
  var input: String
  
  func run() throws {
    guard let data = Data(base64Encoded: input) else {
      throw Error.base64DecodingFailure
    }
    let schema = try TelemetrySchema(serializedData: data)
    print(schema)
  }
  
}

extension Parse {
  
  enum Error: Swift.Error {
    case base64DecodingFailure
  }
  
}

extension TelemetrySchema {
  
  init?(userAgentString: String) {
    let telemetryPrefix = "telemetry: "
    guard let telemetryRange = userAgentString.range(of: "\(telemetryPrefix).+==", options: .regularExpression) else {
      return nil
    }
    let telemetryBase64 = String(userAgentString[telemetryRange].dropFirst(telemetryPrefix.count))
    guard let data = Data(base64Encoded: telemetryBase64) else {
      return nil
    }
    guard let schema = try? TelemetrySchema(serializedData: data) else {
      return nil
    }
    self = schema
  }
 
}

import ArgumentParser

struct TelemetryHelper: ParsableCommand {
  
  static let configuration = CommandConfiguration(
    abstract: "A Swift command-line tool to help with InstantSearch telemetry",
    subcommands: [Generate.self, Parse.self, Transform.self])
  
}

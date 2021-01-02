import Vapor

struct MigrationMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
    }
    
    var help: String {
        "Generates a new migration."
    }
    
    func directory() -> String { "Migrations" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        return "Migration"
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        return [
            "name": signature.name,
            "schema": signature.name.lowercased().finished(with: "s")
        ]
    }
    
    func message(_ signature: Signature) -> String? {
        return "Remember to register your migration with: \n\t`app.migrations.add(\(signature.name)())`"
    }
}

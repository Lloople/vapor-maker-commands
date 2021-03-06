import Vapor

struct CommandMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
    }
    
    var help: String {
        "Generates a new command."
    }
    
    func directory() -> String { "Commands" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        return "Command"
    }
    
    func replaces(_ signature: Signature) -> [String: String] {
        return ["name": signature.name]
    }
    
    func message(_ signature: Signature) -> String? {
        return "Don't forget to register your command with: \n\t`app.commands.use(\(signature.name)(), as: \"mycommand\")`"
    }
}

import Vapor

struct ModelMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
    }
    
    var help: String {
        "Generates a new model."
    }
    
    func directory() -> String { "Models" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        return "Model"
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        return [
            "name": signature.name,
            "schema": signature.name.lowercased().finished(with: "s")
        ]
    }
    
    func message(_ signature: Signature) -> String? {
        nil
    }
}

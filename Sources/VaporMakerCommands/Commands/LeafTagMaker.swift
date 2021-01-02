import Vapor

struct LeafTagMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
    }
    
    var help: String {
        "Generates a new custom leaf tag."
    }
    
    func directory() -> String { "LeafTags" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        return "LeafTag"
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        return ["name": signature.name]
    }

    func message(_ signature: Signature) -> String? {
        return "Don't forget to register your tag with: \n\t`app.leaf.tags[\"now\"] = \(signature.name)()`"
    }
}

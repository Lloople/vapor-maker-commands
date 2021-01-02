import Vapor

struct ContentMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
        
        @Flag(name: "with-validation", short: "v")
        var withValidation: Bool
    }
    
    var help: String {
        "Generates a new content."
    }
    
    enum ContentType: String {
        case Content
        case WithValidation
    }
    
    func directory() -> String { "Contents" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        let type: ContentType = signature.withValidation
            ? .WithValidation
            : .Content
        
        return type.rawValue
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        return ["name": signature.name]
    }
    
    func message(_ signature: Signature) -> String? {
        return "You can use your content like: \n\t`let contentData = try req.content.decode(\(signature.name).self)`"
    }
}

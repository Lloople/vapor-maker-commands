import Vapor

struct ContentMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
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
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        
        let type: ContentType = signature.withValidation
            ? .WithValidation
            : .Content
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: type.rawValue, replaces: ["name": signature.name])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        return "You can use your content like: \n\t`let contentData = try req.content.decode(\(signature.name).self)`"
    }
}

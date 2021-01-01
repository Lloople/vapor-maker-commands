import Vapor

struct MiddlewareMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "after", short: "a")
        var after: Bool
    }
    
    var help: String {
        "Generates a new middleware."
    }
    
    enum MiddlewareType: String {
        case MiddlewareBefore
        case MiddlewareAfter
    }
    
    func directory() -> String { "Middlewares" }
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        
        let type: MiddlewareType = signature.after
            ? .MiddlewareAfter
            : .MiddlewareBefore
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: type.rawValue, replaces: ["name": signature.name])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        return "You can apply this middleware to all your routes with: \n\t`app.middleware.use(\(signature.name)())` \nor individually with: \n\t`app.group(\(signature.name)()) {`"
    }
}

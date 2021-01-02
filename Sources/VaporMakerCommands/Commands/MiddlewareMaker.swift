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
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        let type: MiddlewareType = signature.after
            ? .MiddlewareAfter
            : .MiddlewareBefore
        
        return type.rawValue
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        return ["name": signature.name]
    }
    
    func message(_ signature: Signature) -> String? {
        return "You can apply this middleware to all your routes with: \n\t`app.middleware.use(\(signature.name)())` \nor individually with: \n\t`app.group(\(signature.name)()) {`"
    }
}

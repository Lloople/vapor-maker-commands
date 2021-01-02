import Vapor

struct ControllerMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
        
        @Flag(name: "rest", short: "r")
        var rest: Bool
    }
    
    var help: String {
        "Generates a new controller."
    }
    
    enum ControllerType: String {
        case RestController
        case EmptyController
    }
    
    func directory() -> String { "Controllers" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        let type: ControllerType = signature.rest
            ? .RestController
            : .EmptyController
        
        return type.rawValue
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        return ["name": signature.name]
    }
    
    func message(_ signature: Signature) -> String? {
        return nil
    }
}

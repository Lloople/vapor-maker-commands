import Vapor

struct ControllerMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
        @Flag(name: "force", short: "f")
        var force: Bool
        
        @Flag(name: "rest", short: "r", help: "Include the default restful methods: index, create, edit, show, store, update, destroy")
        var rest: Bool
        
        @Flag(name: "boot", short: "b", help: "Include a default boot method for routing")
        var boot: Bool
    }
    
    var help: String {
        "Generates a new controller."
    }
    
    enum ControllerType: String {
        case RestController
        case EmptyController
        case BootController
    }
    
    func directory() -> String { "Controllers" }
    
    func force(_ signature: Signature) -> Bool {
        return signature.force
    }
    
    func filename(_ signature: Signature) -> String {
        return signature.name
    }
    
    func stub(_ signature: Signature) -> String {
        if (signature.rest) {
            return ControllerType.RestController.rawValue
        }
        
        if (signature.boot) {
            return ControllerType.BootController.rawValue
        }
        
        return ControllerType.EmptyController.rawValue
    }
    
    func replaces(_ signature: Signature) -> [String : String] {
        
        let replaces: [String:String] = ["name": signature.name]
        
        if (signature.boot) {
            replaces["route"] = signature.name.lowercased().replacingOccurrences(of: "controller", with: "")
        }
        
        return replaces
    }
    
    func message(_ signature: Signature) -> String? {
        return nil
    }
}

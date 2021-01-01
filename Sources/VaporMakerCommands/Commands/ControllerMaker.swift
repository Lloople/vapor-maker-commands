import Vapor

struct ControllerMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
        
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
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        let type: ControllerType = signature.rest
            ? .RestController
            : .EmptyController
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: type.rawValue, replaces: ["name": signature.name])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        return nil
    }
}

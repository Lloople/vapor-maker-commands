import Vapor

struct CommandMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
    }
    
    var help: String {
        "Generates a new command."
    }
    
    func directory() -> String { "Commands" }
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: "Command", replaces: ["name": signature.name])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        return "Don't forget to register your command with: \n\t`app.commands.use(\(signature.name)(), as: \"mycommand\")`"
    }
}

import Vapor

struct ModelMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
    }
    
    var help: String {
        "Generates a new model."
    }
    
    func directory() -> String { "Models" }
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: "Model", replaces: [
                "name": signature.name,
                "schema": signature.name.lowercased().finished(with: "s")
            ])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        nil
    }
}

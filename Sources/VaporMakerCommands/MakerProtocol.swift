import Vapor

protocol MakerProtocol: Command {
        
    func directory() -> String
        
    func message(_ signature: Signature) -> String?
    
    func filename(_ signature: Signature) -> String
    
    func stub(_ signature: Signature) -> String
    
    func replaces(_ signature: Signature) -> [String:String]
    
    func force(_ signature: Signature) -> Bool
    
}

extension MakerProtocol {
    
    func run(using context: CommandContext, signature: Signature) throws {
        let writer = Writer(path: "Sources/App/\(self.directory())")
        let reader = Reader(path: "Stubs/\(self.directory())")
        
        if writer.exists(self.filename(signature)) && !self.force(signature) {
            context.console.error("File `\(self.directory())/\(self.filename(signature))` already exists.")
            context.console.error("If you want to override it, use the `--force`")
            return
        }
        
        try writer.createFile(
            name: self.filename(signature),
            contents: reader.get(name: self.stub(signature), replaces: self.replaces(signature))
        )
        
        let message: String? = self.message(signature)
        
        context.console.print(message ?? "\(self.filename(signature)) created successfully. Build something amazing! :)")
    }
    
}

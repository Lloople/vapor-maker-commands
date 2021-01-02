import Vapor

extension Application {
    
    public func registerMakerCommands() {
        self.commands.use(CommandMaker(), as: "make:command")
        self.commands.use(ContentMaker(), as: "make:content")
        self.commands.use(ControllerMaker(), as: "make:controller")
        self.commands.use(LeafTagMaker(), as: "make:leaf-tag")
        self.commands.use(MiddlewareMaker(), as: "make:middleware")
        self.commands.use(MigrationMaker(), as: "make:migration")
        self.commands.use(ModelMaker(), as: "make:model")
    }
    
}

# Vapor Maker Commands

<p align="center">
    <a href="https://vapor.codes">
        <img src="http://img.shields.io/badge/Vapor-4-brightgreen.svg" alt="Vapor Logo">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/Swift-5.2-brightgreen.svg" alt="Swift 5.2 Logo">
    </a>
    <a href="https://github.com/lloople/vapor-maker-commands/actions">
        <img src="https://github.com/lloople/vapor-maker-commandsr/workflows/Swift/badge.svg?branch=main" alt="Build Status">
    </a>
    <a href="https://raw.githubusercontent.com/lloople/vapor-maker-commands/main/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License">
    </a>
</p>

This package installs a few helpful commands to help you bootstrap your Vapor application.

## Installation

Add the adapter in your dependencies array in **Package.swift**:

```swift
dependencies: [
    // ...,
    .package(url: "https://github.com/lloople/vapor-maker-commands.git", from: "1.0.0"),
],
```

Also ensure you add it as a dependency to your target:

```swift
targets: [
    .target(name: "App", dependencies: [
        .product(name: "VaporMakerCommands", package:"vapor-maker-commands"),
        .product(name: "Vapor", package: "vapor"), 
        // ..., 
    ]),
    // ...
]
```

Register the commands in your `configure.swift` file:

```swift
app.registerMakerCommands()
```

## Usage

### Controllers

Creates a new controller type inside `Sources/App/Controllers` path. `--rest` flag adds the default `CRUD` methods for your controller actions.

```
vapor run make:controller UsersController
vapor run make:controller PostsController --rest
vapor run make:controller PlayersController --boot
```

### Commands

Creates a new command type inside `Sources/App/Commands` path.

```
vapor run make:command CreateUserCommand
```

### Contents

Creates a new content type inside `Sources/App/Contents` path. `--with-validation` flag adds the `Validatable` extension to your content.


```
vapor run make:content UserContent
vapor run make:content UserContent --with-validation
```

### Custom Leaf Tags

Creates a new custom leaf tag type inside `Sources/App/LeafTags` path.

```
vapor run make:leaf-tag CopyrightTag
```

### Middlewares

Creates a new middleware type inside `Sources/App/Middlewares` path. `--after` flag will guide you on how to modify the response to be returned from your middleware.


```
vapor run make:middleware UserIsAdminMiddleware
vapor run make:middleware AddUserToResponseMiddleware --after
```

### Migrations

Creates a new migration type inside `Sources/App/Migrations` path.

```
vapor run make:migration UsersMigration
```

### Models

Creates a new model type inside `Sources/App/Models` path.

```
vapor run make:model User
```

#### Additional info

All commands come with a `--force` flag to override existing files.

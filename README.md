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
    .package(name: "VaporMakerCommands", url: "https://github.com/lloople/vapor-maker-commands.git", from: "1.0.0")
],
```

Also ensure you add it as a dependency to your target:

```swift
targets: [
    .target(name: "App", dependencies: [
        .product(name: "Vapor", package: "vapor"), 
        // ..., 
        "VaporMakerCommands"]),
    // ...
]
```

Register the commands in your `configure.swift` file

```swift
app.registerMakerCommands()
```

## Usage

### Controllers

```
vapor run make:controller UsersController
vapor run make:controller PostsController --restful
```

### Commands

```
vapor run make:command CreateUserCommand
```

### Contents

```
vapor run make:content UserContent
vapor run make:content UserContent --with-validation
```

### Custom Leaf Tags

```
vapor run make:leaf-tag CopyrightTag
```

### Middlewares

```
vapor run make:middleware UserIsAdminMiddleware
vapor run make:middleware AddUserToResponseMiddleware --after
```

### Migrations

```
vapor run make:migration UsersMigration
```

### Models

```
vapor run make:model User
```

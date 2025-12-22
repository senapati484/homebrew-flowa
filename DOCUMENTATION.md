# Flowa Programming Language - Complete Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Getting Started](#getting-started)
4. [Language Basics](#language-basics)
5. [Data Types](#data-types)
6. [Control Flow](#control-flow)
7. [Functions](#functions)
8. [Standard Library Modules](#standard-library-modules)
9. [Advanced Features](#advanced-features)
10. [Built-in Functions](#built-in-functions)
11. [Performance Tips](#performance-tips)
12. [Examples](#examples)
14. [Troubleshooting](#troubleshooting)

---

## Introduction

Flowa is a modern, dynamically-typed programming language designed for rapid development with built-in support for asynchronous programming, file I/O, authentication, email, databases, HTTP servers, and job scheduling. It compiles to bytecode and executes on a custom runtime with JIT compilation support.

## Version 0.1.7 (December 2025)

### Key Features

- **Dynamic Typing**: Variables can hold any type and change at runtime
- **First-class Functions**: Functions as first-class values with closure support
- **Async/Await**: Built-in asynchronous programming
- **Actor Model**: Message-passing concurrency without locks
- **Comprehensive Modules**: 12+ standard library modules for common tasks
- **Advanced JIT**: LLVM-powered Just-In-Time compilation with `TaggedValue` performance primitive
- **Automatic Memory Management**: Managed heap with object pooling and cleanup

---

## Installation

### From Source

```bash
./install.sh
```

This builds and installs the Flowa runtime to `/usr/local/bin/flowa`.

### Verify Installation

```bash
flowa --version
flowa examples/01_hello.flowa
```

---

## Getting Started

### Hello World

Create `hello.flowa`:

```flowa
print("Hello, Flowa!");
```

Run it:

```bash
flowa hello.flowa
```

### Interactive Environment

Configure environment variables in `.env`:

```
APP_NAME=MyApp
APP_VERSION=1.0
DEBUG=true
USER_NAME=Alice
```

Access via `env.VARIABLE_NAME` in your code.

---

## Language Basics

### Comments

```flowa
// Single-line comments supported
// Multiple lines require multiple comment markers
```

Note: The `#` character is not supported for comments.

### Variables

Declare variables with `let`. They are dynamically typed:

```flowa
let name = "Alice";
let age = 30;
let pi = 3.14159;
let active = true;
let data = null;
```

**Variable Rules:**

- Start with letter or underscore
- Can contain letters, digits, underscores
- Case-sensitive
- Reserved: `let`, `func`, `if`, `else`, `while`, `for`, `return`, `true`, `false`, `null` , `import` , `export`

### String Operations

```flowa
let str1 = "Hello";
let str2 = "World";
let combined = str1 + " " + str2;

let length = len(str1);
let upper_str = upper(str1);
let lower_str = lower(str2);
let substr = substring(str1, 1, 3);
let has_ell = contains(str1, "ell");
let trimmed = trim("  hello  ");
let replaced = replace(str1, "l", "L");
let starts = startsWith(str1, "He");
let ends = endsWith(str1, "lo");
let char = charAt(str1, 0);
let parts = split("a,b,c", ",");
```

### Numeric Operations

```flowa
let a = 10;
let b = 3;
let add = a + b;
let sub = a - b;
let mul = a * b;
let div = a / b;
let mod = a % b;
let pow = power(a, b);

let sqrt_val = sqrt(16);
let floor_val = floor(3.7);
let ceil_val = ceil(3.2);
let round_val = round(3.5);
let abs_val = abs(-5);
let min_val = min(10, 5);
let max_val = max(10, 5);
```

### Boolean Operations

```flowa
let x = true;
let y = false;
let and_result = x && y;
let or_result = x || y;
let not_result = !x;

let eq = 5 == 5;
let neq = 5 != 3;
let lt = 3 < 5;
let lte = 5 <= 5;
let gt = 5 > 3;
let gte = 5 >= 5;
```

---

## Data Types

### Arrays

```flowa
let arr = [];
let arr2 = [1, 2, 3, 4, 5];
let arr3 = [1, "two", 3.0, true];

let first = arr2[0];
let last = arr2[4];
arr2[2] = 30;

let pushed = push(arr, 1);
let popped = pop(arr);
let shifted = shift(arr);
let reversed = reverse([1, 2, 3]);
let sorted = sort([3, 1, 4, 1, 5]);
let sliced = slice([1, 2, 3, 4, 5], 1, 3);
let included = includes([1, 2, 3], 2);
let idx = indexOf([1, 2, 3, 2], 2);
let joined = join(["a", "b", "c"], "-");
```

### Hash (Object/Dictionary)

```flowa
let hash = {};
let hash2 = {
    "name": "Alice",
    "age": 30,
    "city": "New York"
};

let name = hash2["name"];
hash["key"] = "value";

let user = {
    "name": "Bob",
    "address": {
        "street": "123 Main St",
        "city": "Boston"
    }
};

let city = user["address"]["city"];
```

**Important**: Always use quoted strings for hash keys.

### Type Conversion

```flowa
let num = tonumber("42");
let str = tostring(42);
let type_str = type("hello");  // "string"
let type_num = type(42);       // "number"
let type_arr = type([]);       // "array"
```

---

## Control Flow

### If / Else

```flowa
let age = 18;

if (age >= 18) {
    print("Adult");
} else {
    print("Minor");
}

if (age < 13) {
    print("Child");
} else if (age < 18) {
    print("Teenager");
} else {
    print("Adult");
}
```

### While Loops

```flowa
let i = 0;
while (i < 5) {
    print(i);
    i = i + 1;
}
```

### For Loops

Standard C-style loop:

```flowa
for (let i = 0; i < 5; i = i + 1) {
    print(i);
}
```

For-In loop (iterating arrays):

```flowa
let fruits = ["apple", "banana", "cherry"];
for item in fruits {
    print(item);
}
```

### Break and Continue

```flowa
let i = 0;
while (i < 10) {
    if (i == 3) {
        i = i + 1;
        continue;
    }
    if (i == 7) {
        break;
    }
    print(i);
    i = i + 1;
}
```

---

## Functions

### Defining Functions

```flowa
func greet(name) {
    return "Hello, " + name;
}

let result = greet("Alice");
```

### Parameters and Return Values

```flowa
func add(a, b) {
    return a + b;
}

func multiply(x, y, z) {
    return x * y * z;
}

print(add(3, 4));
print(multiply(2, 3, 4));
```

### Variable Scope

```flowa
let global_var = "global";

func test_scope() {
    let local_var = "local";
    print(global_var);  // Can access
    print(local_var);
}

test_scope();
// print(local_var);  // ERROR - out of scope
```

### First-Class Functions and Closures

```flowa
func create_multiplier(factor) {
    func multiply(x) {
        return x * factor;
    }
    return multiply;
}

let double = create_multiplier(2);
let triple = create_multiplier(3);

print(double(5));   // 10
print(triple(5));   // 15
```

### Recursive Functions

```flowa
func factorial(n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

print(factorial(5));  // 120
```

---

## Standard Library Modules

### fs (File System)

**Module Implementation**: Handles file I/O operations with support for reading, writing, appending, and existence checking.

```flowa
fs.writeFile("output.txt", "Hello, File!");
let content = fs.readFile("output.txt");
print(content);

fs.appendFile("output.txt", "\nNew line");
let exists = fs.exists("output.txt");
print(exists);
```

### json (JSON Processing)

**Module Implementation**: Provides JSON serialization and deserialization with support for nested objects and arrays.

```flowa
let obj = {
    "name": "Bob",
    "age": 25,
    "active": true
};

let json_str = json.stringify(obj);
print(json_str);

let json_text = "{\"x\": 10, \"y\": 20}";
let parsed = json.parse(json_text);
print(parsed["x"]);
```

### auth (Authentication - Bcrypt)

**Module Implementation**: Implements bcrypt password hashing for secure authentication. Uses blowfish cipher with configurable rounds.

```flowa
let password = "mySecurePassword123";
let hash = auth.hash(password);

let is_valid = auth.verify(password, hash);
print(is_valid);  // true

let users = {};
users["alice"] = auth.hash("userPassword");

let login_valid = auth.verify("userPassword", users["alice"]);
print(login_valid);  // true
```

### jwt (JSON Web Tokens)

**Module Implementation**: Implements JWT token generation and verification. Uses HS256 algorithm with configurable expiry.

**Configuration (.env)**:

```
JWT_SECRET=your_secret_key
JWT_EXPIRY=3600
```

```flowa
let payload = {
    "user_id": 123,
    "username": "alice",
    "email": "alice@example.com"
};

let token = jwt.sign(payload);
print("Token: " + token);

let is_valid = jwt.verify(token);
print(is_valid);  // true

let decoded = jwt.decode(token);
print(decoded["user_id"]);  // 123
```

### mail (Email Sending - SMTP)

**Module Implementation**: Sends emails via SMTP using curl library. Supports Gmail and other SMTP servers.

**Configuration (.env)**:

```
SMTP_HOST=smtp.gmail.com
SMTP_USER=your_email@gmail.com
SMTP_PASSWORD=your_app_password
SMTP_PORT=587
TEST_EMAIL_TO=test@example.com
```

```flowa
let email_result = mail.send(
    "recipient@example.com",
    "Subject: Test Email",
    "This is the email body."
);
print(email_result);
```

### config (Environment Variables)

**Module Implementation**: Provides access to environment variables loaded from .env file.

```flowa
let app_name = env.APP_NAME;
let debug_mode = env.DEBUG;
let api_key = env.API_KEY;

if (env.APP_ENV == "production") {
    print("Running in production");
}
```

### log (Structured Logging)

**Module Implementation**: Provides structured logging with multiple log levels (info, warn, error, debug).

```flowa
log.info("Application started");
log.warn("Memory usage high");
log.error("Database connection failed");
log.debug("Debug information");
```

### sqlite (SQLite Database)

**Module Implementation**: Provides SQLite database operations with support for queries, transactions, and prepared statements.

```flowa
let db = sqlite.open("app.db");

sqlite.exec(db, "CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
)");

sqlite.exec(db, "INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com')");

let result = sqlite.query(db, "SELECT * FROM users WHERE id = 1");
print(result);

sqlite.exec(db, "UPDATE users SET email = 'newemail@example.com' WHERE id = 1");
sqlite.exec(db, "DELETE FROM users WHERE id = 2");

sqlite.close(db);
```

### cron (Job Scheduling)

**Module Implementation**: Implements cron-style job scheduling with support for scheduling periodic tasks using cron expressions.

```flowa
func daily_task() {
    print("This runs daily");
}

cron.schedule("0 2 * * *", daily_task);
cron.schedule("0 * * * *", func() {
    print("Every hour");
});

// Cron Format: minute hour day month weekday
// "0 0 * * *"     - Every day at midnight
// "0 * * * *"     - Every hour
// "*/15 * * * *"  - Every 15 minutes
// "0 9 * * 1-5"   - Weekdays at 9 AM
```

### http (HTTP Server and Client)

**Module Implementation**: Implements HTTP server and client with support for routes, request/response handling, and HTTP methods.

**Server Implementation**:

- Listens on configurable port
- Routes requests to handler functions
- Supports GET, POST, PUT, DELETE methods
- Returns responses with headers and body

**Client Implementation**:

- GET, POST, PUT, DELETE requests
- Header support
- Response body handling
- URL encoding/decoding

```flowa
let server = http.createServer();

server.on("GET", "/", func(req, res) {
    res.writeHead(200, {"Content-Type": "text/html"});
    res.end("<h1>Hello, World!</h1>");
});

server.on("POST", "/api/data", func(req, res) {
    let json_data = json.parse(req.body);
    res.writeHead(200, {"Content-Type": "application/json"});
    res.end(json.stringify({"status": "received"}));
});

server.listen(3000);

// Client
let response = http.get("https://api.example.com/data");
let api_data = json.parse(response);
```

**Security Features:**

The HTTP server includes built-in security hardening:

```flowa
let server = http.createServer();

// 1. Origin/Domain Filtering
server.setDevMode(true);              // Auto-allow localhost (dev)
server.setAllowedOrigins(["example.com", "*.myapp.com"]);
server.addAllowedOrigin("api.trusted.io");

// 2. Rate Limiting (per IP)
server.setRateLimit(60);              // 60 requests/minute per IP

// 3. Request Body Size Limit
server.setMaxBodySize(1048576);       // 1MB max body size

// 4. CORS (Cross-Origin Resource Sharing)
server.enableCORS(true);
server.setCORSOrigins(["frontend.example.com", "*"]);

server.listen(3000);
```

**Security Method Reference:**

| Method | Description |
|--------|-------------|
| `setDevMode(bool)` | Allow localhost in development |
| `setAllowedOrigins(array)` | Whitelist allowed origins |
| `addAllowedOrigin(string)` | Add single origin to whitelist |
| `setRateLimit(int)` | Requests per minute per IP |
| `setMaxBodySize(bytes)` | Max request body size |
| `enableCORS(bool)` | Enable CORS headers |
| `setCORSOrigins(array)` | Allowed CORS origins |

**HTTP Response Codes:**
- `403 Forbidden` - Origin not allowed
- `429 Too Many Requests` - Rate limit exceeded
- `413 Payload Too Large` - Body size limit exceeded

### os (Operating System)

**Module Implementation**: Provides OS-level operations including environment variables, command execution, and path utilities.

```flowa
let user = os.env("USER");
let home = os.env("HOME");

let output = os.exec("echo 'Hello from shell'");
print(output);

let cwd = os.cwd();
os.chdir("/path/to/directory");

let platform = os.platform();  // "darwin", "linux", "windows"
let arch = os.arch();          // "x64", "arm64"
```

---

## Module System (Import/Export)

Flowa provides a powerful module system for organizing code across multiple files and creating reusable components.

### Exporting from Modules

Use the `export` keyword to make variables and functions available to other files:

**module_a.flowa**:
```flowa
export let message = "Hello from Module A";

export func greet(name) {
    return "Hello, " + name;
}

export let version = "1.0.0";
```

**Note**: Exported symbols must be declared with `export` before the `let` or `func` keyword.

### Importing from Modules

Use the `import` statement with destructuring syntax to import specific symbols:

```flowa
import { message, greet } from "path/to/module_a.flowa";

print(message);           // "Hello from Module A"
print(greet("World"));    // "Hello, World"
```

### Module Path Resolution

Flowa resolves module paths relative to the current file or script execution directory:

```flowa
// Relative to current file
import { utils } from "./utils.flowa";
import { config } from "../config/settings.flowa";

// Relative to execution directory
import { helpers } from "src/helpers.flowa";
```

### Module Execution

- Modules are executed **once** when first imported
- Subsequent imports reuse the already-loaded module
- Module code runs in isolated scope
- Exports are cached for performance

**Example**:

**counter.flowa**:
```flowa
let count = 0;

export func increment() {
    count = count + 1;
    return count;
}

export func getCount() {
    return count;
}
```

**main.flowa**:
```flowa
import { increment, getCount } from "counter.flowa";

print(increment());  // 1
print(increment());  // 2
print(getCount());   // 2
```

### Best Practices

**1. Use Clear Names**:
```flowa
// Good
export func calculateTotal(items) { ... }

// Avoid
export func calc(x) { ... }
```

**2. Group Related Exports**:
```flowa
// math_utils.flowa
export func add(a, b) { return a + b; }
export func subtract(a, b) { return a - b; }
export func multiply(a, b) { return a * b; }
```

**3. Avoid Circular Dependencies**:
```flowa
// Avoid: a.flowa imports b.flowa, b.flowa imports a.flowa
```

**4. Module Organization**:
```
project/
  ├── main.flowa
  ├── utils/
  │   ├── string.flowa
  │   └── array.flowa
  └── services/
      ├── auth.flowa
      └── database.flowa
```

### Complete Example

**models/user.flowa**:
```flowa
export func createUser(name, email) {
    return {
        "name": name,
        "email": email,
        "created": "2024-01-01"
    };
}

export func validateEmail(email) {
    return contains(email, "@");
}
```

**services/auth.flowa**:
```flowa
import { createUser, validateEmail } from "../models/user.flowa";

export func registerUser(name, email, password) {
    if (!validateEmail(email)) {
        return null;
    }
    
    let user = createUser(name, email);
    user["password_hash"] = auth.hash(password);
    return user;
}
```

**main.flowa**:
```flowa
import { registerUser } from "services/auth.flowa";

let user = registerUser("Alice", "alice@example.com", "secret123");
if (user != null) {
    print("User registered: " + user["name"]);
}
```

---

## Advanced Features

### Async/Await

```flowa
async func fetch_data(url) {
    // Asynchronous operation
    return "data";
}

// Using promises (if supported)
let promise = fetch_data("https://api.example.com");
```

### Error Handling (Try-Catch-Finally)

Flowa supports structured exception handling with `try`, `catch`, and `finally` blocks:

```flowa
// Basic try-catch
try {
    let result = riskyOperation();
} catch (e) {
    print("Error: " + e);
}

// Try-catch-finally
try {
    let file = openFile("data.txt");
    processFile(file);
} catch (e) {
    print("Error: " + e["message"]);
} finally {
    print("Cleanup executed");
}

// Throw custom errors
func validateAge(age) {
    if (age < 0) {
        throw "Age cannot be negative";
    }
    if (age > 150) {
        throw { "code": 400, "message": "Invalid age" };
    }
    return true;
}

// Catching structured errors
try {
    validateAge(-5);
} catch (e) {
    // For runtime errors, e contains:
    // - e["message"] - error description
    // - e["type"] - error type (e.g., "RuntimeError")
    // - e["line"] - line number where error occurred
    print("Error at line " + e["line"] + ": " + e["message"]);
}
```

**Error Object Properties:**
- `message` - The error message/description
- `type` - The type of error (e.g., "RuntimeError")
- `line` - Line number where the error occurred (when available)

### Higher-Order Functions

```flowa
func apply_to_array(arr, fn) {
    let result = [];
    let i = 0;
    while (i < len(arr)) {
        result = push(result, fn(arr[i]));
        i = i + 1;
    }
    return result;
}

func double(x) {
    return x * 2;
}

let numbers = [1, 2, 3, 4, 5];
let doubled = apply_to_array(numbers, double);
print(doubled);
```

---

## Built-in Functions

### Type Functions

| Function | Purpose | Example |
|----------|---------|---------|
| `type(x)` | Get type of value | `type(42)` → `"number"` |
| `len(x)` | Length | `len("hello")` → `5` |
| `tonumber(s)` | Convert to number | `tonumber("42")` → `42` |
| `tostring(x)` | Convert to string | `tostring(42)` → `"42"` |
| `str(x)` | Alias for tostring | `str(42)` → `"42"` |
| `int(x)` | Alias for tonumber | `int("42")` → `42` |

### String Functions

| Function | Purpose |
|----------|---------|
| `upper(s)` | Convert to uppercase |
| `lower(s)` | Convert to lowercase |
| `substring(s, start, end)` | Extract substring |
| `contains(s, substr)` | Check if contains |
| `trim(s)` | Remove whitespace |
| `replace(s, old, new)` | Replace text |
| `split(s, delim)` | Split into array |
| `join(arr, sep)` | Join with separator | `join(["a", "b"], "-")` → `"a-b"` |
| `startsWith(s, p)` | Check prefix | `startsWith("abc", "a")` → `true` |
| `endsWith(s, suf)` | Check suffix | `endsWith("abc", "c")` → `true` |
| `charAt(s, i)` | Get char at index | `charAt("abc", 0)` → `"a"` |


### Array Functions

| Function | Purpose |
|----------|---------|
| `push(arr, x)` | Add element |
| `pop(arr)` | Remove last |
| `shift(arr)` | Remove first |
| `reverse(arr)` | Reverse array |
| `sort(arr)` | Sort array |
| `slice(arr, start, end)` | Extract portion |
| `includes(arr, x)` | Check contains |
| `indexOf(arr, x)` | Find index |

### Math Functions

| Function | Purpose |
|----------|---------|
| `sqrt(x)` | Square root |
| `power(x, y)` | Exponentiation |
| `floor(x)` | Round down |
| `ceil(x)` | Round up |
| `round(x)` | Round nearest |
| `abs(x)` | Absolute value |
| `min(a, b)` | Minimum |
| `max(a, b)` | Maximum |

### System Functions

| Function | Purpose |
|----------|---------|
| `exit(code)` | Terminate program |
| `sleep(ms)` | Sleep for milliseconds |
| `random()` | Random number (0-100) |

### Error Handling (Result)

| Function | Purpose |
|----------|---------|
| `Ok(val)` | Create success result |
| `Err(val)` | Create error result |
| `isOk(res)` | Check if success |
| `isErr(res)` | Check if error |
| `unwrap(res)` | Get value or panic |

---

## Performance Tips

### 1. Loop Optimization

Cache array length outside loop to avoid recalculation.

### 2. String Concatenation

Build arrays and join instead of repeated concatenation.

### 3. Array Access

Direct index access is faster than repeated array operations.

### 4. Function Caching

Cache expensive calculation results for reuse.

### 5. Benchmark Results

### 5. Benchmark Results

**Performance on Apple Silicon (arm64):**

- **100M Loop**: **0.34s** (LLVM JIT)
- **10M Loop**: **0.06s**
- **5M Printing**: **0.04s**

See [PERFORMANCE.md](PERFORMANCE.md) for full details.

---

## Examples

### User Authentication System

```flowa
let users = {};

func register_user(username, password, email) {
    if (username in users) {
        return false;
    }
    users[username] = {
        "email": email,
        "password": auth.hash(password)
    };
    return true;
}

func login_user(username, password) {
    if (!(username in users)) {
        return false;
    }
    let stored_hash = users[username]["password"];
    return auth.verify(password, stored_hash);
}

func create_session_token(username) {
    let payload = {"username": username};
    return jwt.sign(payload);
}
```

### REST API Handler

```flowa
func handle_get_users(req, res) {
    let db = sqlite.open("app.db");
    let users = sqlite.query(db, "SELECT id, name, email FROM users");
    sqlite.close(db);
    res.writeHead(200, {"Content-Type": "application/json"});
    res.end(json.stringify(users));
}

let server = http.createServer();
server.on("GET", "/api/users", handle_get_users);
server.listen(3000);
```

---

## Troubleshooting

**"Parser error: left side of assignment must be an identifier"**

- Ensure assignments use `a = a + 1`, not `a += 1`

**"Unknown module"**

- Verify module name is correct and case-sensitive
- Available: fs, json, auth, jwt, mail, config, log, sqlite, cron, http, os

**"Undefined variable"**

- Declare with `let` before use
- Check variable scope

**Email sending fails**

- Verify .env SMTP configuration
- Gmail requires App Password, not regular password
- Check network connectivity

---

## Version Information

- **Current Version**: 0.1.4 (December 2024)
- **Language**: Flowa 0.1
- **Runtime**: C++17 bytecode interpreter with JIT
- **Supported Platforms**: Linux, macOS (including Apple Silicon), Windows

---

## Architecture Overview

### Compiler Pipeline

The Flowa compiler implements a standard pipeline architecture:

1. **Lexer** (`lexer.cpp`): Tokenizes source code into tokens (keywords, identifiers, literals, operators)
2. **Parser** (`parser.cpp`): Builds Abstract Syntax Tree (AST) from tokens using recursive descent parsing
3. **AST** (`ast.cpp`): Represents program structure as tree nodes (expressions, statements, blocks)
4. **Constant Folder** (`constant_folder.cpp`): Optimizes constant expressions at compile time
5. **Bytecode Compiler** (`compiler.cpp`): Converts AST to bytecode instructions
6. **Bytecode** (`bytecode.cpp`): Represents low-level instructions for the runtime

### Runtime Execution

1. **Memory Manager** (`memory_manager.cpp`): Manages heap allocation with reference counting and garbage collection
2. **Object System** (`object.h`): Defines object types (strings, arrays, hashes, functions, etc.)
3. **Environment** (`environment.h`): Stores variable bindings for scope management
4. **JIT Compiler** (`jit/compiler.cpp`): Translates hot bytecode paths to native x64/arm64 machine code
5. **JIT Executor** (`jit/executor.cpp`): Executes compiled native code with register allocation
6. **JIT Assembler** (`jit/assembler.cpp`): Generates native machine instructions for JIT compilation
7. **Event Loop** (`event_loop.cpp`): Manages asynchronous operations and concurrent tasks
8. **Scheduler** (`scheduler.cpp`): Schedules and executes tasks with priority queues

### Module System

All modules are implemented as C++ builtins registered in the runtime:

- **Builtin Registration**: `builtins.cpp` registers all module functions
- **Module Functions**: Each module (fs, json, etc.) implemented in dedicated source files
- **Global Module Access**: Modules are accessible globally (e.g., `fs.readFile()`)
- **Dynamic Loading**: Module loader can load additional modules at runtime

### Concurrency Model

1. **Actor Model**: Message-passing between actors for safe parallelism
2. **Event Loop**: Manages event queue for non-blocking I/O
3. **Scheduler**: Coordinates task execution with configurable policies
4. **Task System** (`task.cpp`): Represents schedulable units of work

---

## Contributing

See `/docs/CONTRIBUTING.md` for guidelines on contributing to Flowa.

## License

See `LICENSE` file in repository root.

Last Updated: December 2024

if (true){
    print("Release Candidate")
} else {
    print("Beta")
}

let i = 0
while (i < 5) {
    print(i)
    i = i + 1
}

```

### Functions

Functions are first-class citizens defined with `func`.

```flowa
func add(a, b) {
    return a + b
}

let sum = add(5, 10)
```

---

## Object-Oriented Programming

### Classes

Classes support methods and fields.

```flowa
class User {
    func init(name) {
        this.name = name;
    }

    func greet() {
        print("Hello, " + this.name);
    }
}

let user = new User("Alice");
user.greet();         // Hello, Alice
print(user.name);     // Alice
```

#### Constructors (init)

The `init` method is automatically called when a new instance is created with the `new` keyword. All arguments passed to `new ClassName(...)` are forwarded to the `init` method.

#### Inheritance

Flowa supports single inheritance using the `class Child < Parent` syntax.

```flowa
class Admin < User {
    func init(name, role) {
        super.init(name);
        this.role = role;
    }

    func info() {
        print(this.name + " is an " + this.role);
    }
}
```

---



### Concurrency (Actor Model)

Flowa uses the Actor Model for concurrency. Actors share no memory and communicate via messages.

#### Defining Actors

Defined using the `actor` keyword. Actors are like classes but their methods are executed asynchronously in their own task context.

```flowa
actor Worker {
    func process(data) {
        print("Processing:", data);
    }
}
```

#### Message Passing

Use `spawn` to create an actor instance. Method calls on an actor instance are non-blocking and return immediately.

```flowa
let w = spawn Worker();
w.process("Task 1"); // Asynchronous call
```

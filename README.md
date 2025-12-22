<p align="center">
  <img src="https://github.com/senapati484/flowa/blob/main/data/flowa-bg-removed.png" alt="Flowa Logo" width="200" />
</p>

<h1 align="center">Flowa</h1>

<p align="center"><strong>Server-first language for modern web applications</strong></p>

<p align="center">
  <em>A high-performance, JIT-compiled scripting language designed for backend development, concurrency, and rapid prototyping. It features an Actor-based concurrency model, built-in networking (HTTP/JSON), database integration (SQLite), and a familiar C-style syntax.</em>
</p>

## Features

- **🚀 High-Performance JIT**: Built on a custom V8-style JIT compiler that translates Flowa bytecode directly into native x64 machine code for maximum speed.
- **🎭 Actor Model Concurrency**: Built-in `actor`, `spawn`, and message passing (`send`/`receive`) primitives allow for lock-free, scalable concurrency, similar to Erlang or Akka.
- **🌐 Native Networking**: First-class support for HTTP servers and clients (`http`) with a high-performance event loop. Includes a fast `json` parser/serializer.
- **💾 Embedded Database**: Integrated SQLite engine (`sqlite`) for robust, zero-configuration persistence. Perfect for standalone apps and microservices.
- **⚡ Async & Scheduling**: System-level non-blocking I/O and a native `cron` module for scheduling periodic tasks without external tools.
- **🛠️ Developer Experience**:
  - **Scaffolding**: Generate full-stack apps, servers, or libraries with `flowa new` and `flowa full`.
  - **Testing**: Built-in testing framework (`flowa test`) with rich assertions.
  - **Tooling**: Includes REPL, disassembler, and structured logging.
- **📦 Included Batteries**:
  - **File System**: Sync/Async file operations (`fs`).
  - **System**: Environment variables and OS interaction (`os`, `env`).
  - **Email**: Native SMTP client for sending emails (`mail`).
  - **Security**: JWT signing/verification and BCrypt hashing (`auth`, `jwt`).

## Installation

### macOS

**Homebrew (Recommended)**:
```bash
brew install senapati484/flowa
```

**From Source**:
```bash
./install.sh
```

### Windows

**Installer (Recommended)**:
1. Download `flowa-installer-windows.exe` from [Releases](https://github.com/yourusername/flowa/releases)
2. Run the installer
3. Flowa is automatically added to your PATH

**From Source**:
```cmd
build-windows.bat
```

### Linux

**Pre-built Binary**:
```bash
wget https://github.com/yourusername/flowa/releases/download/v1.0.0/flowa-linux-x64.tar.gz
tar -xzf flowa-linux-x64.tar.gz
sudo mv flowa /usr/local/bin/
```

**From Source**:
```bash
./install.sh
```

See [INSTALL.md](docs/INSTALL.md) for detailed installation instructions.

## Quick Start

### Installation

#### One-Command Install (Mac/Linux)

```bash
./install.sh
```

#### Homebrew (macOS)

```bash
brew tap senapati484/flowa
brew install flowa
```

#### Windows

Run the PowerShell script:

```powershell
.\scripts\install_windows.ps1
```

### Build from Source

Prerequisites: `cmake`, `clang++` (supporting C++17), `sqlite3`.

```bash
./build.sh
```

### Run an Example

```bash
./build/flowa examples/01_hello.flowa
```

### Create a Project

```bash
flowa new myapp       # Basic project
flowa server myapi    # HTTP Server project
flowa full myapp      # Full Stack project (SQL, Auth, JWT)
```

### Management

```bash
flowa uninstall       # Uninstall Flowa
```

### Run Tests

```bash
./build/flowa test tests/
```

## Performance Benchmarks

## Performance Benchmarks

Flowa is optimized for performance with a custom V8-style JIT compiler. Tests on Apple Silicon (arm64):

- **100M Loop**: **0.34s** (vs 59s interpreter, ~490x faster)
- **5M Loop + Print**: **0.04s** (Native speed)
- **Math & Ops**: Optimized to native assembly

> **See [docs/PERFORMANCE.md](docs/PERFORMANCE.md) for detailed benchmarks against C++, Node.js, and Python.**

To run the benchmark yourself:

```bash
./build/flowa benchmarks/bench_jit_100m.flowa
```

The JIT compiler optimizes hot loops through:

- Native code generation for performance-critical paths
- Inline function optimization
- Constant folding at compile time
- Register allocation for arm64/x64 architectures

## Documentation

- **[Language Documentation](docs/DOCUMENTATION.md)**: The complete guide to syntax and standard library.
- **[Unique Features](docs/UNIQUE_FEATURES.md)**: Discover what makes Flowa special (Actors, Cron, etc.).
- **[Installation Guide](docs/INSTALL.md)**: Detailed build instructions.
- **[Contributing](docs/CONTRIBUTING.md)**: Guide for developers modifying the compiler.

## Examples

Check the `examples/` directory for a progressive tutorial:

- [Hello World](examples/01_hello.flowa)
- [HTTP Server](examples/14_server.flowa)
- [Database](examples/15_sqlite.flowa)
- [Actors](tests/actor_runtime_test.flowa)

## Contact

**Email**: <flowalang@gmail.com>  
**GitHub**: [github.com/senapati484/flowa](https://github.com/senapati484/flowa)

## License

MIT License

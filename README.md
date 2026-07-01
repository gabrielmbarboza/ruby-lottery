# Ruby Lottery

Advanced lottery analysis CLI using **Ruby 3.3 Fibers** for stable, efficient concurrency.

This project demonstrates best practices for concurrent Ruby programming, analyzing Brazilian Megasena lottery results with modern Ruby parallelization patterns.

## 🚀 Features

- **Fiber-based concurrency**: Lightweight cooperative concurrency for stable processing
- **Modular architecture**: Clean separation of concerns (CLI, Domain, Data)
- **Comprehensive tests**: RSpec test suite with mocks and fixtures
- **Professional structure**: Production-ready project layout

## 📋 Requirements

- Ruby 3.3.0+
- Bundler

## 🔧 Installation

```bash
# Install dependencies
bundle install

# Verify setup
ruby lotto.rb version
```

## 📖 Usage

### Commands

```bash
# Show version
ruby lotto.rb version

# Load lottery data from web (1996-present)
ruby lotto.rb load

# Analyze lucky numbers (most frequently drawn)
ruby lotto.rb lucky --tens 6

# Generate random combinations
ruby lotto.rb random --games 5 --tens 6
```

### Options

**lucky command:**
- `--tens [6,7,8,9]` - Number of tens per group (default: 6)

**random command:**
- `--games N` - Number of games to generate (default: 1)
- `--tens [6,7,8,9]` - Number of tens per game (default: 6)

## 🏗️ Architecture

```
lib/lotto/
├── version.rb          # Version constant
├── cli/                # Command-line interface
│   ├── commands/       # Individual CLI commands
│   └── commands.rb     # Command registry
├── domain/             # Business logic
│   ├── fiber_pool.rb        # Fiber pool abstraction
│   ├── lottery_analyzer.rb  # Number frequency analysis
│   ├── random_generator.rb  # Random game generation
│   └── web_scraper.rb       # Web scraping service
└── data/               # Data handling
    └── file_handler.rb      # File I/O operations
bin/lotto              # Executable wrapper
spec/                  # Test suite (RSpec)
benchmarks/            # Performance benchmarks
```

## 🧪 Testing

```bash
# Run all tests
bundle exec rspec

# With coverage
bundle exec rspec --format progress
```

## ⚡ Performance

Fiber-based implementation:
- ✅ Lightweight concurrency with minimal overhead
- ✅ Stable, predictable behavior across Ruby versions
- ✅ Efficient context switching for I/O operations
- ✅ Production-grade stability (Ruby 3.3 LTS)

## 📚 Learning Resources

This project demonstrates:
- Ruby 3.3 Fiber API and patterns
- CLI development with Dry::CLI
- Service-oriented architecture
- RSpec testing patterns
- Web scraping with Mechanize

## ⚠️ Disclaimer

This project is for educational purposes. The lottery prediction methodology is not reliable for actual lottery selection. 🎰

## 📝 License

MIT


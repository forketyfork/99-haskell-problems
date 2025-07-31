# 99 Haskell Problems

[![Build status](https://github.com/forketyfork/99-haskell-problems/actions/workflows/test.yml/badge.svg)](https://github.com/forketyfork/99-haskell-problems/actions/workflows/test.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Haskell](https://img.shields.io/badge/language-Haskell-purple.svg)](https://www.haskell.org/)

A comprehensive collection of solutions to the famous [99 Haskell Problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems), designed to help developers learn and practice functional programming concepts in Haskell.

## About the 99 Haskell Problems

The 99 Haskell Problems are a collection of programming exercises that cover fundamental concepts in functional programming, including:

- **List Processing** (Problems 1-28): Working with lists, recursion, and basic data manipulation
- **Arithmetic** (Problems 31-41): Mathematical computations and number theory
- **Logic and Codes** (Problems 46-50): Boolean logic and binary representations  
- **Binary Trees** (Problems 54-69): Tree data structures and algorithms
- **Multiway Trees** (Problems 70-73): Complex tree structures
- **Graphs** (Problems 80-89): Graph theory and algorithms
- **Miscellaneous** (Problems 90-99): Advanced topics and puzzles

Each problem includes comprehensive test suites with both unit tests and property-based tests using QuickCheck to ensure correctness and robustness of the solutions.

## Running Tests

To run all tests:

```bash
cabal test
```

This will:
- Build all problem modules
- Run the comprehensive HSpec test suite
- Execute QuickCheck property tests

## Development

The project uses Nix for development environment setup:

```bash
nix develop
```

### Code Formatting

To format all Haskell files with ormolu:

```bash
./format.sh
```

Or manually format specific files:

```bash
ormolu --mode inplace src/Problem*.hs test/*.hs
```

The CI checks ensure all code is properly formatted using ormolu.

### Pre-commit Hooks

To set up pre-commit hooks that automatically check formatting and linting:

```bash
# Install pre-commit (if not already installed)
pip install pre-commit

# Install the hooks
pre-commit install

# Run hooks on all files (optional)
pre-commit run --all-files
```

The hooks will automatically run ormolu and hlint checks before each commit.

## Project Structure

- `Problem*.hs` - Solution modules for each problem
- `test/Problem*Spec.hs` - Test specifications for each problem
- `test/Spec.hs` - Main test runner using hspec-discover

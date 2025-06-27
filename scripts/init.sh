#!/bin/bash

echo "🔧 Setting up git hooks for the team..."

if [ ! -f "pubspec.yaml" ]; then
    echo "❌ pubspec.yaml not found! Please run this script from the project root."
    exit 1
fi

if [ ! -d "scripts/hooks" ]; then
    echo "❌ scripts/hooks directory not found!"
    exit 1
fi

if [ ! -d ".git" ]; then
    echo "❌ This is not a git repository!"
    exit 1
fi

cp scripts/hooks/* .git/hooks/
chmod +x .git/hooks/*

echo "✅ Git hooks installed successfully!"
echo "🎯 Now git push will automatically run dart format before pushing!"

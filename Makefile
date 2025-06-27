# ===================================================================
# Flutter 프로젝트를 위한 팀 전체 개발 환경 설정
# 'make setup' 하나로 모든 팀원의 초기 설정을 끝냅니다.
# ===================================================================

# 기본 명령어: 'make' 라고만 입력하면 'make setup'이 실행되도록 설정
.DEFAULT_GOAL := setup

# 🚀 프로젝트 초기 설정 (새로운 팀원용 원스톱 설정)
setup:
	@echo "=========================================================="
	@echo "🚀 Flutter 프로젝트 초기 설정을 시작합니다..."
	@echo "=========================================================="
	@if ! command -v brew > /dev/null; then \
		echo "‼️ [오류] Homebrew가 설치되어 있지 않습니다."; \
		echo "    먼저 https://brew.sh/index_ko 에서 Homebrew를 설치한 후 다시 시도해주세요."; \
		exit 1; \
	fi
	@echo "✅ Homebrew 설치 확인 완료."
	@if ! command -v flutter > /dev/null; then \
		echo "‼️ [오류] Flutter가 설치되어 있지 않습니다."; \
		echo "    먼저 https://flutter.dev/docs/get-started/install 에서 Flutter를 설치한 후 다시 시도해주세요."; \
		exit 1; \
	fi
	@echo "✅ Flutter 설치 확인 완료."
	@echo "⚙️  Flutter 의존성 패키지를 다운로드합니다 (flutter pub get)..."
	@flutter pub get
	@echo "⚙️  Git Hooks를 설정합니다..."
	@mkdir -p scripts/hooks
	@echo '#!/bin/sh\n\necho "🎯 Running dart format before push..."\n\ndart format .\n\nif ! git diff --quiet; then\n    echo "❌ Files were formatted. Please add and commit the changes before pushing."\n    echo "📝 Changed files:"\n    git diff --name-only\n    exit 1\nfi\n\necho "✅ All files are properly formatted."\nexit 0' > scripts/hooks/pre-push
	@chmod +x scripts/hooks/pre-push
	@echo '#!/bin/bash\n\necho "🔧 Setting up git hooks for the team..."\n\nif [ ! -f "pubspec.yaml" ]; then\n    echo "❌ pubspec.yaml not found! Please run this script from the project root."\n    exit 1\nfi\n\nif [ ! -d "scripts/hooks" ]; then\n    echo "❌ scripts/hooks directory not found!"\n    exit 1\nfi\n\nif [ ! -d ".git" ]; then\n    echo "❌ This is not a git repository!"\n    exit 1\nfi\n\ncp scripts/hooks/* .git/hooks/\nchmod +x .git/hooks/*\n\necho "✅ Git hooks installed successfully!"\necho "🎯 Now git push will automatically run dart format before pushing!"' > scripts/init.sh
	@chmod +x scripts/init.sh
	@./scripts/init.sh
	@echo "=========================================================="
	@echo "🎉 모든 설정이 완료되었습니다!"
	@echo "   이제부터 git push 시 dart format이 자동으로 실행됩니다."
	@echo "=========================================================="

.PHONY: setup
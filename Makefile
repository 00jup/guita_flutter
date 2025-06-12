# ===================================================================
# Flutter 프로젝트를 위한 최종 자동화 Makefile
# 'make setup' 하나로 모든 팀원의 초기 설정을 끝냅니다.
# ===================================================================

# 기본 명령어: 'make' 라고만 입력하면 'make setup'이 실행되도록 설정
.DEFAULT_GOAL := setup

# 🚀 프로젝트 초기 설정 (이 규칙이 핵심입니다!)
setup:
	@echo "=========================================================="
	@echo "🚀 프로젝트 초기 설정을 시작합니다..."
	@echo "=========================================================="

	# 1. Homebrew 설치 여부 확인 (macOS 사용자 대상)
	@if ! command -v brew > /dev/null; then \
		echo "‼️ [오류] Homebrew가 설치되어 있지 않습니다."; \
		echo "    먼저 https://brew.sh/index_ko 에서 Homebrew를 설치한 후 다시 시도해주세요."; \
		exit 1; \
	fi
	@echo "✅ Homebrew 설치 확인 완료."

	# 2. lefthook 설치 여부 확인 및 자동 설치
	@if ! command -v lefthook > /dev/null; then \
		echo "⚙️  Lefthook을 찾을 수 없습니다. Homebrew로 자동 설치를 시작합니다..."; \
		brew install lefthook; \
	else \
		echo "✅ Lefthook 이미 설치 확인 완료."; \
	fi

	# 3. Git Hooks 자동 설정
	@echo "⚙️  프로젝트에 Git Hook을 적용합니다 (lefthook install)...";
	@lefthook install

	# 4. Flutter 의존성 패키지 자동 다운로드
	@echo "⚙️  Flutter 의존성 패키지를 다운로드합니다 (flutter pub get)...";
	@flutter pub get

	@echo "\n=========================================================="
	@echo "🎉 모든 설정이 완료되었습니다!"
	@echo "   이제부터 git commit/push 시 코드가 자동으로 검사됩니다."
	@echo "=========================================================="
	@echo "\n   (다른 명령어 보기: make help)"


# ===================================================================
# 개발 시 사용하는 일반 명령어들
# ===================================================================

help:
	@echo "\n사용 가능한 명령어:"
	@echo "  make setup  - 이 프로젝트의 모든 초기 설정을 자동으로 진행합니다. (기본값)"
	@echo "  make get    - 의존성 패키지들을 다운로드합니다 (flutter pub get)"
	@echo "  make format - 프로젝트 전체 코드 스타일을 정리합니다 (flutter format .)"
	@echo "  make analyze - 코드에 잠재적인 문제가 없는지 분석합니다 (flutter analyze)"
	@echo "  make clean  - 빌드 캐시를 삭제합니다 (flutter clean)"
	@echo "  make run    - 앱을 실행합니다 (flutter run)"


# 의존성 패키지 다운로드
get:
	flutter pub get

# 코드 포맷팅 (전체 프로젝트 대상)
format:
	flutter format .

# 코드 정적 분석
analyze:
	flutter analyze

# 빌드 캐시 삭제
clean:
	flutter clean

# 앱 실행
run:
	flutter run

# .PHONY는 파일 이름과 명령어가 겹치는 것을 방지합니다.
.PHONY: setup help get format analyze clean run
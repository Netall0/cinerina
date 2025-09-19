# Makefile для Flutter проекта с FVM

# ========================
# Переменные
# ========================
FVM       := fvm
FLUTTER   := fvm flutter
DART      := fvm dart
APP_NAME  := MyApp

.PHONY: help clean get run-dev run-prod build-apk build-ios test format analyze upgrade generate icons rebuild l10n

# ========================
# Команды помощи
# ========================
help:
	@echo "Доступные команды:"
	@echo "  get               - Установить зависимости"
	@echo "  clean             - Очистить проект"
	@echo "  run-dev           - Запустить dev с ключами (одной строкой)"
	@echo "  run-prod          - Запустить prod с ключами (одной строкой)"
	@echo "  build-apk         - Собрать APK для продакшена"
	@echo "  build-ios         - Собрать IPA для продакшена"
	@echo "  test              - Запустить тесты"
	@echo "  format            - Форматировать код"
	@echo "  analyze           - Анализ кода"
	@echo "  upgrade           - Обновить зависимости"
	@echo "  generate          - Генерация кода (build_runner)"
	@echo "  icons             - Генерация иконок"
	@echo "  l10n              - Генерация локализации"
	@echo "  rebuild           - Полная пересборка"

# ========================
# Базовые команды
# ========================
get:
	@echo "Установка зависимостей..."
	$(FLUTTER) pub get

clean:
	@echo "Очистка проекта..."
	$(FLUTTER) clean
	$(FLUTTER) pub get

# ========================
# Запуск
# ========================
# Dev запуск (ключи передаём в строке)
run-dev:
	$(FLUTTER) run --debug --flavor dev lib/main_dev.dart \
		--dart-define=API_KEY=$(API_KEY) \
		--dart-define=SUPABASE_URL=$(SUPABASE_URL) \
		--dart-define=SUPABASE_ANON_KEY=$(ANON_KEY)

# Prod запуск (ключи передаём в строке)
run-prod:
	$(FLUTTER) run --release --flavor prod lib/main_prod.dart \
		--dart-define=API_KEY=$(API_KEY) \
		--dart-define=SUPABASE_URL=$(SUPABASE_URL) \
		--dart-define=SUPABASE_ANON_KEY=$(ANON_KEY)

# ========================
# Сборки
# ========================
build-apk:
	$(FLUTTER) build apk --release --flavor prod lib/main_prod.dart \
		--dart-define=API_KEY=$(API_KEY) \
		--dart-define=SUPABASE_URL=$(SUPABASE_URL) \
		--dart-define=SUPABASE_ANON_KEY=$(ANON_KEY)

build-ios:
	$(FLUTTER) build ipa --release --flavor prod lib/main_prod.dart \
		--dart-define=API_KEY=$(API_KEY) \
		--dart-define=SUPABASE_URL=$(SUPABASE_URL) \
		--dart-define=SUPABASE_ANON_KEY=$(ANON_KEY)

# ========================
# Утилиты
# ========================
test:
	$(FLUTTER) test

format:
	$(DART) format .

analyze:
	$(FLUTTER) analyze

upgrade:
	$(FLUTTER) pub upgrade

generate:
	$(DART) run build_runner build --delete-conflicting-outputs

icons:
	$(DART) run flutter_launcher_icons

l10n:
	$(FLUTTER) gen-l10n

rebuild: clean get
	@echo "Полная пересборка завершена!"

# Makefile для Flutter проекта

# Переменные
FLUTTER := flutter
DART := dart
API_KEY_PROD := your-production-api-key-here
APP_NAME := MyApp

# Цвета для вывода
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

.PHONY: help clean get build run test

# Помощь
help:
	@echo "$(GREEN)Доступные команды:$(NC)"
	@echo "  $(YELLOW)get$(NC)              - Установить зависимости"
	@echo "  $(YELLOW)clean$(NC)            - Очистить проект"
	@echo "  $(YELLOW)run-dev$(NC)          - Запустить dev с API ключом (по умолчанию)"
	@echo "  $(YELLOW)run-dev-no-key$(NC)   - Запустить dev БЕЗ API ключа"
	@echo "  $(YELLOW)run-prod$(NC)         - Запустить prod с API ключом (по умолчанию)"
	@echo "  $(YELLOW)run-prod-no-key$(NC)  - Запустить prod БЕЗ API ключа"
	@echo "  $(YELLOW)build-apk$(NC)        - Собрать APK для прода"
	@echo "  $(YELLOW)build-ios$(NC)        - Собрать IPA для прода"
	@echo "  $(YELLOW)test$(NC)             - Запустить тесты"
	@echo "  $(YELLOW)format$(NC)           - Форматировать код"
	@echo "  $(YELLOW)analyze$(NC)          - Анализ кода"
	@echo "  $(YELLOW)upgrade$(NC)          - Обновить зависимости"

# Установка зависимостей
get:
	@echo "$(GREEN)Установка зависимостей...$(NC)"
	$(FLUTTER) pub get

# Очистка проекта
clean:
	@echo "$(GREEN)Очистка проекта...$(NC)"
	$(FLUTTER) clean
	$(FLUTTER) pub get

# Запуск в режиме разработки (с дефолтным API ключом)
run-dev:
	@echo "$(GREEN)Запуск в режиме разработки...$(NC)"
	$(FLUTTER) run --flavor dev lib/main_dev.dart --dart-define=API_KEY=dev-api-key-12345

# Запуск в режиме разработки без API ключа
run-dev-no-key:
	@echo "$(YELLOW)Запуск в режиме разработки БЕЗ API ключа...$(NC)"
	$(FLUTTER) run --flavor dev lib/main_dev.dart

# Запуск с продакшен конфигом (с реальным API ключом)
run-prod:
	@echo "$(GREEN)Запуск с продакшен API ключом...$(NC)"
	$(FLUTTER) run --flavor prod lib/main_prod.dart --dart-define=API_KEY=$(API_KEY_PROD)

# Запуск продакшен версии без API ключа  
run-prod-no-key:
	@echo "$(YELLOW)Запуск продакшен версии БЕЗ API ключа...$(NC)"
	$(FLUTTER) run --flavor prod lib/main_prod.dart

# Сборка APK для прода
build-apk:
	@echo "$(GREEN)Сборка APK для продакшена...$(NC)"
	$(FLUTTER) build apk --flavor prod lib/main_prod.dart --dart-define=API_KEY=$(API_KEY_PROD) --release

# Сборка IPA для прода
build-ios:
	@echo "$(GREEN)Сборка IPA для продакшена...$(NC)"
	$(FLUTTER) build ipa --flavor prod lib/main_prod.dart --dart-define=API_KEY=$(API_KEY_PROD) --release

# Тесты
test:
	@echo "$(GREEN)Запуск тестов...$(NC)"
	$(FLUTTER) test

# Форматирование кода
format:
	@echo "$(GREEN)Форматирование кода...$(NC)"
	$(DART) format .

# Анализ кода
analyze:
	@echo "$(GREEN)Анализ кода...$(NC)"
	$(FLUTTER) analyze

# Обновление зависимостей
upgrade:
	@echo "$(GREEN)Обновление зависимостей...$(NC)"
	$(FLUTTER) pub upgrade

# Генерация кода (если используешь build_runner)
generate:
	@echo "$(GREEN)Генерация кода...$(NC)"
	$(DART) run build_runner build --delete-conflicting-outputs

# Установка иконок (если используешь flutter_launcher_icons)
icons:
	@echo "$(GREEN)Генерация иконок...$(NC)"
	$(DART) run flutter_launcher_icons

# Полная пересборка
rebuild: clean get
	@echo "$(GREEN)Полная пересборка завершена!$(NC)"

# Локализация (если используешь)
l10n:
	@echo "$(GREEN)Генерация локализации...$(NC)"
	$(FLUTTER) gen-l10n
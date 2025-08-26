# Makefile для Flutter проекта с FVM
# Переменные
FVM := fvm
FLUTTER := fvm flutter
DART := fvm dart
APP_NAME := MyApp

# Цвета для вывода
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
BLUE := \033[0;34m
NC := \033[0m # No Color

.PHONY: help clean get build run test fvm_install fvm_use

# Помощь
help:
	@echo "$(GREEN)Доступные команды:$(NC)"
	@echo "  $(BLUE)FVM команды:$(NC)"
	@echo "  $(YELLOW)fvm_install$(NC)       - Установить указанную версию Flutter через FVM"
	@echo "  $(YELLOW)fvm_use$(NC)           - Использовать указанную версию Flutter"
	@echo "  $(YELLOW)fvm_list$(NC)          - Показать доступные версии Flutter"
	@echo "  $(YELLOW)fvm_releases$(NC)      - Показать все релизы Flutter"
	@echo ""
	@echo "  $(BLUE)Основные команды:$(NC)"
	@echo "  $(YELLOW)get$(NC)               - Установить зависимости"
	@echo "  $(YELLOW)clean$(NC)             - Очистить проект"
	@echo "  $(YELLOW)run-dev$(NC)           - Запустить dev с API ключом (по умолчанию)"
	@echo "  $(YELLOW)run-dev-no-key$(NC)    - Запустить dev БЕЗ API ключа"
	@echo "  $(YELLOW)run-prod$(NC)          - Запустить prod с API ключом (по умолчанию)"
	@echo "  $(YELLOW)run-prod-no-key$(NC)   - Запустить prod БЕЗ API ключа"
	@echo "  $(YELLOW)build-apk$(NC)         - Собрать APK для прода"
	@echo "  $(YELLOW)build-ios$(NC)         - Собрать IPA для прода"
	@echo "  $(YELLOW)test$(NC)              - Запустить тесты"
	@echo "  $(YELLOW)format$(NC)            - Форматировать код"
	@echo "  $(YELLOW)analyze$(NC)           - Анализ кода"
	@echo "  $(YELLOW)upgrade$(NC)           - Обновить зависимости"
	@echo "  $(YELLOW)generate$(NC)          - Генерация кода (build_runner)"
	@echo "  $(YELLOW)icons$(NC)             - Генерация иконок"
	@echo "  $(YELLOW)l10n$(NC)              - Генерация локализации"
	@echo "  $(YELLOW)rebuild$(NC)           - Полная пересборка"

# FVM команды
fvm_install:
	@echo "$(GREEN)Установка Flutter через FVM...$(NC)"
	@echo "$(YELLOW)Использование: make fvm_install VERSION=3.16.0$(NC)"
	@if [ -z "$(VERSION)" ]; then \
		echo "$(RED)Ошибка: Укажите версию через VERSION=x.x.x$(NC)"; \
		exit 1; \
	fi
	fvm install $(VERSION)

fvm_use:
	@echo "$(GREEN)Переключение на версию Flutter...$(NC)"
	@echo "$(YELLOW)Использование: make fvm_use VERSION=3.16.0$(NC)"
	@if [ -z "$(VERSION)" ]; then \
		echo "$(RED)Ошибка: Укажите версию через VERSION=x.x.x$(NC)"; \
		exit 1; \
	fi
	fvm use $(VERSION)

fvm_list:
	@echo "$(GREEN)Установленные версии Flutter:$(NC)"
	fvm list

fvm_releases:
	@echo "$(GREEN)Доступные релизы Flutter:$(NC)"
	fvm releases

# Проверка FVM
check_fvm:
	@where fvm >nul 2>&1 || (echo $(RED)Ошибка: FVM не установлен!$(NC) && echo $(YELLOW)Установите FVM: https://fvm.app/docs/getting_started/installation$(NC) && exit 1)

# Установка зависимостей
get: check_fvm
	@echo "$(GREEN)Установка зависимостей...$(NC)"
	$(FLUTTER) pub get

# Очистка проекта
clean: check_fvm
	@echo "$(GREEN)Очистка проекта...$(NC)"
	$(FLUTTER) clean
	$(FLUTTER) pub get

# Запуск в режиме разработки (с дефолтным API ключом)
run-dev: check_fvm
	@echo "$(GREEN)Запуск в режиме разработки...$(NC)"
	$(FLUTTER) run --debug --flavor dev lib/main_dev.dart --dart-define=API_KEY=$(API_KEY_PROD)

# Запуск в режиме разработки без API ключа
run-dev-no-key: check_fvm
	@echo "$(YELLOW)Запуск в режиме разработки БЕЗ API ключа...$(NC)"
	$(FLUTTER) run --flavor dev lib/main_dev.dart

# Запуск с продакшен конфигом (с реальным API ключом)
run-prod: check_fvm
	@echo "$(GREEN)Запуск с продакшен API ключом...$(NC)"
	$(FLUTTER) run --flavor prod lib/main_prod.dart --dart-define=API_KEY=$(API_KEY_PROD)

# Запуск продакшен версии без API ключа  
run-prod-no-key: check_fvm
	@echo "$(YELLOW)Запуск продакшен версии БЕЗ API ключа...$(NC)"
	$(FLUTTER) run --flavor prod lib/main_prod.dart

# Сборка APK для прода
build-apk: check_fvm
	@echo "$(GREEN)Сборка APK для продакшена...$(NC)"
	$(FLUTTER) build apk --flavor prod lib/main_prod.dart --dart-define=API_KEY=$(API_KEY_PROD) --release

# Сборка IPA для прода
build-ios: check_fvm
	@echo "$(GREEN)Сборка IPA для продакшена...$(NC)"
	$(FLUTTER) build ipa --flavor prod lib/main_prod.dart --dart-define=API_KEY=$(API_KEY_PROD) --release

# Тесты
test: check_fvm
	@echo "$(GREEN)Запуск тестов...$(NC)"
	$(FLUTTER) test

# Форматирование кода
format: check_fvm
	@echo "$(GREEN)Форматирование кода...$(NC)"
	$(DART) format .

# Анализ кода
analyze: check_fvm
	@echo "$(GREEN)Анализ кода...$(NC)"
	$(FLUTTER) analyze

# Обновление зависимостей
upgrade: check_fvm
	@echo "$(GREEN)Обновление зависимостей...$(NC)"
	$(FLUTTER) pub upgrade

# Генерация кода (если используешь build_runner)
generate: check_fvm
	@echo "$(GREEN)Генерация кода...$(NC)"
	$(DART) run build_runner build --delete-conflicting-outputs

# Установка иконок (если используешь flutter_launcher_icons)
icons: check_fvm
	@echo "$(GREEN)Генерация иконок...$(NC)"
	$(DART) run flutter_launcher_icons

# Полная пересборка
rebuild: clean get
	@echo "$(GREEN)Полная пересборка завершена!$(NC)"

# Локализация (если используешь)
l10n: check_fvm
	@echo "$(GREEN)Генерация локализации...$(NC)"
	$(FLUTTER) gen-l10n

# Показать версию Flutter через FVM
version: check_fvm
	@echo "$(GREEN)Текущая версия Flutter:$(NC)"
	$(FLUTTER) --version

# Показать информацию о докторе Flutter
doctor: check_fvm
	@echo "$(GREEN)Flutter Doctor:$(NC)"
	$(FLUTTER) doctor

# Быстрая установка и настройка проекта
setup:
	@echo "$(GREEN)Быстрая настройка проекта...$(NC)"
	@echo "$(YELLOW)1. Проверка FVM...$(NC)"
	@make check_fvm
	@echo "$(YELLOW)2. Установка зависимостей...$(NC)"
	@make get
	@echo "$(YELLOW)3. Запуск Flutter Doctor...$(NC)"
	@make doctor
	@echo "$(GREEN)Настройка завершена!$(NC)"
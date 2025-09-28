# 🎬 Cinerina

## 🌟 Возможности

- **🔍 Поиск фильмов и сериалов** - Находите контент по названию, жанру и другим параметрам
- **📱 Кроссплатформенность** - Работает на Android и iOS
- **❤️ Избранное** - Сохраняйте понравившиеся фильмы в избранное
- **⚙️ Настройки** - Персонализируйте приложение под себя
- **🔄 Синхронизация данных** - Данные синхронизируются через Supabase
- **🎨 Современный дизайн** - Чистый и интуитивный интерфейс


## 🚀 Начало работы

### Требования

- Flutter SDK ≥ 3.8.1
- Dart SDK
- Android Studio / VS Code
- Аккаунт в Supabase (для бэкенда)

### Установка

1. **Клонируйте репозиторий**
   ```bash
   git clone https://github.com/Netall0/cinerina.git
   cd cinerina
   ```

2. **Установите зависимости**
   ```bash
   flutter pub get
   ```

3. **Настройте Supabase**
   ```bash
   # Создайте файл .env в корне проекта
   cp .env.example .env
   
   # Добавьте ваши ключи Supabase
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Генерация кода (при необходимости)**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Запустите приложение**
   ```bash
   flutter run
   ```

## 🏗️ Архитектура проекта

```
lib/
├── core/                   # Основные утилиты
│   ├── bloc/              # Базовые классы BLoC
│   ├── config/            # Конфигурация приложения
│   ├── database/          # Настройка базы данных (Drift)
│   └── extension/         # Расширения Dart
├── feature/               # Функциональные модули
│   ├── app/              # Главный модуль приложения
│   ├── auth/             # Авторизация
│   ├── favorites/        # Избранное
│   ├── history/          # История просмотров
│   ├── initialization/   # Инициализация приложения
│   ├── search/           # Поиск контента
│   └── settings/         # Настройки
├── router/               # Навигация (GoRouter)
├── util/                 # Утилиты
├── main_dev.dart         # Dev окружение
├── main_prod.dart        # Prod окружение
└── main.dart             # Основная точка входа
```

### Модульная архитектура

Проект использует feature-based архитектуру, где каждая функция выделена в отдельный модуль. Также используется собственный UI Kit в `packages/uikit`.

## 🛠️ Технологический стек

### Основные зависимости
- **[Flutter BLoC](https://pub.dev/packages/flutter_bloc)** - Управление состоянием
- **[GoRouter](https://pub.dev/packages/go_router)** - Навигация и маршрутизация
- **[Supabase Flutter](https://pub.dev/packages/supabase_flutter)** - Backend-as-a-Service
- **[Drift](https://pub.dev/packages/drift)** - Локальная база данных
- **[Dio](https://pub.dev/packages/dio)** - HTTP клиент
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - Кеширование изображений

### Дополнительные инструменты
- **[Shared Preferences](https://pub.dev/packages/share)** - локальное хранилище


p.s эт черновик просто для будующих работ

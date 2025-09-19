// lib/config/app_config.dart
enum AppEnvironment { development, production }

class AppConfig {
  static const String apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'dev-api-key-12345',
  );
  
  static const bool isProduction = bool.fromEnvironment(
    'IS_PRODUCTION',
    defaultValue: false,
  );

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  
  // Enum на основе isProduction
  static AppEnvironment get environment => 
      isProduction ? AppEnvironment.production : AppEnvironment.development;
  

    
  // Геттеры для удобства
  static bool get isDev => !isProduction;
  static String get environmentName => isProduction ? 'Prod' : 'Dev';
  
  // Название приложения в зависимости от окружения
  static String get appName => isProduction ? 'MyApp' : 'MyApp DEV';
}
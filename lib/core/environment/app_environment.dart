enum AppEnvironment {
  mock,
  dev,
}

class EnvironmentConfig {
  static const String _envKey = 'ENVIRONMENT';

  static AppEnvironment get current {
    const env = String.fromEnvironment(_envKey, defaultValue: 'mock');
    switch (env) {
      case 'dev':
        return AppEnvironment.dev;
      case 'mock':
      default:
        return AppEnvironment.mock;
    }
  }

  static bool get isMock => current == AppEnvironment.mock;
  static bool get isDev => current == AppEnvironment.dev;
}

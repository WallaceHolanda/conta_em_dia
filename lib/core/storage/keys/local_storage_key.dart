enum LocalStorageKey {
  hasSeenOnboarding;

  String get keyName {
    switch (this) {
      case LocalStorageKey.hasSeenOnboarding:
        return 'hasSeenOnboarding';
    }
  }
}

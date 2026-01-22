enum SecureStorageKey {
  accessToken,
  refreshToken,
  ;

  String get keyName {
    switch (this) {
      case SecureStorageKey.accessToken:
        return 'access_token';
      case SecureStorageKey.refreshToken:
        return 'refresh_token';
    }
  }
}

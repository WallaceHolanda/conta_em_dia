class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
    );
  }
}

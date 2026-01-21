class Validators {
  Validators._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o e-mail';
    }

    final emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'E-mail inválido';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a senha';
    }

    if (value.contains(' ')) {
      return 'A senha não pode conter espaços';
    }

    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }

    return null;
  }

  static String? confirmPassword(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return 'Confirme a senha';
    }

    if (original == null || original.isEmpty) {
      return 'Senha original não informada';
    }

    if (value != original) {
      return 'As senhas não são iguais';
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o nome';
    }

    if (value.contains(' ')) {
      return 'O nome não pode conter espaços';
    }

    if (value.length < 4) {
      return 'O nome deve ter pelo menos 4 caracteres';
    }

    final nameRegex = RegExp(
      r'^[A-Za-zÀ-ÿ]+(?:\s[A-Za-zÀ-ÿ]+)*$',
    );

    if (!nameRegex.hasMatch(value.trim())) {
      return 'O nome não pode conter números ou caracteres especiais';
    }

    return null;
  }
}

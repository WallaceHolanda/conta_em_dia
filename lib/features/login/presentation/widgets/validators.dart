String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira seu e-mail.';
  }
  if (value.length > 125) {
    return 'O e-mail não pode ter mais de 125 caracteres.';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira sua senha.';
  }
  if (value.length > 25) {
    return 'A senha não pode ter mais de 25 caracteres.';
  }
  return null;
}

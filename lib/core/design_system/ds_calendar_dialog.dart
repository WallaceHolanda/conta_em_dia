import 'package:flutter/material.dart';

class DSCalendarDialog {
  static Future<DateTime?> exibirCalendario({
    required BuildContext context,
    required DateTime diaInicial,
    required DateTime primeiraDataDoCalendario,
    required DateTime ultimaDataDoCalendario,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: diaInicial,
      firstDate: primeiraDataDoCalendario,
      lastDate: ultimaDataDoCalendario,
      locale: Localizations.localeOf(context),
      helpText: "Selecione uma data",
      cancelText: "Cancelar",
      confirmText: "Confirmar",
      errorFormatText: "Formato inválido",
      errorInvalidText: "Formato inválido",
    );
  }
}

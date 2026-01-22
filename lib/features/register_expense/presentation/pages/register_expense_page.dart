import 'package:conta_em_dia/core/design_system/design_system.dart';
import 'package:conta_em_dia/core/navigation/app_navigator.dart';
import 'package:conta_em_dia/features/common/entities/card/card_account_entity.dart';
import 'package:conta_em_dia/features/common/entities/expense/expense_category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/utils/extensions/string.dart';
import '../cubit/register_expense_cubit.dart';
import '../cubit/register_expense_state.dart';

class RegisterExpensePage extends StatefulWidget {
  const RegisterExpensePage({super.key});

  @override
  State<RegisterExpensePage> createState() => _RegisterExpensePageState();
}

class _RegisterExpensePageState extends State<RegisterExpensePage> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dataController = TextEditingController();
  final _dataFocusNode = FocusNode();
  ExpenseCategoryEntity? _selectedCategory;
  CardAccountEntity? _selectedCard;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<RegisterExpenseCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterExpenseCubit, RegisterExpenseState>(
        listenWhen: (prev, curr) => prev.submitStatus != curr.submitStatus,
        listener: (context, state) {
          if (state.submitStatus == SubmitStatus.success) {
            AppSnackBar.show(
              context,
              message: 'Despesa cadastrada com sucesso!',
              type: AppSnackBarType.success,
            );
            AppNavigator.goBackToHome(context);
          }

          if (state.submitStatus == SubmitStatus.failure) {
            AppSnackBar.show(
              context,
              message: 'Ocorreu um erro ao realizar o cadastro.',
              type: AppSnackBarType.error,
            );
            context.read<RegisterExpenseCubit>().resetSubmitStatus();
          }
        },
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.loading ||
              state.loadStatus == LoadStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.loadStatus == LoadStatus.failure) {
            return const Center(child: Text('Erro ao carregar dados'));
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          LucideIcons.chevronLeft,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 16),
                      DsText('Nova despesa', variant: DsTextVariant.h3),
                      const SizedBox(height: 48),
                      DsTextFormField(
                        labelText: 'Valor',
                        controller: _amountController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      DsTextFormField(
                        labelText: 'Descrição',
                        maxLength: 100,
                        controller: _descriptionController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 24),
                      DsTextFormField(
                        readOnly: true,
                        controller: _dataController,
                        focusNode: _dataFocusNode,
                        onTapOutside: (_) => _dataFocusNode.unfocus(),
                        labelText: "Data",
                        keyboardType: TextInputType.datetime,
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return "Data é obrigatória";
                          }
                          return null;
                        },
                        onTap: () => _showCalendar(),
                      ),
                      const SizedBox(height: 24),
                      DsDropdownButton<ExpenseCategoryEntity>(
                        items: state.categories
                            .map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(c.name),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v),
                        value: _selectedCategory,
                        textHint: 'Categoria',
                        textLabel: 'Categoria',
                      ),
                      const SizedBox(height: 24),
                      DsDropdownButton<CardAccountEntity>(
                        items: state.cards
                            .map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(c.type.name),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => _selectedCard = v),
                        value: _selectedCard,
                        textHint: 'Forma de pagamento',
                        textLabel: 'Forma de pagamento',
                      ),
                      const SizedBox(height: 64),
                      DsPrimaryButton(
                        text: state.submitStatus == SubmitStatus.loading
                            ? 'Salvando...'
                            : 'Salvar',
                        onPressed: state.submitStatus == SubmitStatus.loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<RegisterExpenseCubit>()
                                      .registerExpense(
                                        double.parse(_amountController.text),
                                        _descriptionController.text,
                                        _selectedCategory!.id,
                                        _dataController.text.toDateTime(),
                                        _selectedCard!.id,
                                      );
                                }
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showCalendar() async {
    DateTime dataHoje = DateTime.now();
    DateTime dataSelecionada = _dataController.text.isNotEmpty
        ? _dataController.text.toDateTime()
        : dataHoje;

    DateTime? novaData = await DSCalendarDialog.showCalendar(
      context: context,
      diaInicial: dataSelecionada,
      primeiraDataDoCalendario: DateTime(2021),
      ultimaDataDoCalendario: DateTime(dataHoje.year + 1),
    );

    if (novaData != null) {
      String dataFormatada = DateFormat('dd/MM/yyyy').format(novaData);
      setState(() => _dataController.text = dataFormatada);
    }
  }
}

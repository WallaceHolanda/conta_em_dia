import 'package:conta_em_dia/core/design_system/design_system.dart';
import 'package:conta_em_dia/core/navigation/app_navigator.dart';
import 'package:conta_em_dia/features/common/entities/card/card_bank_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_network_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../cubit/register_card_cubit.dart';
import '../cubit/register_card_state.dart';

class RegisterCardPage extends StatefulWidget {
  const RegisterCardPage({super.key});

  @override
  State<RegisterCardPage> createState() => _RegisterCardPageState();
}

class _RegisterCardPageState extends State<RegisterCardPage> {
  CardTypeEntity? _selectedType;
  CardBankEntity? _selectedBank;
  CardNetworkEntity? _selectedNetwork;

  @override
  void initState() {
    super.initState();
    context.read<RegisterCardCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCardCubit, RegisterCardState>(
        listenWhen: (prev, curr) => prev.submitStatus != curr.submitStatus,
        listener: (context, state) {
          if (state.submitStatus == SubmitStatus.success) {
            AppSnackBar.show(
              context,
              message: 'Cartão cadastrado com sucesso!',
              type: AppSnackBarType.success,
            );
            AppNavigator.goBackToHome(context);
          }

          if (state.submitStatus == SubmitStatus.failure) {
            AppSnackBar.show(
              context,
              message: state.errorMessage ?? 'Erro ao cadastrar cartão',
              type: AppSnackBarType.error,
            );
            context.read<RegisterCardCubit>().resetSubmitStatus();
          }
        },
        child: BlocBuilder<RegisterCardCubit, RegisterCardState>(
          builder: (context, state) {
            if (state.loadStatus == LoadStatus.loading ||
                state.loadStatus == LoadStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.loadStatus == LoadStatus.failure) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            }

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
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
                      DsText('Cadastrar cartão', variant: DsTextVariant.h2),
                      const SizedBox(height: 48),
                      DsDropdownButton<CardTypeEntity>(
                        items: state.types
                            .map(
                              (t) => DropdownMenuItem(
                                value: t,
                                child: Text(t.name),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => _selectedType = v),
                        value: _selectedType,
                        textHint: 'Selecione o tipo',
                        textLabel: 'Tipo',
                      ),
                      const SizedBox(height: 24),
                      DsDropdownButton<CardBankEntity>(
                        items: state.banks
                            .map(
                              (b) => DropdownMenuItem(
                                value: b,
                                child: Text(b.name),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => _selectedBank = v),
                        value: _selectedBank,
                        textHint: 'Selecione o banco',
                        textLabel: 'Banco',
                      ),
                      const SizedBox(height: 24),
                      DsDropdownButton<CardNetworkEntity>(
                        items: state.networks
                            .map(
                              (n) => DropdownMenuItem(
                                value: n,
                                child: Text(n.name),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => _selectedNetwork = v),
                        value: _selectedNetwork,
                        textHint: 'Selecione a bandeira',
                        textLabel: 'Bandeira',
                      ),
                      const SizedBox(height: 64),
                      DsPrimaryButton(
                        text: state.submitStatus == SubmitStatus.loading
                            ? 'Cadastrando...'
                            : 'Cadastrar',
                        onPressed: state.submitStatus == SubmitStatus.loading
                            ? null
                            : () {
                                if (_selectedType == null ||
                                    _selectedBank == null ||
                                    _selectedNetwork == null) {
                                  AppSnackBar.show(
                                    context,
                                    message: 'Selecione todos os campos.',
                                    type: AppSnackBarType.warning,
                                  );
                                  return;
                                }

                                context.read<RegisterCardCubit>().registerCard(
                                  _selectedType!.id,
                                  _selectedBank!.id,
                                  _selectedNetwork!.id,
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

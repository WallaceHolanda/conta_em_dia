import 'package:conta_em_dia/core/design_system/design_system.dart';
import 'package:conta_em_dia/core/utils/extensions/date_time.dart';
import 'package:conta_em_dia/features/home/presentation/widgets/home_empty_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/app_navigator.dart';
import '../../../common/entities/expense/expense_entity.dart';

class HomeLastExpensesCard extends StatelessWidget {
  final List<ExpenseEntity> expenses;

  const HomeLastExpensesCard({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DsText(
          'Últimas despesas',
          variant: DsTextVariant.body1,
          color: DsColors.neutral60,
        ),
        const SizedBox(height: 16),
        expenses.isEmpty
            ? HomeEmptyCard(
                title: 'Nenhuma despesa registrada',
                subtitle: 'As movimentações serão exibidas aqui.',
                buttonText: 'Cadastrar',
                onPressed: () => AppNavigator.goToRegisterExpense(context),
              )
            : Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: DsColors.neutralWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...expenses.map(
                      (e) => Padding(
                        padding: .only(bottom: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: DsColors.neutral10,
                              ),
                              child: e.card.bank.asset != null
                                  ? DsImage(
                                      path: e.card.bank.asset!.path,
                                      width: 16,
                                      height: 16,
                                    )
                                  : SizedBox.shrink(),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DsText(
                                        e.description,
                                        variant: DsTextVariant.body2,
                                        color: DsColors.neutral60,
                                      ),
                                      SizedBox(height: 4),
                                      DsText(
                                        e.category.name,
                                        variant: DsTextVariant.body2,
                                        color: DsColors.neutral50,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      DsText(
                                        'R\$ ${e.amount.toStringAsFixed(2)}',
                                        variant: DsTextVariant.body1,
                                        color: DsColors.neutral60,
                                      ),
                                      SizedBox(height: 4),
                                      DsText(
                                        e.date.ddMM,
                                        variant: DsTextVariant.body2,
                                        color: DsColors.neutral50,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DsSecondaryButton(
                      text: "Cadastrar",
                      onPressed: () =>
                          AppNavigator.goToRegisterExpense(context),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

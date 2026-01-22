import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../common/entities/card/card_account_entity.dart';
import 'home_card_account_widget.dart';
import 'home_empty_card.dart';
import '../../../../core/navigation/app_navigator.dart';

class HomeCardsList extends StatelessWidget {
  final List<CardAccountEntity> cards;

  const HomeCardsList({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return HomeEmptyCard(
        title: 'Nada por aqui ainda',
        subtitle:
            'Cadastre um cartão ou uma conta para registrar suas despesas.',
        buttonText: 'Cadastrar',
        onPressed: () => AppNavigator.goToRegisterCard(context),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final c = cards[index];
              return HomeCardAccountWidget(
                name: c.type.name,
                logo: c.bank.asset,
                brand: c.cardNetwork.asset,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        DsSecondaryButton(
          text: "Cadastrar",
          onPressed: () => AppNavigator.goToRegisterCard(context),
        ),
      ],
    );
  }
}

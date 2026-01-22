import 'package:flutter/material.dart';
import '../../../common/entities/card/card_account_entity.dart';
import 'home_card_account_widget.dart';

class HomeCardsList extends StatelessWidget {
  final List<CardAccountEntity> cards;

  const HomeCardsList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    debugPrint('Cards: ${cards.toString()}');
    return SizedBox(
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
    );
  }
}

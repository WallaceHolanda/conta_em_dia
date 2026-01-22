import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/design_system/design_system.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/home_current_spend_card.dart';
import '../widgets/home_cards_list.dart';
import '../widgets/home_last_expenses_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading || state is HomeInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HomeFailure) {
                  return Center(
                    child: Text("Ocorreu um erro ao carregar os dados."),
                  );
                } else if (state is HomeSuccess) {
                  final homeData = state.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeaderWidget(userName: homeData.userName),
                      const SizedBox(height: 32),
                      HomeCurrentSpendCard(
                        value: homeData.totalExpenses,
                        month: homeData.month,
                      ),
                      const SizedBox(height: 16),
                      DsText('Contas e cartões', variant: DsTextVariant.body1),
                      const SizedBox(height: 12),
                      HomeCardsList(cards: homeData.cards),
                      const SizedBox(height: 16),
                      HomeLastExpensesCard(expenses: homeData.expenses),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}

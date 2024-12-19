import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quest_cubit.dart';
import '../cubit/quest_state.dart';
import '../widgets/quest_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5 QUESTS HERO'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<QuestCubit, QuestState>(
              builder: (context, state) {
                if (state is QuestSuccess) {
                  final completedCount =
                      context.read<QuestCubit>().completedQuestCount();
                  return Text(
                    '$completedCount / 5',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<QuestCubit, QuestState>(
              builder: (context, state) {
                if (state is QuestLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is QuestSuccess) {
                  final quests = state.quests;
                  return ListView.builder(
                    itemCount: quests.length,
                    itemBuilder: (context, index) {
                      return QuestListItem(index: index, quest: quests[index]);
                    },
                  );
                } else if (state is QuestError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

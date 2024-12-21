import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/quest_cubit.dart';
import '../cubit/quest_state.dart';
import '../widgets/quest_list_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final String formattedDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Center(
          child: Text(formattedDate),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<QuestCubit, QuestState>(
              builder: (context, state) {
                if (state is QuestLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is QuestSuccess) {
                  final quests = state.quests;
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quests.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            QuestListItem(index: index, quest: quests[index]),
                            const SizedBox(height: 12),
                          ],
                        );
                      },
                    ),
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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: BlocBuilder<QuestCubit, QuestState>(
                  builder: (context, state) {
                    if (state is QuestSuccess) {
                      final completedCount =
                          context.read<QuestCubit>().completedQuestCount();
                      return Text(
                        '$completedCount / 5',
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

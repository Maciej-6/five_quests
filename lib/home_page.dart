import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'quest_cubit.dart';
import 'quest_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5 QUESTS HERO'),
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
                      final quest = quests[index];
                      _controller.text = quest.title;

                      return ListTile(
                        title: TextFormField(
                          initialValue: quest.title,
                          decoration: InputDecoration(
                            labelText: 'Quest ${index + 1}',
                          ),
                          onFieldSubmitted: (newTitle) {
                            if (newTitle.isNotEmpty) {
                              context
                                  .read<QuestCubit>()
                                  .editQuestTitle(index, newTitle);
                            }
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            quest.isCompleted
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          onPressed: () {
                            context
                                .read<QuestCubit>()
                                .toggleQuestCompletion(index);
                          },
                        ),
                      );
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

import 'package:flutter/material.dart';
import '../cubit/quest_cubit.dart';
import '../../domain/entities/quest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestListItem extends StatelessWidget {
  const QuestListItem({super.key, required this.index, required this.quest});

  final int index;
  final Quest quest;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        initialValue: quest.title,
        decoration: InputDecoration(
          labelText: 'Quest ${index + 1}',
        ),
        onFieldSubmitted: (newTitle) {
          if (newTitle.isNotEmpty) {
            context.read<QuestCubit>().editQuestTitle(index, newTitle);
          }
        },
      ),
      trailing: IconButton(
        icon: Icon(
          quest.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
        ),
        onPressed: () {
          context.read<QuestCubit>().toggleQuestCompletion(index);
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'quest_state.dart';
import 'quest_dto.dart';

class QuestCubit extends Cubit<QuestState> {
  QuestCubit() : super(QuestInitial()) {
    emit(QuestSuccess([
      Quest(title: 'Quest 1'),
      Quest(title: 'Quest 2'),
      Quest(title: 'Quest 3'),
      Quest(title: 'Quest 4'),
      Quest(title: 'Quest 5'),
    ]));
  }

  void editQuestTitle(int index, String newTitle) {
    if (state is QuestSuccess) {
      final currentState = state as QuestSuccess;
      final updatedQuests = List<Quest>.from(currentState.quests);
      updatedQuests[index] = Quest(
        title: newTitle,
        isCompleted: updatedQuests[index].isCompleted,
      );
      emit(QuestSuccess(updatedQuests));
    }
  }

  void toggleQuestCompletion(int index) {
    if (state is QuestSuccess) {
      final currentState = state as QuestSuccess;
      final updatedQuests = List<Quest>.from(currentState.quests);
      updatedQuests[index] = Quest(
        title: updatedQuests[index].title,
        isCompleted: !updatedQuests[index].isCompleted,
      );
      emit(QuestSuccess(updatedQuests));
    }
  }

  int completedQuestCount() {
    if (state is QuestSuccess) {
      final currentState = state as QuestSuccess;
      return currentState.quests.where((quest) => quest.isCompleted).length;
    }
    return 0;
  }
}

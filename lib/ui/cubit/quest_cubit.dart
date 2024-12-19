import 'package:five_quests_hero/domain/use_cases/quest_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'quest_state.dart';

class QuestCubit extends Cubit<QuestState> {
  final QuestUseCase questUseCase;

  QuestCubit(this.questUseCase) : super(QuestInitial()) {
    emit(QuestSuccess(questUseCase.initializeQuests()));
  }

  void editQuestTitle(int index, String newTitle) {
    if (state is QuestSuccess) {
      final currentState = state as QuestSuccess;
      final updatedQuests =
          questUseCase.editQuestTitle(currentState.quests, index, newTitle);
      emit(QuestSuccess(updatedQuests));
    }
  }

  void toggleQuestCompletion(int index) {
    if (state is QuestSuccess) {
      final currentState = state as QuestSuccess;
      final updatedQuests =
          questUseCase.toggleQuestCompletion(currentState.quests, index);
      emit(QuestSuccess(updatedQuests));
    }
  }

  int completedQuestCount() {
    if (state is QuestSuccess) {
      final currentState = state as QuestSuccess;
      return questUseCase.completedQuestCount(currentState.quests);
    }
    return 0;
  }
}

import 'package:five_quests_hero/domain/entities/quest.dart';

class QuestUseCase {
  List<Quest> initializeQuests() {
    return [
      Quest(title: 'Quest 1'),
      Quest(title: 'Quest 2'),
      Quest(title: 'Quest 3'),
      Quest(title: 'Quest 4'),
      Quest(title: 'Quest 5'),
    ];
  }

  List<Quest> editQuestTitle(List<Quest> quests, int index, String newTitle) {
    final updatedQuests = List<Quest>.from(quests);
    updatedQuests[index] = Quest(
      title: newTitle,
      isCompleted: updatedQuests[index].isCompleted,
    );
    return updatedQuests;
  }

  List<Quest> toggleQuestCompletion(List<Quest> quests, int index) {
    final updatedQuests = List<Quest>.from(quests);
    updatedQuests[index] = Quest(
      title: updatedQuests[index].title,
      isCompleted: !updatedQuests[index].isCompleted,
    );
    return updatedQuests;
  }

  int completedQuestCount(List<Quest> quests) {
    return quests.where((quest) => quest.isCompleted).length;
  }
}

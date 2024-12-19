import 'package:five_quests_hero/domain/entities/quest.dart';

class QuestDto extends Quest {
  QuestDto({
    required super.title,
    super.isCompleted,
  });

  factory QuestDto.fromJson(Map<String, dynamic> json) {
    return QuestDto(
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}

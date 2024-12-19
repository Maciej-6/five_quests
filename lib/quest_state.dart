import 'package:flutter/material.dart';

import 'quest_dto.dart';

@immutable
sealed class QuestState {}

final class QuestInitial extends QuestState {}

final class QuestLoading extends QuestState {}

final class QuestSuccess extends QuestState {
  final List<Quest> quests;

  QuestSuccess(this.quests);
}

final class QuestError extends QuestState {
  final String message;

  QuestError(this.message);
}

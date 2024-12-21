import 'package:five_quests_hero/ui/cubit/quest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/use_cases/quest_use_case.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => QuestCubit(QuestUseCase()),
        child: HomePage(),
      ),
    );
  }
}

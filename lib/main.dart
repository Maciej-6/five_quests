import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: '5 Quests Hero'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? firstQuest = false;
  bool? secondQuest = false;
  bool? thirdQuest = false;
  bool? fourthQuest = false;
  bool? fifthQuest = false;

  // bool checkBoxValue1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text("Pierwsze zadanie"),
              subtitle: Container(
                child: TextField(),
              ),
              value: firstQuest,
              onChanged: (bool? value) {
                setState(() {
                  firstQuest = value;
                });
              },
              activeColor: Colors.orange,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: Text("Drugie zadanie"),
              subtitle: Container(
                child: TextField(),
              ),
              value: secondQuest,
              onChanged: (bool? value) {
                setState(() {
                  secondQuest = value;
                });
              },
              activeColor: Colors.orange,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: Text("Trzecie zadanie"),
              subtitle: Container(
                child: TextField(),
              ),
              value: thirdQuest,
              onChanged: (bool? value) {
                setState(() {
                  thirdQuest = value;
                });
              },
              activeColor: Colors.orange,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: Text("Czwarte zadanie"),
              subtitle: Container(
                child: TextField(),
              ),
              value: fourthQuest,
              onChanged: (bool? value) {
                setState(() {
                  fourthQuest = value;
                });
              },
              activeColor: Colors.orange,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: Text("Piąte zadanie"),
              subtitle: Container(
                child: TextField(),
              ),
              value: fifthQuest,
              onChanged: (bool? value) {
                setState(() {
                  fifthQuest = value;
                });
              },
              activeColor: Colors.orange,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white,
            ),
            const SizedBox(height: 24),
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

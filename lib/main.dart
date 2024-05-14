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
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const TextField(),
              value: isSelected[0],
              onChanged: (bool? value) {
                setState(() {
                  isSelected[0] = value!;
                });
              },
              activeColor: Colors.black87,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.amber,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const TextField(),
              value: isSelected[1],
              onChanged: (bool? value) {
                setState(() {
                  isSelected[1] = value!;
                });
              },
              activeColor: Colors.black87,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.amber,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const TextField(),
              value: isSelected[2],
              onChanged: (bool? value) {
                setState(() {
                  isSelected[2] = value!;
                });
              },
              activeColor: Colors.black87,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.amber,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const TextField(),
              value: isSelected[3],
              onChanged: (bool? value) {
                setState(() {
                  isSelected[3] = value!;
                });
              },
              activeColor: Colors.black87,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.amber,
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const TextField(),
              value: isSelected[4],
              onChanged: (bool? value) {
                setState(() {
                  isSelected[4] = value!;
                });
              },
              activeColor: Colors.black87,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.amber,
            ),
            const SizedBox(height: 24),
            Container(
              width: 200.0,
              height: 200.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Center(
                child: Text("${isSelected.where((element) => element == true).length}/5",
                  style: const TextStyle(
                    fontSize: 80,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

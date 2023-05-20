import 'package:cashboard/pages/listspent.dart';
import 'package:flutter/material.dart';
import 'functions/add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Cashboard'),
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
  @override
  Widget build(BuildContext context) {
    final TextEditingController content = TextEditingController();
    final TextEditingController value = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: content,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'description',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: value,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'value',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String _content = content.text;
                double _value = double.tryParse(value.text) ?? 0.0;
                add(_content, _value, false);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(100),
                padding: const EdgeInsets.all(10),
              ),
              child: const Text("Adicionar"),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListSpent()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.list),
      ),
    );
  }
}

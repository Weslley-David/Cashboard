import 'package:cashboard/functions/add.dart';
import 'package:flutter/material.dart';

class AddSpent extends StatefulWidget {
  const AddSpent({super.key});

  @override
  State<AddSpent> createState() => _AddSpentState();
}

class _AddSpentState extends State<AddSpent> {
  final TextEditingController content = TextEditingController();
  final TextEditingController value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Spent"),
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
    );
  }
}

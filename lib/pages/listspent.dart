import 'package:flutter/material.dart';

import '../functions/delete.dart';
import '../functions/list.dart';
import '../models/earningsAndExpenses.dart';

class ListSpent extends StatefulWidget {
  const ListSpent({super.key});

  @override
  State<ListSpent> createState() => _ListSpentState();
}

class _ListSpentState extends State<ListSpent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earning and Expenses"),
      ),
      body: FutureBuilder<List<EarningsAndExpenses>>(
        future: list(),
        builder: (BuildContext context,
            AsyncSnapshot<List<EarningsAndExpenses>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {

            List<EarningsAndExpenses> spents = snapshot.data!;
            return ListView.builder(
              itemCount: spents.length,
              itemBuilder: (BuildContext context, int index) {
                Color valueColor =
                    spents[index].value < 0 ? Colors.red : Colors.green;
                return ListTile(
                  title: Text(spents[index].content),
                  subtitle: Text(
                    'Valor: R\$ ${spents[index].value.toStringAsFixed(2)}',
                    style: TextStyle(color: valueColor),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      delete(spents[index].id);
                      Navigator.pop(context);
                      //Tentativas de atualizar a lista em tempo real
                      // setState((){
                      //   spents.remove(spents[index]);
                      // });

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => super.widget));
                      // setState(() {
                      //   mensalidades.remove(mensalidades[index]);
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(100),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

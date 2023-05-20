import 'package:cashboard/models/earningsAndExpenses.dart';
import 'package:mysql_client/mysql_client.dart';

Future<List<EarningsAndExpenses>> list() async {
  print("Connecting to mysql server...");

  // create connection
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "dpm2023",
    databaseName: "dpm2023", // optional
  );

  await conn.connect();

  print("Connected");
  List<Map<String, String>> listaDados = [];
  List<EarningsAndExpenses> earningsAndExpenses = [];
  var result = await conn.execute("SELECT * FROM earnings_and_expenses");

  print(result.numOfColumns);
  print(result.numOfRows);
  print(result.lastInsertID);
  print(result.affectedRows);

  for (final row in result.rows) {
     earningsAndExpenses.add(EarningsAndExpenses(id: int.parse(row.colAt(0) ?? '0'), content: row.colAt(1) as String, value: double.parse(row.colAt(2) ?? '0.0'), paid: false));

    final data = {
      'id': row.colAt(0) ?? "",
      'content': row.colAt(1) ?? "",
      'value': row.colAt(2) ?? "",
      'paid': row.colAt(3) ?? "",
    };
   
    listaDados.add(data);
    print(row.assoc());
  }
  await conn.close();
  for (var item in earningsAndExpenses) {
    print("ID: ${item.content}");
    print("ID: ${item.value}");
    print("-------------------------");
  }
  return earningsAndExpenses;
}

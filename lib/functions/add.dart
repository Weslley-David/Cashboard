import 'package:mysql_client/mysql_client.dart';

Future<void> add(String content, double value, bool paid) async {
  print("Connecting to mysql server...");
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "dpm2023",
    databaseName: "dpm2023", // optional
  );

  await conn.connect();

  print("Connected");
  var res = await conn.execute(
    "INSERT INTO earnings_and_expenses (content, value, paid) VALUES (:content, :value, :paid)",
    {
      "content": content,
      "value": value,
      "paid": false,
    },
  );
  print(res.affectedRows);
  await conn.close();
}

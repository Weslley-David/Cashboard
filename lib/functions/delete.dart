import 'package:mysql_client/mysql_client.dart';

Future<void> delete(int id) async {
  print("Connecting to mysql server...");
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "dpm2023",
    databaseName: "dpm2023", // optional
  );

  await conn.connect();

  var res = await conn.execute(
    "DELETE from earnings_and_expenses where id = :id",
    {"id": id},
  );
  print(res.affectedRows);
  await conn.close();
}

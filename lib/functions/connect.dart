import 'package:mysql_client/mysql_client.dart';

Future<MySQLConnection> config() async {
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "dpm2023",
    databaseName: "dpm2023", // optional
  );
   await conn.connect();
   return conn;
}
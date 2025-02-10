import 'package:flutter/material.dart';
import 'package:ttlock_flutter_example/ttlock_admin/ttlock_admin_module.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'UPG');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TTLockAdminModule(),
      navigatorKey: navigatorKey,
    );
  }
}

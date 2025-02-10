import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/ttlock_admin_screen.dart';



class TTLockAdminModule extends StatelessWidget {
  const TTLockAdminModule({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TTLockAdminProvider>(create: (_)=>TTLockAdminProvider(),
    child: TTLockAdminScreen(),
    );
  }
}

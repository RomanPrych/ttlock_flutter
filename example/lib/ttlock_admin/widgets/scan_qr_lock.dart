import 'package:flutter/material.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';

class ScanQRLock extends StatelessWidget {
  const ScanQRLock(this.value,{super.key});
  final TTLockAdminProvider value;
  @override
  Widget build(BuildContext context) {
    return Text('ScanQrLock');
  }
}

import 'package:flutter/material.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/change_lock_settings.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/chose_function.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/find_locks_on_server.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/init_lock.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/scan_locks_by_bluetooth.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/scan_qr_lock.dart';


class GetRootWidgetTtAdmin extends StatelessWidget {
  const GetRootWidgetTtAdmin(this.value, {super.key});

  final TTLockAdminProvider value;

  @override
  Widget build(BuildContext context) {
    return switch (value.dataTTLockAdmin.screens) {
      TTAdminScreens.choseFunction => ChoseFunction(value),
      TTAdminScreens.scanLocksByBluetooth => ScanLocksByBluetooth(value),
      TTAdminScreens.initLock => InitLock(value),
      TTAdminScreens.scanQRLock => ScanQRLock(value),
      TTAdminScreens.findLocksOnServer => FindLocksOnServer(value),
      TTAdminScreens.changeLockSettings => ChangeLockSettings(value),
    };
  }
}

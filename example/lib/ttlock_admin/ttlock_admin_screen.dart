import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/get_root_widget_ttadmin.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/loading_ttadmin.dart';


class TTLockAdminScreen extends StatelessWidget {
  const TTLockAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TTLockAdminProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => value.onBackTap(context),
              ),
              backgroundColor: Colors.greenAccent,
              centerTitle: true,
              title: Text(
                'TT LOCK ADMIN',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: GetRootWidgetTtAdmin(value),
          ),
          LoadingTtAdmin(
            show: value.dataTTLockAdmin.isLoading,
          ),
        ],
      );
    });
  }
}

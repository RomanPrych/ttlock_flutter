import 'package:flutter/material.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';

class ChoseFunction extends StatelessWidget {
  const ChoseFunction(this.value, {super.key});

  final TTLockAdminProvider value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buttonWidget(
              onTap: () {
                value.changeScreen(TTAdminScreens.scanLocksByBluetooth);
              },
              color: Colors.blueAccent,
              label:
                  'Пошук замків через BLUETOOTH'),
          _buttonWidget(),
          _buttonWidget(),
          _buttonWidget(),
          _buttonWidget(),
        ],
      ),
    );
  }

  Widget _buttonWidget({Color? color, String? label, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color ?? Colors.grey,
        ),
        child: Text(
          label ?? 'Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}

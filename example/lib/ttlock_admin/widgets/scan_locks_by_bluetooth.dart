import 'package:flutter/material.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/button_widget.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/sized_box_ext.dart';


class ScanLocksByBluetooth extends StatelessWidget {
  const ScanLocksByBluetooth(this.value, {super.key});

  final TTLockAdminProvider value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'FIND LOCKS BY Bluetooth',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.blueAccent,
          ),
        ),
        if (value.dataTTLockAdmin.isScanning)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'is scanning ...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.greenAccent,
                ),
              ),
              20.wsb,
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.greenAccent,
                ),
              )
            ],
          ),
        Flexible(
          child: ListView.builder(
            itemCount: value.dataTTLockAdmin.lockList.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'lockMac = ${value.dataTTLockAdmin.lockList[index].lockMac}\n'
                    'lockVersion = ${value.dataTTLockAdmin.lockList[index].lockVersion}\n'
                    'electricQuantity = ${value.dataTTLockAdmin.lockList[index].electricQuantity}\n'
                    'lockName = ${value.dataTTLockAdmin.lockList[index].lockName}\n'
                    'lockSwitchState = ${value.dataTTLockAdmin.lockList[index].lockSwitchState}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'isInited = ${value.dataTTLockAdmin.lockList[index].isInited}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: !value.dataTTLockAdmin.lockList[index].isInited
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  Text(
                    'isAllowUnlock = ${value.dataTTLockAdmin.lockList[index].isAllowUnlock}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: value.dataTTLockAdmin.lockList[index].isAllowUnlock
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  10.hsb,
                  GestureDetector(
                    onTap: () => value.onLockTap(value.dataTTLockAdmin.lockList[index]),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: value.dataTTLockAdmin.lockList[index]
                                      .isAllowUnlock &&
                                  !value.dataTTLockAdmin.lockList[index]
                                      .isInited
                              ? Colors.green
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        !value.dataTTLockAdmin.lockList[index].isInited &&
                                value.dataTTLockAdmin.lockList[index]
                                    .isAllowUnlock
                            ? 'INIT LOCK'
                            : 'FIND LOCK ON SERVER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              label: 'SEARCH',
              onTap: () => value.startScanLock(),
            ),
            ButtonWidget(
              label: 'STOP SEARCH',
              color: Colors.orangeAccent,
              onTap: () => value.stopScanLock(),
            ),
          ],
        ),
        20.hsb,
      ],
    );
  }
}

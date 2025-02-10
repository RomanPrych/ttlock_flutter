import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttlock_flutter_example/ttlock_admin/provider/ttlock_admin_provider.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/button_widget.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/sized_box_ext.dart';


class InitLock extends StatelessWidget {
  const InitLock(this.value, {super.key});

  final TTLockAdminProvider value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Text(
              'lockMac = ${value.dataTTLockAdmin.scanModel?.lockMac}\n'
              'lockName = ${value.dataTTLockAdmin.scanModel?.lockName}\n'
              'electricQuantity = ${value.dataTTLockAdmin.scanModel?.electricQuantity}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "lockData:\n${value.dataTTLockAdmin.lockData}",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (value.getListCards.isNotEmpty)
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      'List cards:\n${value.getListCards}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          10.hsb,
          ButtonWidget(
              color: value.dataTTLockAdmin.lockData.isEmpty
                  ? Colors.orangeAccent
                  : Colors.grey,
              label: 'INIT',
              style: TextStyle(color: Colors.white, fontSize: 20),
              onTap: () {
                value.initLock();
              }),
          10.hsb,
          ButtonWidget(
              color: value.dataTTLockAdmin.lockData.isEmpty
                  ? Colors.grey
                  : Colors.green,
              label: 'OPEN LOCK',
              style: TextStyle(color: Colors.white, fontSize: 20),
              onTap: () {
                value.open();
              }),
          10.hsb,
          ButtonWidget(
              color: value.dataTTLockAdmin.lockData.isEmpty
                  ? Colors.grey
                  : Colors.red,
              label: 'CLOSE LOCK',
              style: TextStyle(color: Colors.white, fontSize: 20),
              onTap: () {
                value.close();
              }),
          10.hsb,
          ButtonWidget(
              color: value.dataTTLockAdmin.lockData.isEmpty
                  ? Colors.grey
                  : Colors.orange,
              label: 'ADD CARD TO LOCK',
              style: TextStyle(color: Colors.white, fontSize: 20),
              onTap: () {
                value.addCard();
              }),
          10.hsb,
          ButtonWidget(
              color: value.dataTTLockAdmin.lockData.isEmpty
                  ? Colors.grey
                  : Colors.orange,
              label: 'GET ALL CARDS FROM LOCK',
              style: TextStyle(color: Colors.white, fontSize: 20),
              onTap: () {
                value.getAllCards();
              }),
          10.hsb,
          ButtonWidget(
              color: value.dataTTLockAdmin.lockData.isEmpty
                  ? Colors.grey
                  : Colors.red,
              label: 'CLEAR ALL CARDS FROM LOCK',
              style: TextStyle(color: Colors.white, fontSize: 20),
              onTap: () {
                value.clearAllCards();
              }),
          10.hsb,
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.greenAccent, width: 3)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Назва станції'),
                  Text('Номер комірки з замком'),
                ],),

                10.hsb,

              ],
            ),
          ),
          10.hsb,
         // if( value.dataTTLockAdmin.scanModel != null &&  value.dataTTLockAdmin.scanModel?.lockName != null && value.dataTTLockAdmin.scanModel?.lockName != '')

          30.hsb,
        ],
      ),
    );
  }


}

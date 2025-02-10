import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter_example/main.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/show_msg.dart';


class TTLockAdminProvider extends ChangeNotifier {
  TTLockAdminProvider() {
    TTLock.printLog = true;
  }

  TTLockAdminData dataTTLockAdmin = TTLockAdminData();

  Future<void> stopScanLock() async {
    TTLock.stopScanLock();
    dataTTLockAdmin.isScanning = false;
    _refresh();
  }

  Future<void> open() async {
    if (dataTTLockAdmin.lockData.isEmpty) {
      return;
    }
    TTLock.controlLock(dataTTLockAdmin.lockData, TTControlAction.unlock,
        (lockTime, electricQuantity, uniqueId) {
      showMsg(navigatorKey.currentContext!,
          backgroundColor: Colors.green,
          message:
              "Unlock Success lockTime:$lockTime electricQuantity:$electricQuantity uniqueId:$uniqueId");
    }, (errorCode, errorMsg) {
      showMsg(navigatorKey.currentContext!,
          message: '$errorCode, $errorMsg',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5));
    });
    _refresh();
  }

  Future<void> close() async {
    if (dataTTLockAdmin.lockData.isEmpty) {
      return;
    }
    TTLock.controlLock(dataTTLockAdmin.lockData, TTControlAction.lock,
        (lockTime, electricQuantity, uniqueId) {
      showMsg(navigatorKey.currentContext!,
          backgroundColor: Colors.green,
          message:
              "lock Success lockTime:$lockTime electricQuantity:$electricQuantity uniqueId:$uniqueId");
    }, (errorCode, errorMsg) {
      showMsg(navigatorKey.currentContext!,
          message: '$errorCode, $errorMsg',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5));
    });
    _refresh();
  }

  void initLock() async {
    if (dataTTLockAdmin.scanModel == null ||
        dataTTLockAdmin.lockData.isNotEmpty) {
      return;
    }
    if (!await _checkBluetooth()) {
      return;
    }
    TTLock.stopScanLock();
    showLoading(true);
    Map map = Map();
    map["lockMac"] = dataTTLockAdmin.scanModel?.lockMac;
    map["lockVersion"] = dataTTLockAdmin.scanModel?.lockVersion;
    map["isInited"] = dataTTLockAdmin.scanModel?.isInited;
    TTLock.initLock(map, (lockData) {
      dataTTLockAdmin.lockData = lockData;
      dataTTLockAdmin.lockList.clear();
      showLoading(false);
    }, (errorCode, errorMsg) {
      showMsg(navigatorKey.currentContext!,
          message: 'errorCode = $errorCode, errorMsg = $errorMsg',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5));
      showLoading(false);
    });
  }

  String get getListCards {
    //I/flutter ( 9501): [{cardNumber: 1306995264, endDate: 4099741208557, startDate: 946677608557}, {cardNumber: 3459984704, endDate: 4099741208657, startDate: 946677608657}]
    String data = '';
    for (var i in dataTTLockAdmin.cardList) {
      if (i != null) {
        data = data + '${i['cardNumber']}' + ', ';
      }
    }

    return data.length > 2 ? data.substring(0, data.length - 2) : '';
  }

  bool get getErrorGasStation => dataTTLockAdmin.controllerGasStation.text.trim().isEmpty;
  bool get getErrorLockNumber => dataTTLockAdmin.controllerLockNumber.text.trim().isEmpty;




  void onChanged(){
    _refresh();
  }


  Future<void> clearAllCards() async {
    if (dataTTLockAdmin.lockData.isEmpty) {
      return;
    }
    TTLock.clearAllCards(dataTTLockAdmin.lockData, () {
      dataTTLockAdmin.cardList.clear();
      showMsg(navigatorKey.currentContext!,
          message: 'Success',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2));
      _refresh();
    }, (errorCode, errorMsg) {
      showMsg(navigatorKey.currentContext!,
          message: 'errorCode = $errorCode, errorMsg = $errorMsg',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5));
      dataTTLockAdmin.cardList.clear();
      _refresh();
    });
    _refresh();
  }

  Future<void> getAllCards() async {
    if (dataTTLockAdmin.lockData.isEmpty) {
      return;
    }
    TTLock.getAllValidCards(dataTTLockAdmin.lockData, (List<dynamic> cardList) {
      dataTTLockAdmin.cardList = cardList;
      showMsg(navigatorKey.currentContext!,
          message: 'Success',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2));
      _refresh();
    }, (errorCode, errorMsg) {
      showMsg(navigatorKey.currentContext!,
          message: 'errorCode = $errorCode, errorMsg = $errorMsg',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5));
      dataTTLockAdmin.cardList.clear();
      _refresh();
    });
    _refresh();
  }

  Future<void> addCard() async {
    if (dataTTLockAdmin.lockData.isEmpty) {
      return;
    }
    TTLock.addCard(null, 0, 0, dataTTLockAdmin.lockData, () {
      showMsg(navigatorKey.currentContext!,
          message: 'Тепер піднесіть картку для зчитування',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4));
    }, (_) {
      getAllCards();
      showMsg(navigatorKey.currentContext!,
          message: '$_',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4));
    }, (errorCode, errorMsg) {
      showMsg(navigatorKey.currentContext!,
          message: 'errorCode = $errorCode, errorMsg = $errorMsg',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5));
    });
    _refresh();
  }

  Future<bool> _checkBluetooth() async {
    Completer completer = Completer();
    bool isBluetooth = false;
    TTLock.getBluetoothState((TTBluetoothState state) {
      isBluetooth = state == TTBluetoothState.turnOn;
      completer.complete();
    });
    await completer.future;
    if (!isBluetooth) {
      showMsg(
        navigatorKey.currentContext!,
        message: 'Bluetooth is turn off!',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
    }
    return isBluetooth;
  }

  Future<void> startScanLock() async {
    if (!await _checkBluetooth()) {
      return;
    }
    dataTTLockAdmin.lockList.clear();
    TTLock.startScanLock((scanModel) {
      dataTTLockAdmin.isScanning = true;
      showLoading(true);
      dataTTLockAdmin.lockList.clear();
      bool contain = false;
      bool initStateChanged = false;
      for (var model in dataTTLockAdmin.lockList) {
        if (scanModel.lockMac == model.lockMac) {
          contain = true;
          initStateChanged = model.isInited != scanModel.isInited;
          if (initStateChanged) {
            model.isInited = scanModel.isInited;
          }
          break;
        }
      }
      if (!contain) {
        dataTTLockAdmin.lockList.add(scanModel);
      }
      if (!contain || initStateChanged) {
        dataTTLockAdmin.lockList.sort((model1, model2) =>
            (model2.isInited ? 0 : 1) - (model1.isInited ? 0 : 1));
        _refresh();
      }
      showLoading(false);
    });
    _refresh();
  }

  void onLockTap(TTLockScanModel model) {
    stopScanLock();
    bool isNotInitiated = !model.isInited && model.isAllowUnlock;
    dataTTLockAdmin.scanModel = model;
    changeScreen(
      isNotInitiated
          ? TTAdminScreens.initLock
          : TTAdminScreens.findLocksOnServer,
    );
  }

  void showLoading(bool show) {
    dataTTLockAdmin.isLoading = show;
    _refresh();
  }

  void changeScreen(TTAdminScreens screen) {
    if (screen != TTAdminScreens.initLock) {
      dataTTLockAdmin.lockData = '';
      dataTTLockAdmin.cardList.clear();
    }
    dataTTLockAdmin.screens = screen;
    _refresh();
  }

  void onBackTap(BuildContext context) {
    if (dataTTLockAdmin.screens != TTAdminScreens.choseFunction) {
      changeScreen(TTAdminScreens.choseFunction);
    } else {
      Navigator.pop(context);
    }

    _refresh();
  }

  void _refresh() {
    try {
      notifyListeners();
    } catch (e) {}
  }

  @override
  void dispose() {
    TTLock.stopScanLock();
  dataTTLockAdmin.controllerGasStation.clear();
  dataTTLockAdmin.controllerLockNumber.clear();
    super.dispose();
  }
}

class TTLockAdminData {
  TTAdminScreens screens = TTAdminScreens.choseFunction;
  List<TTLockScanModel> lockList = [];
  bool isLoading = false;
  String lockData = '';
  TTLockScanModel? scanModel;
  bool isScanning = false;
  List<dynamic> cardList = [];
  TextEditingController controllerGasStation = TextEditingController();
  TextEditingController controllerLockNumber = TextEditingController();
}

enum TTAdminScreens {
  choseFunction, //вибрати кнопку що робити
  scanLocksByBluetooth, //пошук замків через блютуз
  initLock, //запрограмувати змок (стати адміном замка)
  scanQRLock, // сканувати QR код замка (назва для пошуку на сервері)
  findLocksOnServer, //пошук всіх замків на сервері
  changeLockSettings //зміна даних замка (додати карточку, відкрити і. т. далі)
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/loading.dart';
import 'package:ttlock_flutter_example/ttlock_admin/widgets/sized_box_ext.dart';


class LoadingTtAdmin extends StatelessWidget {
  const LoadingTtAdmin({super.key, required this.show});
  final bool show;

  @override
  Widget build(BuildContext context) {
    if(!show){
      return zero;
    }
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.0,
        sigmaY: 3.0,
      ),
      child: LoadingWidget(),
    );
  }
}

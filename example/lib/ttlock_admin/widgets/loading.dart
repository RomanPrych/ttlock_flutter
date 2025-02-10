import 'package:flutter/material.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox( width: 100.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
//
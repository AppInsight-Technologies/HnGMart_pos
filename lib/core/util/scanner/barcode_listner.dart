import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
class BarCodeListner extends StatelessWidget {

  const BarCodeListner({Key? key, required this.listen, required this.child}) : super(key: key);
  final dynamic Function(String) listen;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BarcodeKeyboardListener(
      bufferDuration: Duration(milliseconds: 200),
      onBarcodeScanned: (barcode) =>listen(barcode),
      child: child,
    );
  }
}

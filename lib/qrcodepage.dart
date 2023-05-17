import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qco_qrcode/qrcode.dart';

class QRcodePage extends StatefulWidget {
  late QRcode qrcode;
  QRcodePage(this.qrcode);
  @override
  State<StatefulWidget> createState() => QRcodePageState(qrcode);
}

class QRcodePageState extends State<QRcodePage> {
  late QRcode qrcode;

  QRcodePageState(this.qrcode);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height.toDouble();
    double screenWidth = MediaQuery.of(context).size.width.toDouble();
    return Center(
        child: Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/background.png'),
      )),
      child: Container(
          child: Column(
        children: [
          Spacer(),
          Container(
              padding: EdgeInsets.all(screenWidth * .05),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * .1)),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: qrcode.usr,
                width: screenHeight * 0.3,
                height: screenHeight * 0.3,
              )),
          Spacer(),
          Container(
              padding: EdgeInsets.all(screenWidth * .05),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * .1)),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: qrcode.psw,
                width: screenHeight * 0.3,
                height: screenHeight * 0.3,
              )),
          Spacer(),
          Container(
            width: screenWidth * .8,
            height: screenHeight * .13,
            padding: EdgeInsets.only(bottom: screenWidth * .1),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                  size: screenWidth * .07, Icons.arrow_back_ios_new_rounded),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screenWidth * .2, screenWidth * .2),
                backgroundColor: Color.fromRGBO(0, 130, 195, 1),
                shape: CircleBorder(),
              ),
            ),
          )
        ],
      )),
    ));
  }
}

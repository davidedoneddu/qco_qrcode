import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qco_qrcode/qrcode.dart';
import 'package:qr/qr.dart';

import 'effects.dart';
import 'qrcodepage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isLoginDisable = true;
  TextEditingController usrController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  QRcode qrcode = QRcode();
  @override
  Widget build(BuildContext context) {
    bool selected = false;

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      double height = constraints.maxHeight;
      double width = constraints.maxWidth;
      double screenHeight = MediaQuery.of(context).size.height.toDouble();
      double screenWidth = MediaQuery.of(context).size.width.toDouble();

      MyGlobalEffects effects = MyGlobalEffects();

      return SingleChildScrollView(
          child: Center(
              child: Column(children: [
        Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/background.png'))),
            child: Column(children: [
              Container(
                      padding: EdgeInsets.only(top: screenHeight * .03),
                      width: width,
                      height: width * .5,
                      child: Image.asset("assets/images/logo_decathlon.png"))
                  .animate()
                  .moveX(
                      duration: 1000.ms,
                      begin: -width / 6,
                      curve: Curves.decelerate),
              Container(
                      //padding: EdgeInsets.only(top: screenHeight * .03),
                      width: width * .3,
                      height: width * .3,
                      child: Image.asset("assets/images/qrcode.png"))
                  .animate()
                  .fadeIn(duration: 500.ms),
              Container(
                padding: EdgeInsets.all(width * .11),
                child: Column(children: [
                  //column for login objects
                  Container(
                    padding:
                        EdgeInsets.only(top: width * .08, bottom: width * .15),
                    width: width * .9,
                    //decoration: BoxDecoration(color: Colors.black),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //prima linea di testo
                          child: Text(
                            "Turno in Cassa?",
                            style: GoogleFonts.catamaran(
                              color: Colors.white,
                              fontSize: width * .080,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ).animate(
                            effects: effects.delayedTransitionIn(600, 0, 450)),
                        Container(
                          //seconda linea di testo
                          child: Text(
                            "Genera i tuoi codici QR",
                            style: GoogleFonts.catamaran(
                              color: Colors.white,
                              fontSize: width * .040,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ).animate(
                            effects: effects.delayedTransitionIn(600, 0, 450)),
                      ],
                    ),
                  ),
                  Container(
                    //container di login
                    padding: EdgeInsets.only(
                      top: width * .01,
                      bottom: width * .01,
                      left: width * .05,
                      right: width * .05,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * .05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(width * .02,
                              height * .005, width * .02, height * .005),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 2))),
                          child: TextField(
                            style: TextStyle(fontSize: width * .04),
                            controller: usrController,
                            decoration: InputDecoration(
                                icon: Padding(
                                    padding:
                                        EdgeInsets.only(right: width * .02),
                                    child: Icon(Icons.account_box_outlined,
                                        size: .06 * width)),
                                border: InputBorder.none,
                                alignLabelWithHint: true,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    fontSize: .04 * width,
                                    color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(width * .02,
                              height * .005, width * .02, height * .005),
                          child: TextField(
                            style: TextStyle(fontSize: width * .04),
                            obscureText: true,
                            controller: pswController,
                            decoration: InputDecoration(
                                icon: Padding(
                                    padding:
                                        EdgeInsets.only(right: width * .02),
                                    child: Icon(
                                      Icons.visibility_off_outlined,
                                      size: .06 * width,
                                    )),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontSize: .04 * width,
                                    color: Colors.grey[400])),
                          ),
                        ),
                      ],
                    ),
                  ).animate(
                      effects: effects.delayedTransitionIn(
                          400, height - (height * 1.01), 400)),
                  SingleChildScrollView(
                      child: Container(
                          //container bottone genera
                          padding: EdgeInsets.only(top: height * .03),
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                                disabledBackgroundColor:
                                    Color.fromRGBO(49, 12, 16, .5),
                                backgroundColor: Color.fromRGBO(49, 12, 16, 1)),
                            onPressed: isLoginDisable ? null : _loginPressed,
                            child: /*Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(49, 12, 16, 1),
                                borderRadius:
                                    BorderRadius.circular(width * .1)),
                            child: */
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: width * .035,
                                        bottom: width * .035,
                                        right: width * .25,
                                        left: width * .25),
                                    child: Container(
                                        child: Text(
                                      "GENERA",
                                      style: GoogleFonts.catamaran(
                                        color: Colors.white,
                                        fontSize: width * .040,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ))),
                          ))).animate(
                      effects: effects.delayedTransitionIn(200, 0, 300))
                ]),
                width: width,
                height: screenHeight * .62,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 130, 195, .8),
                    borderRadius: BorderRadius.circular(width * .08)),
              ).animate(
                  effects: effects.transitionIn(4000, height - (height * .95))),
            ])),
      ])));
    }));
  }

  @override
  void initState() {
    super.initState();
    usrController.addListener(formOnChanged);
    usrController.addListener(removeSomeChar);
    pswController.addListener(formOnChanged);
  }

  void formOnChanged() {
    setState(() {
      isLoginDisable =
          (usrController.text.length == 0 || pswController.text.length == 0);
    });
  }

  void removeSomeChar() {
    final text = usrController.text
        .toUpperCase()
        .replaceAll("@", "")
        .replaceAll("#", "");

    usrController.value = usrController.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
  }

  void _loginPressed() {
    qrcode.usr = usrController.text;
    qrcode.psw = pswController.text;

    var qrCodeUsr = QrCode(4, QrErrorCorrectLevel.L)..addData(qrcode.usr);
    //QRcode.UsrQR = QrImage(qrCodeUsr)

    var qrCodePsw = QrCode(4, QrErrorCorrectLevel.L)..addData(qrcode.psw);
    //QRcode.PswQR = QrImage(qrCodePsw);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => (QRcodePage(qrcode))));
  }

  @override
  void dispose() {
    usrController.dispose();
    pswController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qco_qrcode/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Animate.restartOnHotReload = true;
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChangePosition()),
    ],
    child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        home: HomePage()),
  ));
}

class ChangePosition with ChangeNotifier {
  Offset offset = Offset.zero;
  void changePositionUp() {
    offset = offset -= const Offset(0, 200);
    notifyListeners();
  }

  void changePositionDown() {
    offset = offset += const Offset(0, 2);
    notifyListeners();
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => loopOnce(context)); //i add this to access the context safely.
  }

  Future<void> loopOnce(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 300));
    await _controller.forward();
    await _controller.reverse();
    //we can add duration here
    await Future.delayed(Duration(milliseconds: 300));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      double height = constraints.maxHeight;
      double width = constraints.maxWidth;
      ChangePosition position = Provider.of<ChangePosition>(context);

      return Center(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.png'))),
        child: Center(
            child: RotationTransition(
          turns: _controller,
          child: Image.asset(
            'assets/images/gend.png',
            width: width * .7,
            height: width * .7,
          ),
        )
            //AnimatedBuilder(
            //  animation: _controller,
            //  child: Image.asset(
            //    'assets/images/gend.png',
            //    width: width * .7,
            //    height: width * .7,
            //  ),
            //  builder: (BuildContext context, Widget? child) {
            //    return Transform.rotate(
            //        angle: _controller.value * 2 * pi, child: child);
            //  },
            //),
            ),
      ));
    }));
  }

  //void dispose() {
  //  super.dispose();
  //}
}

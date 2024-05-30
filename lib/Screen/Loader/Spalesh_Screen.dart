import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
   // Get.off(() => const Messenger());
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MyBottomNavBar()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            //SvgPicture.asset('images/facebook-messenger (1).png', width: 100),
            Center(
              child: Image.network(
                'https://www.computerhope.com/jargon/f/facebook-messenger.png',
                width: 300,
                // You can also specify height, fit, etc. according to your requirements
              ),
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
            SizedBox(height: 16),
            Text('Version 1.0.0'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

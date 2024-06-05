import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../State_Holder/OTP_Verify_Controller.dart';
import '../Home_Page.dart';
import 'Email_Verify.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  static const int initialCountdown = 100;
  int countdown = initialCountdown;
  Timer? timer;

  final VerifyOtpController _otpController = Get.put(VerifyOtpController());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // You can change the icon to whatever you need
          onPressed: () {
            Get.to(() =>
            const EmailVerificationScreen());
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text('Enter OTP Code', style: textTheme.headlineLarge),
                const SizedBox(height: 4),
                Text('A 4 digit OTP code has been sent',
                    style: textTheme.headlineSmall),
                const SizedBox(height: 24),
                _buildPinField(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final String otp = _otpTEController.text.trim();
                    if (otp.isNotEmpty) {
                      final bool success =
                      await _otpController.verifyOtp(widget.email, otp);
                      if (success) {
                        // Navigate to the next screen upon successful OTP verification
                        Get.to(() => const Messenger());
                      } else {
                        // Handle failure (display error message, etc.)
                        Get.snackbar('Error', _otpController.errorMessage);
                      }
                    } else {
                      Get.snackbar('Error', 'Please enter OTP');
                    }
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),

                _buildResendCodeMessage(),

                TextButton(
                  onPressed: () {
                    // countdown = initialCountdown;
                    // startTimer();
                    // Example: Call a method to resend OTP
                    // resendOtp();
                  },
                  child: const Text('Resend Code'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          const TextSpan(text: 'This code will expire in '),
          TextSpan(
            text: '${countdown}s',
            style: const TextStyle(color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
    );
  }
}

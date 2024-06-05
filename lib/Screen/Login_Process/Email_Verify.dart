import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../State_Holder/Email_verify_Controller.dart';
import '../../widget/Constant.dart';
import '../bottomNavBar.dart';
import 'OTP _Verify.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final VerifyEmailController _verifyEmailController =
      Get.put(VerifyEmailController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back), // You can change the icon to whatever you need
          onPressed: () {
            Get.to(() => const MyBottomNavBar());
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text('Welcome Back', style: textTheme.headlineLarge),
                  const SizedBox(height: 4),
                  Text('Please Enter Your Email Address',
                      style: textTheme.headlineSmall),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter an email address';
                      }
                      if (!Constants.emailValidatorRegExp.hasMatch(value!)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  GetBuilder<VerifyEmailController>(
                    builder: (controller) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment as needed
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool isSuccess = await _verifyEmailController
                                    .verifyEmail(_emailTEController.text);
                                if (mounted) {
                                  if (isSuccess) {
                                    Get.to(() => OtpVerificationScreen(
                                        email: _emailTEController.text));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Error: ${_verifyEmailController.errorMessage}')),
                                    );
                                  }
                                }
                              }
                            },
                            child: controller.inProgress
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text('Next'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {},
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              size: 25,
                            ),
                            label: const Text('Google'),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}

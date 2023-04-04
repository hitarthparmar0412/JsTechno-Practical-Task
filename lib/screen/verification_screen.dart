import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widget/common_button_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({
    super.key,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController verificationController = TextEditingController();

  _notify() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left_rounded),
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              PinCodeTextField(
                obscureText: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  activeFillColor: Colors.black,
                  activeColor: Colors.black,
                  disabledColor: Colors.black,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  inactiveFillColor: Colors.black,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                controller: verificationController,
                onChanged: (String value) {
                  value = verificationController.text.toString();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter otp';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButtonWidget(
                padding: EdgeInsets.zero,
                fontSize: 18,
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pop(context);
                  }
                },
                text: 'Verify',
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 11,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      verificationController.clear();
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

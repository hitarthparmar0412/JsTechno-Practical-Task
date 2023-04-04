import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utility/utility.dart';
import '../widget/app_text_field.dart';
import '../widget/common_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, this.mobileNumber}) : super(key: key);

  final String? mobileNumber;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phonenumberController.text = widget.mobileNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'New User',
          style: TextStyle(
            fontSize: 22,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value != null && value.trim() != '') {
                      } else {
                        return 'Enter a address';
                      }
                      return null;
                    },
                    controller: fullnameController,
                    hintText: 'Full Name',
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    onChanged: (value) {},
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim() == '' || !Utility.isValidEmail(value)) {
                        return 'Enter a valid address';
                      }
                      return null;
                    },
                    hintText: 'Email Address',
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    controller: phonenumberController,
                    validator: (value) {
                      if (value != null && value.trim() != '' && int.tryParse(value) is int) {
                        return null;
                      } else {
                        return 'Enter a phone number';
                      }
                    },
                    hintText: 'Phone Number',
                  ),
                  const SizedBox(height: 25),
                  CommonButtonWidget(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    innerPaddding: const EdgeInsets.only(top: 20, bottom: 20),
                    text: 'Register Now',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'We will send send a verification code',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: getValueForScreenType(
                      context: context,
                      mobile: 20,
                      tablet: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

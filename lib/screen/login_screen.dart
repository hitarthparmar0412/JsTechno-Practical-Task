import 'package:flutter/material.dart';
import 'package:jstechno_practical_task/screen/register_screen.dart';
import 'package:jstechno_practical_task/screen/verification_screen.dart';
import 'package:jstechno_practical_task/widget/app_text_field.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widget/common_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numberController = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    numberController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/previews/005/879/539/original/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Wellcome to JS Techno Solutions',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              AppTextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                controller: numberController,
                hintText: 'Enter phone Number',
              ),
              SizedBox(
                height: getValueForScreenType(
                  context: context,
                  mobile: 30,
                  tablet: 50,
                ),
              ),
              CommonButtonWidget(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 11,
                    offset: const Offset(0, 5),
                  ),
                ],
                padding: const EdgeInsets.symmetric(horizontal: 20),
                text: 'Sign In',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const VerificationScreen()),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              CommonButtonWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(mobileNumber: numberController.text),
                    ),
                  );
                },
                border: Border.all(
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                fontWeight: FontWeight.w600,
                buttonColor: Colors.white,
                textColor: Colors.blue,
                text: 'New User',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

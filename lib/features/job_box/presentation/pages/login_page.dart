import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_box/features/job_box/presentation/pages/sign_up_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/strings.dart';
import 'main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
        width: double.infinity,
        height: double.infinity,
        color: kBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Logo
              const SizedBox(
                height: kCompanyImgSize,
              ),
              Image.asset(
                kLogoImg,
                width: kLogoWidth,
                height: kLogoHeight,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: kMarginXLarge,
              ),

              /// Email Label
              Container(
                margin: const EdgeInsets.only(bottom: kMarginSmall),
                width: double.infinity,
                child: const Text(
                  kEmailTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: kTextRegular2x,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              /// Email Input
              Container(
                height: kMargin50, // Set the desired height
                padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Set border color
                  borderRadius: BorderRadius.circular(8), // Set border radius
                ),
                child: const TextField(
                  cursorColor: kPrimaryColor,
                  style: TextStyle(fontSize: kTextRegular2x),
                  decoration: InputDecoration(
                    hintText: kMail,
                    hintStyle: TextStyle(color: kHintTextColor),
                    border: InputBorder.none, // Hide the default border
                  ),
                ),
              ),

              /// Password Label and Input
              const SizedBox(
                height: kMarginMedium3,
              ),
              const PasswordInputView(),

              const SizedBox(
                height: kMarginLarge,
              ),

              /// Forgot Password?
              const Text(
                kForgetPassword,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: kTextRegular2x,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: kMarginXXLarge,
              ),

              /// Login Button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kMarginMedium),
                  color: kPrimaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainPage()));
                  },
                  child: const Text(
                    kLoginTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2x,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: kMarginLarge,
              ),

              /// No account? Sign Up
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                    text: kDontYouHaveAccount,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: kTextRegular2x,
                    ),
                  ),
                  TextSpan(
                    text: kSignUpTxt,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                      },
                    style: const TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordInputView extends StatefulWidget {
  const PasswordInputView({
    super.key,
  });

  @override
  State<PasswordInputView> createState() => _PasswordInputViewState();
}

class _PasswordInputViewState extends State<PasswordInputView> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// label
        Container(
          margin: const EdgeInsets.only(bottom: kMarginSmall),
          width: double.infinity,
          child: const Text(
            kPasswordTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        /// Password Input
        Container(
          height: kMargin50, // Set the desired height
          padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Set border color
            borderRadius: BorderRadius.circular(8), // Set border radius
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: kPasswordHint,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: const TextStyle(color: Colors.black),
                  obscureText: isPasswordHidden,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                child: Text(
                  (isPasswordHidden) ? kShow : kHide,
                  style: const TextStyle(
                    color: Color.fromRGBO(148, 148, 148, 1.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/strings.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          kSignUpTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: kGar,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: kMarginXLarge,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kMarginXLarge),
          width: double.infinity,
          color: kBackgroundColor,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: kMarginXLarge,
                ),

                /// Add photo View
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kTextRegularColor, // Outline color
                      width: 1.0, // Outline width
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      kAddPhoto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: kMarginMedium2),
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
                const SizedBox(
                  height: kMarginMedium3,
                ),

                /// New and Re-type Password View
                const NewAndRetypePasswordView(),

                const SizedBox(
                  height: kMarginXXLarge,
                ),

                /// Create Account Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMarginMedium),
                    color: kPrimaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      kCreateAccount,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: kMarginXLarge,
                ),

                /// Have account? Log in
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    const TextSpan(
                      text: kAlreadyHaveAccount,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: kTextRegular2x,
                      ),
                    ),
                    TextSpan(
                      text: kLoginIn,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      style: const TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                const Spacer(),

                ///Term of Use & Privacy Policy text
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                        text: kAgreeTo,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: kTermOfUse,
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      TextSpan(
                        text: kAnd,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: kPrivacyPolicy,
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class NewAndRetypePasswordView extends StatefulWidget {
  const NewAndRetypePasswordView({super.key});

  @override
  State<NewAndRetypePasswordView> createState() =>
      _NewAndRetypePasswordViewState();
}

class _NewAndRetypePasswordViewState extends State<NewAndRetypePasswordView> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// New Password title

        Container(
          margin: const EdgeInsets.only(bottom: kMarginSmall),
          width: double.infinity,
          child: const Text(
            kNewPasswordTitle,
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

        const SizedBox(
          height: kMarginMedium3,
        ),

        /// Re-type Password title
        Container(
          margin: const EdgeInsets.only(bottom: kMarginSmall),
          width: double.infinity,
          child: const Text(
            kReTypeTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        /// Re-type Password Input
        Container(
          height: kMargin50, // Set the desired height
          padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Set border color
            borderRadius: BorderRadius.circular(8), // Set border radius
          ),
          child: const Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: kPasswordHint,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

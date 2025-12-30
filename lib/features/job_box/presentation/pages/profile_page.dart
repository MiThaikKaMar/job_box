import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/strings.dart';
import '../widgets/list_items/file_item_card_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(kMarginLarge),
      color: kBackgroundColor,
      child: const SafeArea(
        child: Column(
          children: [
            /// Profile title
            Row(
              children: [
                Text(
                  kYourProfile,
                  style: TextStyle(
                    fontSize: kMarginXLarge,
                    fontWeight: FontWeight.w700,
                    fontFamily: kGar,
                  ),
                ),
                SizedBox(
                  width: kMarginSmall,
                ),
                Icon(
                  Icons.person,
                  size: kMarginXLarge,
                )
              ],
            ),

            /// Photo
            SizedBox(
              height: kMarginLarge,
            ),
            CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage(kDummyProfile),
            ),
            SizedBox(
              height: kMarginMedium,
            ),

            /// Contact Info View
            ContactInfoView(),

            /// Divider
            Divider(
              color: Colors.grey,
              height: 20.0, // Set the height of the horizontal divider
            ),

            ///Employment information View
            EmploymentInfoView(),
          ],
        ),
      ),
    ));
  }
}

class EmploymentInfoView extends StatelessWidget {
  const EmploymentInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///title
        Row(
          children: [
            Text(
              kEmployInfoTitle,
              style: TextStyle(
                  fontSize: kMarginMedium3, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.edit)
          ],
        ),
        SizedBox(
          height: kMarginMedium2,
        ),

        /// Resume
        Text(
          kResumeTitle,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        FileCardView(
          fileName: kDummyResumeName,
          date: kDummyResumeDate,
          cardColor: kBackgroundColor,
          childColor: Colors.black,
        ),

        /// Cover Letter
        Text(
          kCLTitle,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        FileCardView(
          fileName: "My cover letter final.doc",
          date: "11/06/20",
          cardColor: kBackgroundColor,
          childColor: Colors.black,
        ),
      ],
    );
  }
}

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kMarginMedium,
        ),

        ///title
        Row(
          children: [
            Text(
              kContactInfo,
              style: TextStyle(
                  fontSize: kMarginMedium3, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.edit)
          ],
        ),
        SizedBox(
          height: kMarginMedium2,
        ),

        ///Name
        Text(
          kFullName,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        Text(
          "Adrian severin",
          style: TextStyle(
            fontSize: kTextRegular2x,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: kMarginMedium,
        ),

        /// Email
        Text(
          kEmailTitle,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        Text(
          "adrianseverin@gmail.com",
          style: TextStyle(
            fontSize: kTextRegular2x,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: kMarginMedium,
        ),

        /// Mobile Number
        Text(
          kMobileNum,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        Text(
          "+6597417482",
          style: TextStyle(
            fontSize: kTextRegular2x,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

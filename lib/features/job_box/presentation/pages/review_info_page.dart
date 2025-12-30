import 'package:flutter/material.dart';
import 'package:job_box/features/job_box/data/models/job.dart';
import 'package:job_box/features/job_box/domain/entities/job.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/strings.dart';
import '../widgets/list_items/file_item_card_view.dart';
import 'main_page.dart';

class ReviewInfoPage extends StatelessWidget {
  final JobEntity job;

  const ReviewInfoPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(kMarginLarge),
          height: double.infinity,
          color: kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// title & progress bar
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: kMarginXLarge,
                  )),

              /// Page Title
              Text(
                "Apply to ${job.company_name}",
                style: const TextStyle(
                  fontSize: kMarginXLarge,
                  fontWeight: FontWeight.w700,
                  fontFamily: kGar,
                ),
              ),

              const SizedBox(
                height: kMarginMedium,
              ),

              /// Review Information Title
              const Text(
                kReviewInfo,
                style: TextStyle(color: kPrimaryColor),
              ),

              const SizedBox(
                height: kMarginSmall,
              ),

              /// Progress bar
              LinearProgressIndicator(
                value: 1.0,
                backgroundColor: kPrimaryColor.withOpacity(0.5),
                valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),

              /// Contact Info View
              const ContactInfoView(),

              /// Divider
              const Divider(
                color: Colors.grey,
                height: 20.0, // Set the height of the horizontal divider
              ),

              /// Employment Info View
              const EmploymentInfoView(),

              /// Proceed Button
              const Spacer(), // Added Spacer to push the button to the bottom
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kMarginMedium),
                  color: kPrimaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false);
                  },
                  child: const Text(
                    kSubmit,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2x,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          height: kMarginMedium,
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

        /// Additional Skill
        Text(
          kAdditionalSkillsTitle,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        Chip(
          label: Text(
            kFigma,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kMarginMedium,
        ),

        ///title
        const Row(
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

        ///Name
        const Text(
          kFullName,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        const Text(
          "Adrian severin",
          style: TextStyle(
            fontSize: kTextRegular2x,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),

        /// Email
        const Text(
          kEmailTitle,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        const Text(
          "adrianseverin@gmail.com",
          style: TextStyle(
            fontSize: kTextRegular2x,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),

        /// Mobile Number
        const Text(
          kMobileNum,
          style: TextStyle(fontSize: kTextRegular2x, color: kTextRegularColor),
        ),
        const Text(
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

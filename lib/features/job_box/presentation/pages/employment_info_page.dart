import 'package:flutter/material.dart';
import 'package:job_box/features/job_box/domain/entities/job.dart';
import 'package:job_box/features/job_box/presentation/pages/review_info_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/strings.dart';

class EmploymentInfoPage extends StatelessWidget {
  final JobEntity job;

  const EmploymentInfoPage({super.key, required this.job});

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
                height: kMarginLarge,
              ),

              /// Employment Information Title
              const Text(
                kEmployInfoTitle,
                style: TextStyle(color: kPrimaryColor),
              ),

              const SizedBox(
                height: kMarginSmall,
              ),

              /// Progress bar
              LinearProgressIndicator(
                value: 0.7,
                backgroundColor: kPrimaryColor.withOpacity(0.5),
                valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),

              /// Education View
              const EducationalView(),

              /// Work Experience View
              const WorkExperienceView(),

              /// Additional Skill
              const AdditionalSkillView(),

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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReviewInfoPage(
                              job: job,
                            )));
                  },
                  child: const Text(
                    kProceed,
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

class AdditionalSkillView extends StatelessWidget {
  const AdditionalSkillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kMarginMedium,
        ),
        const Text(
          kAdditionalSkillsTitle,
          style:
              TextStyle(fontSize: kMarginMedium3, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            // Transparent white background
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          child: TextField(
            cursorColor: kPrimaryColor,
            style: const TextStyle(color: Colors.black), // Text color
            decoration: InputDecoration(
              icon: Container(
                  margin: const EdgeInsets.only(
                      top: kMarginSmall,
                      bottom: kMarginSmall,
                      left: kMarginMedium),
                  child: const Icon(
                    Icons.search,
                    color: kTextRegularColor,
                    size: kMarginXLarge,
                  )),
              // Search icon
              hintText: kSearchSkillsHint,
              hintStyle: const TextStyle(color: kSearchColor),
              // Hint text color
              border: InputBorder.none, // Remove default border
            ),
          ),
        ),
      ],
    );
  }
}

class EducationalView extends StatefulWidget {
  const EducationalView({super.key});

  @override
  State<EducationalView> createState() => _EducationalViewState();
}

class _EducationalViewState extends State<EducationalView> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kMarginMedium3,
        ),
        const Text(
          kEducationTitle,
          style:
              TextStyle(fontSize: kMarginMedium3, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Text(
              kIncludeInResume,
              style:
                  TextStyle(color: kTextRegularColor, fontSize: kTextRegular2x),
            ),
            const Spacer(),
            Switch(
              activeColor: kPrimaryColor,
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ],
        ),

        ///Name of School label & input
        const SizedBox(
          width: double.infinity,
          child: Text(
            kNameOfSchool,
            style: TextStyle(
              color: Colors.black,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMarginMedium),
          ),
          height: kMargin50,
          child: const TextField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kTextRegularColor), // Set the desired color
              ),
            ),
            style: TextStyle(color: kTextRegularColor),
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),

        /// Course of Study label & input
        const SizedBox(
          width: double.infinity,
          child: Text(
            kCourseOfStudy,
            style: TextStyle(
              color: Colors.black,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMarginMedium),
          ),
          height: kMargin50,
          child: const TextField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kTextRegularColor), // Set the desired color
              ),
            ),
            style: TextStyle(color: kTextRegularColor),
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),

        /// Year Graduated - label & input
        const SizedBox(
          width: double.infinity,
          child: Text(
            kYearGraduated,
            style: TextStyle(
              color: Colors.black,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMarginMedium),
          ),
          height: kMargin50,
          child: const TextField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kTextRegularColor), // Set the desired color
              ),
            ),
            style: TextStyle(color: kTextRegularColor),
          ),
        ),
        const SizedBox(
          height: kMarginMedium,
        ),
      ],
    );
  }
}

class WorkExperienceView extends StatefulWidget {
  const WorkExperienceView({super.key});

  @override
  State<WorkExperienceView> createState() => _WorkExperienceViewState();
}

class _WorkExperienceViewState extends State<WorkExperienceView> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kMarginMedium,
        ),
        const Text(
          kWorkExperience,
          style:
              TextStyle(fontSize: kMarginMedium3, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Text(
              kIncludeInResume,
              style:
                  TextStyle(color: kTextRegularColor, fontSize: kTextRegular2x),
            ),
            const Spacer(),
            Switch(
              activeColor: kPrimaryColor,
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

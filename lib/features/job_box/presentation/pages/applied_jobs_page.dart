import 'package:flutter/material.dart';
import 'package:job_box/core/utils/colors.dart';
import 'package:job_box/core/utils/dimens.dart';
import 'package:job_box/core/utils/fonts.dart';
import 'package:job_box/core/utils/strings.dart';
import 'package:job_box/features/job_box/domain/entities/job.dart';

import '../widgets/list_items/job_list_item_view.dart';

class AppliedJobPage extends StatelessWidget {
  AppliedJobPage({super.key});

  final List<JobEntity> dummyJobList = [
    JobEntity(
        company_name: "Slack",
        post_date: "09 Sept 2020",
        job_title: "Senior Product Designer",
        salary_range: "\$6k-\$8k/month",
        region: "East, Singapore"),
    JobEntity(
        company_name: "Crypto.com",
        post_date: "09 Sept 2020",
        job_title: "Front-End Developer",
        salary_range: "\$5k-\$6k/month",
        region: "Central, Singapore"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(kMarginLarge),
      color: kBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile title
            const Row(
              children: [
                Text(
                  kYourAppliedJobs,
                  style: TextStyle(
                    fontSize: kMarginXLarge,
                    fontWeight: FontWeight.w700,
                    fontFamily: kGar,
                  ),
                ),
                SizedBox(
                  width: kMarginSmall,
                ),
                Icon(Icons.edit)
              ],
            ),
            const SizedBox(
              height: kMarginLarge,
            ),
            const Text(
              "You applied for 2 jobs",
              style:
                  TextStyle(color: kHintTextColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: kMarginMedium2,
            ),

            /// Applied Job List
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: JobListItemView(
                          job: dummyJobList[index],
                        )),
                    const SizedBox(
                      height: kMarginMedium,
                    ),
                  ],
                ),
                itemCount: dummyJobList.length,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:job_box/core/utils/colors.dart';
import 'package:job_box/core/utils/dimens.dart';
import 'package:job_box/features/job_box/domain/entities/job.dart';

class JobListItemView extends StatelessWidget {
  final JobEntity job;

  const JobListItemView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0, // Set the elevation value as needed
      borderRadius: BorderRadius.circular(kMarginMedium),
      child: Container(
        padding: const EdgeInsets.all(kMarginMedium3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kMarginMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Company Name & Date
            Container(
              margin: const EdgeInsets.only(bottom: kMarginSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    job.company_name.toString().toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    job.post_date.toString(),
                    style: const TextStyle(color: kTextRegularColor),
                  ),
                ],
              ),
            ),

            /// Job position Title
            Text(
              job.job_title.toString(),
              style: const TextStyle(
                fontSize: kMarginMedium3,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: kMarginMedium,
            ),

            /// Salary and Region
            Row(
              children: [
                const Icon(
                  Icons.money,
                  color: kHintTextColor,
                ),
                const SizedBox(
                  width: kMarginSmall,
                ),
                Text(
                  job.salary_range.toString(),
                  style: const TextStyle(
                      color: kHintTextColor, fontSize: kTextRegular2x),
                ),
                const SizedBox(
                  width: kMarginMedium2,
                ),
                Text(
                  job.region.toString(),
                  style: const TextStyle(
                      color: kHintTextColor, fontSize: kTextRegular2x),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

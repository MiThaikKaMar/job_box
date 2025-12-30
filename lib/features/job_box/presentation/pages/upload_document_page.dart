import 'package:flutter/material.dart';
import 'package:job_box/features/job_box/domain/entities/job.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/strings.dart';
import '../../data/dummy/dummy_uploaded_file_vo.dart';
import '../widgets/list_items/file_item_card_view.dart';
import 'employment_info_page.dart';

class UploadDocumentPage extends StatelessWidget {
  final JobEntity job;

  UploadDocumentPage({super.key, required this.job});

  /// Dummy File Uploaded List
  final List<DummyUploadedFileVO> uploadedResume = [
    DummyUploadedFileVO(file_name: kDummyResumeName, date: kDummyResumeDate),
  ];

  final List<DummyUploadedFileVO> uploadedCoverLetter = [
    DummyUploadedFileVO(
        file_name: "My cover letter final.doc", date: "11/06/20"),
    DummyUploadedFileVO(file_name: "My cover letter.doc", date: "06/06/20"),
  ];

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
              /// title & upload progress bar
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: kMarginXLarge,
                  )),

              /// Page title
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

              /// Uploading Document Title
              const Text(
                kUploadOfDoc,
                style: TextStyle(color: kPrimaryColor),
              ),
              const SizedBox(
                height: kMarginSmall,
              ),

              /// Progress bar
              LinearProgressIndicator(
                value: 0.3,
                backgroundColor: kPrimaryColor.withOpacity(0.5),
                valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),

              const SizedBox(
                height: kMarginMedium3,
              ),

              /// Resume Title View
              const AddFileView(
                title: kResumeTitle,
                description: kResumeDes,
              ),

              /// Resume Files View
              SizedBox(
                height: kSheetBottomHeight,
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: FileCardView(
                            fileName: uploadedResume[index].file_name,
                            date: uploadedResume[index].date,
                            cardColor: (index % 2 != 0)
                                ? kPrimaryColor.withOpacity(0.1)
                                : kPrimaryColor,
                            childColor:
                                (index % 2 != 0) ? kPrimaryColor : Colors.white,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  itemCount: uploadedResume.length,
                ),
              ),

              /// Cover Letter Title View
              const AddFileView(
                title: kCLTitle,
                description: kCLDes,
              ),

              /// Cover Letters Files
              SizedBox(
                height: kGreetingAndTopViewHeight,
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: FileCardView(
                            fileName: uploadedCoverLetter[index].file_name,
                            date: uploadedCoverLetter[index].date,
                            cardColor: (index % 2 != 0)
                                ? kPrimaryColor.withOpacity(0.1)
                                : kPrimaryColor,
                            childColor:
                                (index % 2 != 0) ? kPrimaryColor : Colors.white,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  itemCount: uploadedCoverLetter.length,
                ),
              ),

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
                        builder: (context) => EmploymentInfoPage(
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

class AddFileView extends StatelessWidget {
  final String title;
  final String description;

  const AddFileView(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: kMarginMedium3, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: const TextStyle(color: kTextRegularColor),
            ),
            const SizedBox(
              height: kMarginMedium3,
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.add,
          size: kMarginXLarge,
        )
      ],
    );
  }
}

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/features/job_box/domain/entities/job.dart';
import 'package:job_box/features/job_box/presentation/pages/upload_document_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/fonts.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/strings.dart';
import '../bloc/jobs/remote/remote_job_bloc.dart';
import '../bloc/jobs/remote/remote_job_state.dart';
import '../widgets/list_items/job_list_item_view.dart';

class JobListingsPage extends StatelessWidget {
  const JobListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        /// Greeting and search View
        GreetingAndSearchView(),

        /// Tab View
        Expanded(child: JobTabView())
      ],
    ));
  }
}

class JobTabView extends StatefulWidget {
  const JobTabView({super.key});

  @override
  State<JobTabView> createState() => _JobTabViewState();
}

class _JobTabViewState extends State<JobTabView> {
  @override
  Widget build(BuildContext context) {
    return ContainedTabBarView(
      tabBarProperties: const TabBarProperties(
        indicatorWeight: 3.0, // Set the thickness of the underline
        indicatorColor: kPrimaryColor,
        unselectedLabelColor: kHintTextColor,
        labelColor: kPrimaryColor,
      ),
      tabs: const [
        Text(
          kRecentJob,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          kNearYou,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      views: [
        JobsListView(),
        JobsListView(),
      ],
      onChange: (index) {},
    );
  }
}

class JobsListView extends StatelessWidget {
  JobsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      child: BlocBuilder<RemoteJobsBloc, RemoteJobsState>(
        builder: (_, state) {
          if (state is RemoteJobsLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteJobsError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteJobsDone) {
            return ListView.builder(
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          print(state.jobs![index].toString());

                          /// Show BottomSheet
                          showCustomButtonSheet(context, state.jobs![index]);
                        },
                        child: JobListItemView(job: state.jobs![index])),
                    const SizedBox(
                      height: kMarginMedium,
                    ),
                  ],
                ),
              ),
              itemCount: state.jobs!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class GreetingAndSearchView extends StatelessWidget {
  const GreetingAndSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kGreetingAndTopViewHeight,
      color: kPrimaryColor,
      padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kMargin70,
          ),

          /// Greeting View
          Row(
            children: [
              const Text("Hi Mark"),
              const SizedBox(
                width: kMarginSmall,
              ),
              Image.asset(
                kWaveHangImg,
                width: kMarginMedium2,
                height: kMarginMedium2,
              )
            ],
          ),

          /// Search title
          const Text(
            kFindJobHere,
            style: TextStyle(
              fontSize: kMarginLarge,
              fontWeight: FontWeight.w700,
              fontFamily: kGar,
            ),
          ),
          const SizedBox(
            height: kMarginLarge,
          ),

          ///Search Input View
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
                hintText: kJobSearchHint,
                hintStyle: const TextStyle(color: kSearchColor),
                // Hint text color
                border: InputBorder.none, // Remove default border
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showCustomButtonSheet(BuildContext context, JobEntity job) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // default 0.1
          child: Container(
              padding: const EdgeInsets.only(
                  left: kMarginLarge,
                  right: kMarginLarge,
                  bottom: kMarginLarge),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  /// Job Info
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        /// short divider
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            // Adjust the radius as needed
                            color: kDividerColor,
                          ),
                          margin: const EdgeInsets.only(top: kMarginMedium),
                          height: 5.0,
                          width: 130, // Adjust the thickness as needed
                        ),

                        const SizedBox(
                          height: kMarginLarge,
                        ),

                        /// Company Logo
                        Image.asset(
                          kSlackIcon,
                          width: kCompanyImgSize,
                          height: kCompanyImgSize,
                        ),
                        const SizedBox(
                          height: kMarginLarge,
                        ),

                        /// Company Name
                        Text(
                          job.company_name.toString().toUpperCase(),
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: kTextRegular2x),
                        ),
                        const SizedBox(
                          height: kMarginSmall,
                        ),
                        Text(
                          job.job_title.toString(),
                          style: const TextStyle(
                            fontSize: kMarginMedium3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: kMarginSmall,
                        ),

                        /// Region
                        Text(
                          job.region.toString(),
                          style: const TextStyle(
                              color: kTextRegularColor, fontSize: kMargin18),
                        ),

                        const SizedBox(
                          height: kMarginLarge,
                        ),

                        /// Job Description title and Text
                        const SizedBox(
                            width: double.infinity,
                            child: Text(
                              kDescriptionTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: kTextRegular2x,
                              ),
                            )),
                        const SizedBox(
                          height: kMarginSmall,
                        ),
                        const Text(
                          kDummyJobDes,
                          style: TextStyle(
                            fontSize: kTextRegular2x,
                            height: 1.7,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.0, // Adjust the spacing as needed
                          ),
                        ),

                        const SizedBox(
                          height: kMarginMedium,
                        ),

                        /// Job Requirements title and Text
                        const SizedBox(
                            width: double.infinity,
                            child: Text(
                              kRequirementTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: kTextRegular2x,
                              ),
                            )),
                        const SizedBox(
                          height: kMarginMedium,
                        ),
                        const Text(
                          kDummyJobRequirements,
                          style: TextStyle(
                            fontSize: kTextRegular2x,
                            height: 1.7,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.0, // Adjust the spacing as needed
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Gradient & Apply Button
                  /// Bottom Gradient and Apply Button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: kSheetBottomHeight,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.3, 1.0],
                            colors: [
                              Colors.white54,
                              Colors.white,
                              Colors.white
                            ],
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kMarginMedium),
                                    color: kPrimaryColor,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UploadDocumentPage(
                                                    job: job,
                                                  )));
                                    },
                                    child: const Text(
                                      kApplyThisJob,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: kTextRegular2x,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// Bookmark Icon
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: kMarginMedium),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // Border radius
                                    color: kPrimaryColor
                                        .withOpacity(0.1), // Background color
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      // Add your button click logic here
                                    },
                                    icon: const Icon(
                                      Icons.bookmark_outline,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              )),
        );
      });
}

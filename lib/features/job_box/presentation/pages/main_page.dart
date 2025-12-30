import 'package:flutter/material.dart';
import 'package:job_box/features/job_box/presentation/pages/profile_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/strings.dart';
import 'applied_jobs_page.dart';
import 'job_listings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> screensWidget = [
    const JobListingsPage(),
    AppliedJobPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        unselectedItemColor: kBottomNavigationUnSelectedColor,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: _getBottomNavigationBarItems(),
      ),
      body: screensWidget[currentIndex],
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.list),
        activeIcon: Icon(
          Icons.list,
          color: kPrimaryColor,
        ),
        label: kJobListingsLabel,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.edit),
        activeIcon: Icon(
          Icons.edit,
          color: kPrimaryColor,
        ),
        label: kAppliedJobsLabel,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(
          Icons.person,
          color: kPrimaryColor,
        ),
        label: kJobListingsLabel,
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/config/theme/app_theme.dart';
import 'package:job_box/features/job_box/presentation/bloc/jobs/remote/remote_job_event.dart';

import 'features/job_box/presentation/bloc/jobs/remote/remote_job_bloc.dart';
import 'features/job_box/presentation/pages/login_page.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteJobsBloc>(
      create: (context) => sl()..add(const GetJobs()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const LoginPage(),
      ),
    );
  }
}

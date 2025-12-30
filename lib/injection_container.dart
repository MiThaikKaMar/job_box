import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/job_box/data/data_sources/remote/jobs_api_service.dart';
import 'features/job_box/data/repository/job_repository_impl.dart';
import 'features/job_box/domain/repository/job_repository.dart';
import 'features/job_box/domain/usecases/get_job.dart';
import 'features/job_box/presentation/bloc/jobs/remote/remote_job_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<JobsApiService>(JobsApiService(sl()));

  sl.registerSingleton<JobRepository>(JobRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetJobUseCase>(GetJobUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteJobsBloc>(() => RemoteJobsBloc(sl()));
}

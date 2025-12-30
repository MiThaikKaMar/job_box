import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/job.dart';

abstract class RemoteJobsState extends Equatable {
  final List<JobEntity>? jobs;
  final DioException? error;

  const RemoteJobsState({this.jobs, this.error});

  @override
  List<Object> get props => [jobs!, error!];
}

class RemoteJobsLoading extends RemoteJobsState {
  const RemoteJobsLoading();
}

class RemoteJobsDone extends RemoteJobsState {
  const RemoteJobsDone(List<JobEntity> article) : super(jobs: article);
}

class RemoteJobsError extends RemoteJobsState {
  const RemoteJobsError(DioException error) : super(error: error);
}

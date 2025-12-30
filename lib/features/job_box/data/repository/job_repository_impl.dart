import 'dart:io';

import 'package:dio/dio.dart';
import 'package:job_box/core/resources/data_state.dart';

import 'package:job_box/features/job_box/domain/entities/job.dart';

import '../../domain/repository/job_repository.dart';
import '../data_sources/remote/jobs_api_service.dart';

class JobRepositoryImpl implements JobRepository {
  final JobsApiService _jobsApiService;

  JobRepositoryImpl(this._jobsApiService);

  @override
  Future<DataState<List<JobEntity>>> getJobs() async {
    try {
      final httpResponse = await _jobsApiService.getJobs();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

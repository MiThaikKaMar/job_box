import 'package:dio/dio.dart';
import 'package:job_box/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/job.dart';

part 'jobs_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class JobsApiService {
  factory JobsApiService(Dio dio) = _JobsApiService;

  @GET("/jobs")
  Future<HttpResponse<List<JobModel>>> getJobs();
}

import 'package:job_box/features/job_box/domain/entities/job.dart';

import '../../../../core/resources/data_state.dart';

abstract class JobRepository {
  // API methods
  Future<DataState<List<JobEntity>>> getJobs();
}

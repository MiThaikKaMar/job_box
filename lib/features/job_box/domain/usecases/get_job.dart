import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/job.dart';
import '../repository/job_repository.dart';

class GetJobUseCase implements UseCase<DataState<List<JobEntity>>, void> {
  final JobRepository _jobRepository;

  GetJobUseCase(this._jobRepository);

  @override
  Future<DataState<List<JobEntity>>> call({void params}) {
    return _jobRepository.getJobs();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/features/job_box/presentation/bloc/jobs/remote/remote_job_event.dart';
import 'package:job_box/features/job_box/presentation/bloc/jobs/remote/remote_job_state.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_job.dart';

class RemoteJobsBloc extends Bloc<RemoteJobsEvent, RemoteJobsState> {
  final GetJobUseCase _getJobUseCase;

  RemoteJobsBloc(this._getJobUseCase) : super(const RemoteJobsLoading()) {
    on<GetJobs>(onGetJobs);
  }

  void onGetJobs(GetJobs event, Emitter<RemoteJobsState> emit) async {
    final dataState = await _getJobUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteJobsDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteJobsError(dataState.error!));
    }
  }
}

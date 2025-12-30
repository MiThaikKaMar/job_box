import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? company_name;
  final String? job_title;
  final String? post_date;
  final String? salary_range;
  final String? region;
  final String? job_des;
  final String? job_require;

  const JobEntity(
      {this.company_name,
      this.job_title,
      this.post_date,
      this.salary_range,
      this.region,
      this.job_des,
      this.job_require});

  @override
  List<Object?> get props {
    return [
      company_name,
      job_title,
      post_date,
      salary_range,
      region,
      job_des,
      job_require
    ];
  }
}

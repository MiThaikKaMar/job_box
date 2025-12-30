import '../../domain/entities/job.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class JobModel extends JobEntity {
  const JobModel({
    String? companyName,
    String? jobTitle,
    String? postDate,
    String? salaryRange,
    String? region,
    String? jobDes,
    String? jobRequire,
  }) : super(
            company_name: companyName,
            job_title: jobTitle,
            post_date: postDate,
            salary_range: salaryRange,
            region: region,
            job_des: jobDes,
            job_require: jobRequire);

  factory JobModel.fromJson(Map<String, dynamic> map) {
    return JobModel(
      companyName: map['companyName'] ?? "",
      jobTitle: map['jobTitle'] ?? "",
      postDate: map['postDate'] ?? "",
      salaryRange: map['salaryRange'] ?? "",
      region: map['region'] ?? "",
      jobDes: map['jobDes'] ?? "",
      jobRequire: map['jobRequire'] ?? "",
    );
  }
}

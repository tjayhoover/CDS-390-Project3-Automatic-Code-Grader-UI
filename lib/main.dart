import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project3_ui/cubits/assignments/assignments_cubit.dart';
import 'package:project3_ui/cubits/grade_reports/instructor_grade_report_cubit.dart';
import 'package:project3_ui/cubits/grade_reports/student_grade_report_cubit.dart';
import 'package:project3_ui/cubits/login/login_cubit.dart';
import 'package:project3_ui/cubits/users/users_cubit.dart';
import 'package:project3_ui/repositories/assignments/implementation/http_assignment_repository.dart';
import 'package:project3_ui/repositories/instructor_grade_reports/implementation/http_instructor_grade_report_repository.dart';
import 'package:project3_ui/repositories/login/implementation/http_login_repository.dart';
import 'package:project3_ui/repositories/login/interface/login_repository.dart';
import 'package:project3_ui/repositories/assignments/interface/assignment_repository.dart';
import 'package:project3_ui/repositories/student_grade_reports/interface/student_grade_reports_repository.dart';
import 'package:project3_ui/repositories/submissions/implementation/http_submission_repository.dart';
import 'package:project3_ui/repositories/submissions/interface/submission_repository.dart';
import 'package:project3_ui/repositories/users/implementation/http_user_repository.dart';
import 'package:project3_ui/repositories/users/interface/user_repository.dart';
import 'package:project3_ui/cubits/submissions/submissions_cubit.dart';
import 'pages/login/login.dart';
import 'package:project3_ui/repositories/instructor_grade_reports/interface/instructor_grade_report_repository.dart';
import 'package:project3_ui/repositories/student_grade_reports/implementation/http_sgr_repository.dart';

void main() async {
  GetIt.I.registerSingleton<UserRepository>(HTTPUserRepository());
  GetIt.I.registerSingleton<StudentGradeReportRepository>(HttpSgrRepo());
  GetIt.I.registerSingleton<AssignmentRepository>(HttpAssignmentRepo());
  GetIt.I.registerSingleton<LoginRepository>(HTTPLoginRepository());
  GetIt.I.registerSingleton<SubmissionRepository>(HTTPSubmissionRepo());
  GetIt.I.registerSingleton<InstructorGradeReportRepository>(
      HTTPInstructorGradeReportRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => AssignmentListCubit()),
      BlocProvider(create: (BuildContext context) => UserListCubit()),
      BlocProvider(create: (BuildContext context) => UploadAssignmentCubit()),
      BlocProvider(create: (BuildContext context) => UserDeleteCubit()),
      BlocProvider(create: (BuildContext context) => UserCreateCubit()),
      BlocProvider(create: (BuildContext context) => StudentGradeReport()),
      BlocProvider(create: (BuildContext context) => SubmissionCubit()),
      BlocProvider(create: (BuildContext context) => InstructorGradeReport()),
      BlocProvider(create: (BuildContext context) => LoginCubit()),
    ],
    child: MaterialApp(
      title: 'Code Grading Tool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogInPage(),
    ),
  ));
}

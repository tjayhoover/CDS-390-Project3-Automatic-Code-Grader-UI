import 'package:equatable/equatable.dart';
import 'package:project3_ui/entities/assignment_grade_report.dart';

abstract class InstructorGradeReportState extends Equatable {}

class InstructorGradeReportLoadingState extends InstructorGradeReportState {
  @override
  List<Object?> get props => [];
}

class InstructorGradeReportLoadedState extends InstructorGradeReportState {
  final Map<String, List<AssignmentGradeReport>> gradeReport;
  InstructorGradeReportLoadedState(this.gradeReport);

  @override
  List<Object?> get props => [gradeReport];
}

class InstructorGradeReportFailureState extends InstructorGradeReportState {
  @override
  // TODO: Is this a decent way of checking whether the state exists?
  // If the state can give you its properties, it probably exists (° ͜ʖ ͡°)
  List<Object?> get props => [false];
}

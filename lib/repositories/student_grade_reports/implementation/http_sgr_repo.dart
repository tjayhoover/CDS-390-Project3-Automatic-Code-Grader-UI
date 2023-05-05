import 'package:project3_ui/entities/grade_report.dart';
import 'package:project3_ui/repositories/student_grade_reports/interface/student_grade_reports_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project3_ui/url.dart';

class httpSgrRepo implements StudentGradeReportRepository {
  @override
  Future<List<GradeReport>> getGradeReports(int studentID) async {
    var response = await http.get(
        (Uri.parse('$serverURL/assignments/completed')),
        headers: {'Authorization': studentID.toString()});

    if (response.statusCode == 200) {
      // Decode the json, turn it into a list of assignments, and return it
      return (json.decode(response.body) as List)
          .map((i) => GradeReport.fromJson(i))
          .toList();
    } else {
      throw Exception("Could not get grade reports");
    }
  }
}
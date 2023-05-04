import 'package:project3_ui/entities/assignment.dart';

import 'dart:io';

abstract class AssignmentRepository {
  // Returns a list of all pending assignments
  List<Assignment> getPendingAssignments(int sutdentID);

  // TODO: add the other required methods to this interface

  // Submit an assignment and get a grade back
  // Returns a list containing two integers. The first one is the number
  // of cases passed, the second is the total number of cases
  Future<List<int>> submitAssignment(int assignmentID, int studentID, File code);
}

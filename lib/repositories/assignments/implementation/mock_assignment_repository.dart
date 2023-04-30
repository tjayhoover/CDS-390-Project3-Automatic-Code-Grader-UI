import 'package:project3_ui/entities/assignment.dart';
import 'package:project3_ui/repositories/assignments/interface/assignment_repository.dart';

class MockAssignmentRepository implements AssignmentRepository {
  Future<Assignment> postAssignment(String name, String desc, DateTime dueDate,
      List<String> inputs, List<String> outputs) async {
    await Future.delayed(Duration(seconds: 1));
    return Assignment(1, name, dueDate, desc, inputs: inputs, outputs: outputs);
  }

  @override
  List<Assignment> getPendingAssignments(int studentID) {
    List<Assignment> assignmentList = [
      Assignment(1, "Test One", DateTime.now(), "This is test #1."),
      Assignment(2, "Test2", DateTime.now(), "This is amazing"),
    ];
    return assignmentList;
  }
}

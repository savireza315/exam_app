part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}
class CourseLoading extends CourseState {}
class CourseSucces extends CourseState {
  final CourseResponse courseResponse;

  CourseSucces({required this.courseResponse});
}
class CourseFailed extends CourseState {
  final String? message;

  CourseFailed({this.message});
}


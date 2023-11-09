part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}
class ExerciseLoading extends ExerciseState {}
class ExerciseSucces extends ExerciseState {
  final ExerciseResponse exerciseResponse;

  ExerciseSucces({required this.exerciseResponse});
}
final class ExerciseFailed extends ExerciseState{
  final String? message;

  ExerciseFailed({this.message});
}

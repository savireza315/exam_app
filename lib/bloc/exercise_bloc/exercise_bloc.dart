import 'dart:async';

import 'package:exam_app/datasource/courseRemoteDataSource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/model/exercise_response_model.dart';
import 'package:meta/meta.dart';
part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final courseRemote CourseRemote;
  ExerciseBloc({required this.CourseRemote}) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async{
      if(event is GetExerciseListEvent){
        emit(ExerciseLoading());

        final result = await CourseRemote.getExercise(event.courseId);
        for(var i = 0; i<(result.data?.length??0); i++){
          await CourseRemote.getQuestionList(result.data?[i].exerciseId??'');
        }
        emit(ExerciseSucces(exerciseResponse: result));
      }
    });
  }
}

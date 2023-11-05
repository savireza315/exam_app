import 'dart:async';

import 'package:exam_app/datasource/courseRemoteDataSource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_app/model/courseResponseModel.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final courseRemote CourseRemote;

  CourseBloc({required this.CourseRemote}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async{
      if(event is GetCourseListEvent){
        emit(CourseLoading());

       final result = await CourseRemote.getCourse();
      
       emit(CourseSucces(courseResponse: result));
      }
    });
  }
}

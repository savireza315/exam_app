import 'dart:convert';
import 'dart:developer';

import 'package:exam_app/model/courseResponseModel.dart';
import 'package:exam_app/model/exercise_response_model.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/constans/constans.dart';

class courseRemote {
  Future<CourseResponse> getCourse() async {
    try {
      // const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final url = '${learningConstans.baseUrl}${learningConstans.coursePath}';
      final result = await Dio().get(url, options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}
      ),
      );
      final courseResponse = CourseResponse.fromJson(result.data);
      return courseResponse;
    } catch (e, stacktrace) {
      log(
          e.toString(),
          stackTrace: stacktrace,
          error: e
      );
      rethrow;
    }
  }

  Future<ExerciseResponse> getExercise(String courseId) async {
    try {
      // const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final url = '${learningConstans.baseUrl}${learningConstans.exerciseList}';
      final result = await Dio().get(url, options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}
      ),
          queryParameters: {
            'course_id': courseId,
            'user_email': 'testerngbayu@gmail.com'
          }
      );
      final exerciseResponse = ExerciseResponse.fromJson(result.data);
      log('Exercise response = ${json.encode(result.data)}');
      return exerciseResponse;
    } catch (e, stacktrace) {
      log(
          e.toString(),
          stackTrace: stacktrace,
          error: e
      );
      rethrow;
    }
  }

  Future getQuestionList(String exerciseId) async {
    try {
      // const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final url = '${learningConstans.baseUrl}${learningConstans.questionList}';
      final payload = FormData.fromMap({
        'exercise_id': exerciseId,
        'user_email': 'testerngbayu@gmail.com',
      }
      );
      final result = await Dio().post(url, data: payload,
        options: Options(
            headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}
        ),);
      log('Resultnya $exerciseId: ${json.encode(result.data)}');
      final exerciseResponse = ExerciseResponse.fromJson(result.data);
      log('Exercise response = ${json.encode(result.data)}');
      return exerciseResponse;
    } catch (e, stacktrace) {
      log(
          e.toString(),
          stackTrace: stacktrace,
          error: e
      );
      rethrow;
    }
  }
}
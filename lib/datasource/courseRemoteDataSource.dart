import 'dart:developer';

import 'package:exam_app/model/courseResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/constans/constans.dart';

class courseRemote{
  Future<CourseResponse> getCourse() async{
    try{
      // const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final url = '${learningConstans.baseUrl}${learningConstans.coursePath}';
      final result = await Dio().get(url, options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}
      ),
      );
      final courseResponse = CourseResponse.fromJson(result.data);
      return courseResponse;
    }catch(e,stacktrace){
      log(
          e.toString(),
          stackTrace: stacktrace,
          error: e
      );
      rethrow;
    }
  }
  }
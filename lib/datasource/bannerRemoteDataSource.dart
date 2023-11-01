import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:exam_app/constans/constans.dart';
import 'package:exam_app/model/bannerResponseModel.dart';

class bannerRemote{
  Future<BannerResponse> getBanners() async{
    try{
      // const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final url = '${learningConstans.baseUrl}${learningConstans.bannerPath}';
      final result = await Dio().get(url, options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}
      ),
      );
      final bannerResponse = BannerResponse.fromJson(result.data);
      return bannerResponse;
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
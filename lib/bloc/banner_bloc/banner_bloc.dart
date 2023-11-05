import 'dart:async';

import 'package:exam_app/model/bannerResponseModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:exam_app/datasource/bannerRemoteDataSource.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final bannerRemote BannerRemote;

  BannerBloc({required this.BannerRemote}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async{
      if(event is GetBannerListEvent){
        emit(BannerLoading());

        final result = await BannerRemote.getBanners();

        emit(BannerSuccess(bannerResponse: result));
      }
    });
  }
}

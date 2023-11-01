import 'package:exam_app/model/bannerResponseModel.dart';
import 'package:exam_app/widget/bannerListWidget.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/datasource/bannerRemoteDataSource.dart';

enum bannerStatus{initial, loading, succes, error}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final BannerRemote = bannerRemote();
  BannerResponse? bannerResponse;
  bannerStatus BannerStatus = bannerStatus.initial;

  @override
  void initState(){
    getBanner();
    super.initState();
  }
  void getBanner()async{
    BannerStatus = bannerStatus.loading;
    setState(() {});

    bannerResponse = await BannerRemote.getBanners();
    BannerStatus = bannerStatus.succes;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BannerResponse == null
          ?const Center(child: CircularProgressIndicator(),)

      :bannerListWidget(
          bannerList: bannerResponse?.data??[],
      ),
    );
  }
}

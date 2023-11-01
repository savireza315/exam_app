import 'package:exam_app/model/bannerResponseModel.dart';
import 'package:flutter/material.dart';

class bannerListWidget extends StatelessWidget {
  final List<bannerData>bannerList;
  const bannerListWidget({super.key, required this.bannerList});
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
        itemCount: bannerList.length,
        itemBuilder: (context, index){
          final banner = bannerList[index];

          return Text(banner.eventTitle??'No Title');
        }
    );
  }
}

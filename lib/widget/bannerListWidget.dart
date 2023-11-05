import 'package:exam_app/model/bannerResponseModel.dart';
import 'package:flutter/material.dart';

class bannerListWidget extends StatelessWidget {
  final List<bannerData>bannerList;
  const bannerListWidget({super.key, required this.bannerList});
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 146,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          separatorBuilder: (context,index) => const SizedBox(width: 29,) ,
          itemBuilder: (context, index){
            final banner = bannerList[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 146,
                width: 284,
                child: Image.network(banner.eventImage??''),
              ),
            );
          }
      ),
    );
  }
}

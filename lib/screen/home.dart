import 'package:exam_app/model/bannerResponseModel.dart';
import 'package:exam_app/widget/bannerListWidget.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/datasource/bannerRemoteDataSource.dart';
import 'package:lottie/lottie.dart';

enum bannerStatus { initial, loading, succes, error }

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
  void initState() {
    getBanner();
    super.initState();
  }

  void getBanner() async {
    BannerStatus = bannerStatus.loading;
    setState(() {});

    bannerResponse = await BannerRemote.getBanners();
    BannerStatus = bannerStatus.succes;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo User',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Selamat Datang',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://pbs.twimg.com/profile_images/1259734667214774273/pIRPG78R_400x400.jpg"),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.centerLeft,
                height: 137,
                width: 700,
                decoration: BoxDecoration(
                  color: Color(0xffd688f2),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: const Text('\t\t\t\t\tIngin Menjadi Juara Kelas?\n\t\t\t\t\tYuk Kerjakan Latihan Soal\n\t\t\t\t\tMau Latihan Apa Hri Ini?', style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    Lottie.asset('assets/juara2.json'),
                  ],
                ),
              ),
              BannerResponse == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : bannerListWidget(
                      bannerList: bannerResponse?.data ?? [],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

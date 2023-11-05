import 'package:exam_app/bloc/banner_bloc/banner_bloc.dart';
import 'package:exam_app/bloc/course_bloc/course_bloc.dart';
import 'package:exam_app/datasource/courseRemoteDataSource.dart';
import 'package:exam_app/screen/all_course_list_screen.dart';
import 'package:exam_app/widget/bannerListWidget.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/datasource/bannerRemoteDataSource.dart';
import 'package:lottie/lottie.dart';
import 'package:exam_app/widget/courseListWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum bannerStatus { initial, loading, succes, error }

class home extends StatelessWidget {
   home({Key? key}) : super(key: key);

  final courseBloc = CourseBloc(CourseRemote: courseRemote());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          BannerBloc(BannerRemote: bannerRemote()
          )
            ..add(GetBannerListEvent()),
        ),
        BlocProvider(
          create: (context) =>
              courseBloc..add(GetCourseListEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
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
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1259734667214774273/pIRPG78R_400x400.jpg"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    height: 137,
                    decoration: BoxDecoration(
                        color: Color(0xffd688f2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: const Text(
                            '\t\t\t\t\tIngin Menjadi Juara Kelas?\n\t\t\t\t\tYuk Kerjakan Latihan Soal\n\t\t\t\t\tMau Latihan Apa Hri Ini?',
                            style: TextStyle(
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
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pilih Pelajaran', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AllCouurseListScreen(courseBloc: courseBloc,)));
                        },
                        child: Text('Lihat Semua'),
                      )
                    ],
                  ),
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if(state is CourseFailed){
                        return Center(child: Text(state.message ?? ''));
                      }
                      if(state is CourseSucces) {
                        return CourseListWidget(
                            courseList: state.courseResponse.data ?? []);
                      }
                      return const Center (child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(height: 25),
                  Text('Terbaru', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(height: 27),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerFailed) {
                        return Center(child: Text(state.message ?? ''));
                      } else if (state is BannerSuccess) {
                        return bannerListWidget(
                          bannerList: state.bannerResponse?.data ?? [],
                        );
                      }
                      return const Center (child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

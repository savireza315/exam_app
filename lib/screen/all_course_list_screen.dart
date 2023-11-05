import 'package:exam_app/datasource/courseRemoteDataSource.dart';
import 'package:exam_app/widget/courseListWidget.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/bloc/course_bloc/course_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCouurseListScreen extends StatelessWidget {
  final CourseBloc courseBloc;

  const AllCouurseListScreen({super.key, required this.courseBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create : (context)=>courseBloc,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Pilih Pelajaran'),
          backgroundColor: const Color(0xffd688f2),
          leading: IconButton(
              onPressed : ()=>Navigator.pop(context),
            icon:const Icon(Icons.arrow_back_ios) ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22, top: 12),
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseFailed) {
                return Center(child: Text(state.message ?? ''));
              }
              if (state is CourseSucces) {
                return CourseListWidget(

                    courseList: state.courseResponse.data ?? [],
                isHomeScreen:false,
                );
              }
              return const Center (child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

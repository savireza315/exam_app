import 'package:exam_app/screen/all_exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/model/courseResponseModel.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;
  final bool isHomeScreen;

  const CourseListWidget({super.key, required this.courseList, this.isHomeScreen=true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: isHomeScreen? 3:courseList.length,
      physics: isHomeScreen?NeverScrollableScrollPhysics():BouncingScrollPhysics(),
      separatorBuilder: (context,index)=>const SizedBox(height: 15),
      itemBuilder: (context, index){
        final course = courseList[index];

        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AllExerciseScreen(
              courseId: course.courseId??'' ,
             majorName : course.majorName??'',
            )
            )
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
              height: 96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F7F8),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.network(course.urlCover??'',
                      width: 28,
                      height: 28,
                      errorBuilder: (context,error, stackTrace)=>Container(
                        width: 28,
                        height: 28,
                        color: Colors.redAccent,
                      ) ,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.majorName??'No Course Name'),
                        Text('${course.jumlahDone}/${course.jumlahMateri} Paket Latihan Soal'),
                        SizedBox(width: 4),
                        LinearProgressIndicator(value: 0.5)
                      ],
                    ),
                  ),
                ],
              )
          ),
        );
      },
    );
  }
}

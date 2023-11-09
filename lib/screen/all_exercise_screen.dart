import 'package:exam_app/bloc/exercise_bloc/exercise_bloc.dart';
import 'package:exam_app/datasource/courseRemoteDataSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllExerciseScreen extends StatelessWidget {
  final String courseId;
  final String majorName;
  const AllExerciseScreen({super.key, required this.courseId, required this.majorName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ExerciseBloc(
        CourseRemote: courseRemote(),
      )
        ..add(GetExerciseListEvent(courseId: courseId )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(majorName),
          backgroundColor: const Color(0xffd688f2),
          leading: IconButton(
              onPressed : ()=>Navigator.pop(context),
              icon:const Icon(Icons.arrow_back_ios) ),
        ),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if(state is ExerciseSucces) {
              return GridView.builder(
                itemCount: state.exerciseResponse.data?.length,
                  itemBuilder: (context, index) {
                    final exercise = state.exerciseResponse.data?[index];
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.grey[350] ,
                                child: Image.network(exercise?.icon??'', height: 16,)),
                             Text(exercise?.exerciseTitle??'No title'),
                            Text('${exercise?.jumlahDone}/${exercise?.jumlahSoal}'),


                          ],
                        ),
                      ),
                    );
                  },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4
                ),
              );
            }
            return const Center(child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

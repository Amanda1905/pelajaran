import 'package:cleanarsitek/data/datasource/course/course_remote_datasource.dart';
import 'package:cleanarsitek/data/model/course/course_response.dart';
import 'package:flutter/material.dart';

class SubjectModel{
  final String subjectName;
  final int excercies;
  final int excerciesDone;

  const SubjectModel({
    required this.excercies, 
    required this.excerciesDone, 
    required this.subjectName
    });
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final CourseRemoteDatasource remoteDatasource=CourseRemoteDatasource();
CourseResponseModel courseResponse = CourseResponseModel();

void getCourses()async{
  final result = await remoteDatasource.getCourse();
  courseResponse = result;
}

@override
void initState() {
  getCourses();
  super.initState();
}

  final List<SubjectModel> homeSubjects = [
    const SubjectModel(
      excercies: 50, 
      excerciesDone: 0, 
      subjectName: 'Matematika',
      ),
      const SubjectModel(
      excercies: 50, 
      excerciesDone: 0, 
      subjectName: 'Fisika',
      ),
      const SubjectModel(
      excercies: 50, 
      excerciesDone: 0, 
      subjectName: 'Kimia',
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, atop', style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:  12,
                ),
                ),
                Text('selamat datang', style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize:  12,
                ),
                ),
              ],
            ),
            CircleAvatar(
              foregroundImage: NetworkImage(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-icons.com%2Fid%2Ficon%2Fpria-orang-avatar%2F230017&psig=AOvVaw0Amh0vo36Kev0xlsSYdCQB&ust=1709713671541000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCLi_PZ3IQDFQAAAAAdAAAAABAb',),
            ),
        ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 28,top: 32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'mau kerjain soal apa hari ini?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/login.png',
                    width: 200,
                    ),
                  ),
                  ],
                  ),
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pilihan Pelajaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  ),
                  ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: courseResponse.data?.length??0,
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) { 
              final course = courseResponse.data?[index];

              return Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(course?.courseName ?? ''),
                            Text(
                              '${course?.jumlahDone ?? 0} / ${course?.jumlahMateri ?? 0} Latihan soal'),
                            LinearProgressIndicator(
                              value: (course?.jumlahDone ?? 0) == 0
                              ? 0
                              : ((course?.jumlahMateri ?? 0) /
                                (course?.jumlahDone ?? 0)),
                            ),
                          ],
                         ),
                       ),
                    ],
                  ),
                ),
              );
            },
          )
          ],
        ),
      ),
    );
  }
}
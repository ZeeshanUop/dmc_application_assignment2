import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late int Urdu, Eng, Maths, Gk, Science;
  String percentage = 'Percentage';
  String obtainmarks = 'Obtainmarks';
  String grade = 'Grade';
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DmcApplication')),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Urdu',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              validator: (String? text) {
                if (text == null || text.isEmpty || text.length > 3) {
                  print('Please provide valid number');
                }
                Urdu = int.parse(text!);
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'English',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              validator: (text) {
                if (text == null || text.isEmpty || text.length > 3) {
                  print('Please provide valid number');
                }
                Eng = int.parse(text!);
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Science',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              validator: (text) {
                if (text == null || text.isEmpty || text.length > 3) {
                  print('Please provide valid number');
                }
                Science = int.parse(text!);
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Maths',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              validator: (text) {
                if (text == null || text.isEmpty || text.length > 3) {
                  print('Please provide valid number');
                }
                Maths = int.parse(text!);
                return null;
              },
            ),
            TextFormField(
                decoration: InputDecoration(
                  hintText: 'Gk',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (String? text) {
                  if (text == null || text.isEmpty || text.length > 3) {
                    print('Please provide valid number');
                  }
                  Gk = int.parse(text!);
                  return null;
                }),
            ElevatedButton(
                onPressed: () {
                  formkey.currentState!.reset();
                  obtainmarks = '';
                  percentage = '';
                  grade = '';
                },
                child: Text('reset')),
            ElevatedButton(
                onPressed: () {
                  formkey.currentState!.validate();
                  int obtainmark = Eng + Urdu + Maths + Gk + Science;
                  double Percentage = (obtainmark / 500) * 100;
                  setState(() {
                    obtainmarks = 'ObtainedMarks $obtainmark';
                    percentage = 'Percentage $Percentage';
                    grade = gradecheck(Percentage);
                  });
                },
                child: Text('calculate')),
            Text(obtainmarks),
            Text(percentage),
            Text('Grade  $grade')
          ],
        ),
      ),
    );
  }

  String gradecheck(double percentage) {
    if (percentage >= 85)
      return 'A';
    else if (percentage >= 70)
      return 'B';
    else if (percentage >= 60)
      return 'C';
    else if (percentage >= 50)
      return 'D';
    else
      return 'fail';
  }
}

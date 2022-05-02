import 'package:flutter/material.dart';
import 'package:todo_list/views/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class completedTasks extends StatelessWidget {
  const completedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/undraw_complete.svg',
            width: 250,
          ),
          const SizedBox(height: 30),
          const Text('No tasks complited'),
        ],
      ),
    ));
  }
}

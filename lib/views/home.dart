import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/data.dart';
import 'package:todo_list/data/repo/repository.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/views/edit.dart';
import 'package:todo_list/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_list/tabs/completedTab.dart';
import 'package:todo_list/tabs/homeTab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  final ValueNotifier<String> searchKeywordNotifier = ValueNotifier('');

  int _currentIndex = 0;
  final tabs = [
    homeTab(),
    completedTasks(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('To-DO'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TaskEditScreen(
                    task: TaskData(),
                  ),
                ),
              );
            },
            label: const Icon(FontAwesomeIcons.plus)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          iconSize: 25,
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check_rounded),
              label: 'Completed',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: tabs[_currentIndex]);
  }
}



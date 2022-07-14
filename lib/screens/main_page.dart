import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sciolism_app/screens/profile/profileScreen.dart';

import 'exam/quiz_page.dart';
import 'statistic/statistic_page.dart';
import 'theory/theory_page.dart';

class MainPage extends StatefulWidget {
  String uid;
  MainPage({Key? key, required this.uid}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState(uid);
}

class _MainPageState extends State<MainPage> {
  String uid = '';

  _MainPageState(uid);
  User? user = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      TheoryPage(uid: uid),
      QuizPage(uid: uid),
      StatisticScreen(uid: uid),
      profileManagementScreen(
        uid: uid,
      ),
    ];
    return Scaffold(
      //appBar: AppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Lý Thuyết',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Luyện Đề',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            label: 'Thống Kê',
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.people), label: 'Hồ Sơ')
        ],

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

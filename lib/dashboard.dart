import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_kepegawaian/_pages/calender.dart';
import 'package:aplikasi_kepegawaian/_pages/home.dart';
import 'package:aplikasi_kepegawaian/_pages/profil.dart';
import 'package:aplikasi_kepegawaian/login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Profil(),
    Calender(),
  ];

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.amber, Colors.blue]),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "DASHBOARD",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Get.defaultDialog(
                title: "Ingin Keluar Aplikasi",
                content: Container(),
                textConfirm: "Ya",
                textCancel: "Tidak",
                onConfirm: () {
                  Get.offAll(Login());
                },
                onCancel: () {
                  print("Tidak");
                },
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onitemTapped,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calender",
          ),
        ],
      ),
    );
  }
}

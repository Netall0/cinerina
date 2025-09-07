// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const AppShell({super.key, required this.statefulNavigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulNavigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statefulNavigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'title'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'title')
        ],
        onTap: (index) {
          statefulNavigationShell.goBranch(
            index,
            initialLocation: index == statefulNavigationShell.currentIndex
          );
        },
      ),
    );
  }
}

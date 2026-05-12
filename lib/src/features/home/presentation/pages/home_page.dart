import 'package:flutter/material.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/home/presentation/pages/home_tab_page.dart';
import 'package:iquiz/src/features/home/presentation/pages/profile_tab_page.dart';
import 'package:iquiz/src/shared/domain/utils/get_current_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final currentIndexNotifier = ValueNotifier(0);
  late TabController _tabController;
  ValueNotifier<User?> userNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userNotifier.value = await GetCurrentUser.execute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: currentIndexNotifier,
          builder: (context, currentIndex, child) {
            return TabBarView(
              controller: _tabController,
              children: [
                HomeTabPage(userNotifier: userNotifier),
                ProfileTabPage(userNotifier: userNotifier),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndexNotifier,
        builder: (context, currentIndex, child) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: .2,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) {
                currentIndexNotifier.value = value;
                _tabController.index = value;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

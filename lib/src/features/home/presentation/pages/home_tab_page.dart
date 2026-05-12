import 'package:flutter/material.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';

class HomeTabPage extends StatefulWidget {
  final ValueNotifier<User?> userNotifier;
  const HomeTabPage({super.key, required this.userNotifier});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: widget.userNotifier,
              builder: (context, user, child) {
                return Text(
                  "Selamat Datang,\n${user?.fullName ?? "-"}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),

            //
          ],
        ),
      ),
    );
  }
}

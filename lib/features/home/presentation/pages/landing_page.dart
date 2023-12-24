import 'package:flutter/material.dart';
import 'package:whatsapp_manager/config/theme/app_theme.dart';
import 'package:whatsapp_manager/features/home/presentation/pages/chat_fragment.dart';
import 'package:whatsapp_manager/features/home/presentation/pages/groups_fragment.dart';
import 'package:whatsapp_manager/features/home/presentation/pages/scheduled_fragment.dart';
import 'package:whatsapp_manager/features/home/presentation/widgets/appbar.dart';

class LandingPage extends StatelessWidget {
  static const String routeName = 'landingPage';
  static const String routePath = '/landingPage';
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Container(
        color: appPrimaryColor,
        child: const DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                dividerHeight: 1,
                enableFeedback: true,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(child: Text("CHATS")),
                  Tab(child: Text("GROUP")),
                  Tab(child: Text("SCHEDULED")),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  ChatFragement(),
                  GroupsFragement(),
                  ScheduledFragement(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

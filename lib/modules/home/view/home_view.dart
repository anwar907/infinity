import 'package:flutter/material.dart';
import 'package:infinity/modules/home/view/widgets/list_image_widget.dart';

import 'widgets/list_content_widget.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'List Image'),
  Tab(text: 'List Content'),
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Builder(builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('I N F I N I T Y'),
                bottom: const TabBar(tabs: tabs),
              ),
              body: const TabBarView(
                  children: [ListImageWidget(), ListContentWidget()]));
        }));
  }
}

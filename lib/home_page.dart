import 'package:flutter/material.dart';

import 'material_design_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'Tab1'),
    const Tab(text: 'Tab2'),
    const Tab(text: 'Tab3'),
  ];

  final _iconTabs = [
    const Tab(icon: Icon(Icons.home)),
    const Tab(icon: Icon(Icons.search)),
    const Tab(icon: Icon(Icons.settings)),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedColor,
        title: const Text("Custom Tab Bars"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ///Default Tabbar with full width tabbar indicator
            TabBar(
              controller: _tabController,
              tabs: _tabs,
              labelColor: _selectedColor,
              indicatorColor: _selectedColor,
              unselectedLabelColor: _unselectedColor,
            ),

            ///Default Tabbar with indicator width of the label
            TabBar(
              controller: _tabController,
              tabs: _tabs,
              labelColor: _selectedColor,
              indicatorColor: _selectedColor,
              unselectedLabelColor: _unselectedColor,
              indicatorSize: TabBarIndicatorSize.label,
            ),

            /// Custom Material Design tabbar used in google's products
            TabBar(
              controller: _tabController,
              labelColor: _selectedColor,
              unselectedLabelColor: _unselectedColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: MaterialDesignIndicator(
                  indicatorHeight: 4, indicatorColor: _selectedColor),
              tabs: _tabs,
            ),

            /// Custom Tabbar with solid selected bg and transparent tabbar bg
            Container(
              height: kToolbarHeight - 8.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: _selectedColor),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: _tabs,
              ),
            ),

            /// Custom Tabbar with solid selected bg and transparent tabbar bg
            Container(
              height: kToolbarHeight + 8.0,
              padding:
                  const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              decoration: BoxDecoration(
                color: _selectedColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    color: Colors.white),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: _tabs,
              ),
            ),

            /// Custom Tabbar with transparent selected bg and solid selected text
            TabBar(
              controller: _tabController,
              tabs: _iconTabs,
              unselectedLabelColor: Colors.black,
              labelColor: _selectedColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                color: _selectedColor.withOpacity(0.2),
              ),
            ),

            TabBar(
              controller: _tabController,
              tabs: _tabs,
              unselectedLabelColor: Colors.black,
              labelColor: _selectedColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                color: _selectedColor.withOpacity(0.2),
              ),
            ),
          ]
              .map((item) => Column(
                    /// Added a divider after each item to let the tabbars have room to breathe
                    children: [
                      item,
                      const Divider(
                        color: Colors.transparent,
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'trip_list_screen.dart';
import 'favorites_screen.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Photos'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Photos'),
            Tab(text: 'Favorites'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TripListScreen(),
          FavoritesScreen(),
        ],
      ),
    );
  }
}

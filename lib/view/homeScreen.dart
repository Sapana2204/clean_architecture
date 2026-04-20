import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 2});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    Center(child: Text("Sales Screen")),
    Center(child: Text("Purchase Screen")),
    Center(child: Text("Dashboard Screen")),
    Center(child: Text("Payment Screen")),
    Center(child: Text("Receipt Screen")),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () => _showQuickActions(),
          )
        ],
      ),

      drawer: _buildDrawer(),

      body: _pages[_currentIndex],

      bottomNavigationBar: _bottomBar(),
    );
  }

  // ---------------- DRAWER ----------------
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Firm Name"),
            accountEmail: Text("Role Name"),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () {
              setState(() => _currentIndex = 2);
              Navigator.pop(context);
            },
          ),

          ExpansionTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Purchase"),
            children: [
              ListTile(
                title: const Text("Purchase"),
                onTap: () {
                  setState(() => _currentIndex = 1);
                  Navigator.pop(context);
                },
              ),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.point_of_sale),
            title: const Text("Sales"),
            children: [
              ListTile(
                title: const Text("Sales"),
                onTap: () {
                  setState(() => _currentIndex = 0);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- QUICK ACTIONS ----------------
  void _showQuickActions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        children: const [
          Icon(Icons.shopping_cart),
          Icon(Icons.point_of_sale),
          Icon(Icons.bar_chart),
        ],
      ),
    );
  }

  // ---------------- BOTTOM BAR ----------------
  Widget _bottomBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Sales"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Purchase"),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Payment"),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Receipt"),
      ],
    );
  }
}
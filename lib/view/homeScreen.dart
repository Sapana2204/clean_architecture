import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/routes/app_colors.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    DashboardScreen(), // ✅ index 0
    Center(child: Text("Tickets Screen")),
    Center(child: Text("Alerts Screen")),
    Center(child: Text("Profile Screen")),
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
        title: const Text("flowupS"),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.grid_view),
        //     onPressed: () => _showQuickActions(),
        //   )
        // ],
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
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

            /// 🔳 BACKGROUND BAR
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                /// LEFT + RIGHT ITEMS
                child: Row(
                  children: [
                    /// LEFT
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _modernNavItem(Icons.dashboard, "Dashboard", 0),
                          _modernNavItem(Icons.airplane_ticket, "Tickets", 1),
                        ],
                      ),
                    ),

                    const SizedBox(width: 60),

                    /// RIGHT
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _modernNavItem(Icons.add_alert, "Alerts", 2),
                          _modernNavItem(Icons.person, "Profile", 3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔵 CENTER BUTTON
            // Positioned(
            //   top: -15,
            //   child: GestureDetector(
            //     onTap: () {
            //       setState(() => _currentIndex = 2);
            //     },
            //     child: Container(
            //       height: 60,
            //       width: 60,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         gradient: LinearGradient(
            //           colors: [
            //             primary,
            //             primary.withOpacity(0.8),
            //           ],
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.blue.withOpacity(0.4),
            //             blurRadius: 12,
            //             offset: const Offset(0, 5),
            //           ),
            //         ],
            //       ),
            //       child: const Icon(
            //         Icons.grid_view_rounded,
            //         color: Colors.white,
            //         size: 26,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _modernNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _currentIndex = index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? primary.withOpacity(0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? primary : Colors.grey,
                size: 22,
              ),
              const SizedBox(height: 3),
              Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? primary : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
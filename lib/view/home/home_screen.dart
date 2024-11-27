import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    // const ProductPage(),
    // const CartPage(),
    // const ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            // Main Content
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _pages,
            ),

            // Custom Navigation
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(0, Icons.home_rounded, 'Home'),
                    _buildNavItem(1, Icons.shopping_cart_rounded, 'Cart'),
                    _buildNavItem(2, Icons.person_rounded, 'Profile'),
                  ],
                ),
              ),
            ),

            // Top Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getPageTitle(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getPageSubtitle(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getActionIcon(),
                        size: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentPage == index;
    return GestureDetector(
      onTap: () => _navigationTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? Colors.black.withOpacity(0.05) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
              size: 26,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getPageTitle() {
    switch (_currentPage) {
      case 0:
        return 'Discover';
      case 1:
        return 'My Cart';
      case 2:
        return 'Profile';
      default:
        return '';
    }
  }

  String _getPageSubtitle() {
    switch (_currentPage) {
      case 0:
        return 'Find your favorite products';
      case 1:
        return 'Review your items';
      case 2:
        return 'Personal information';
      default:
        return '';
    }
  }

  IconData _getActionIcon() {
    switch (_currentPage) {
      case 0:
        return Icons.search_rounded;
      case 1:
        return Icons.delete_outline_rounded;
      case 2:
        return Icons.settings_rounded;
      default:
        return Icons.search_rounded;
    }
  }
}
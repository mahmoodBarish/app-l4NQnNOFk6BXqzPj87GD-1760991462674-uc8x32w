import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MessangerChats extends StatelessWidget {
  const MessangerChats({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> storiesData = [
      {'image': 'assets/images/287_62.png', 'name': 'Joshua', 'isOnline': true},
      {'image': 'assets/images/287_67.png', 'name': 'Martin', 'isOnline': true},
      {'image': 'assets/images/287_72.png', 'name': 'Karen', 'isOnline': true},
      {'image': 'assets/images/287_77.png', 'name': 'Martha', 'isOnline': true},
      {'image': 'assets/images/287_10.png', 'name': 'Steven', 'isOnline': false},
    ];

    final List<Map<String, dynamic>> chatData = [
      {
        'image': 'assets/images/287_10.png',
        'name': 'Martin Randolph',
        'message': 'You: What’s man! · 9:40 AM',
        'hasRead': true
      },
      {
        'image': 'assets/images/287_19.png',
        'name': 'Andrew Parker',
        'message': 'You: Ok, thanks! · 9:25 AM',
        'hasRead': true
      },
      {
        'image': 'assets/images/287_29.png',
        'name': 'Karen Castillo',
        'message': 'You: Ok, See you in To… · Fri',
        'hasRead': true
      },
      {
        'image': 'assets/images/287_44.png',
        'name': 'Maisy Humphrey',
        'message': 'Have a good day, Maisy! · Fri',
        'hasRead': true
      },
      {
        'image': 'assets/images/287_39.png',
        'name': 'Joshua Lawrence',
        'message': 'The business plan loo… · Thu',
        'hasRead': false
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 156),
        children: [
          _buildStoriesSection(storiesData),
          ...chatData.map((chat) => _buildChatItem(
                context,
                image: chat['image'],
                name: chat['name'],
                message: chat['message'],
                hasRead: chat['hasRead'],
              )),
          _buildAdItem(context),
          _buildChatItem(
            context,
            image: 'assets/images/287_5.png',
            name: 'Maximillian Jacobson',
            message: 'Messenger UI · Thu',
            hasRead: false,
          ),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(156),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Colors.white.withOpacity(0.75),
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/287_84.png'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Chats',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        _buildAppBarIcon(Icons.camera_alt_outlined),
                        const SizedBox(width: 16),
                        _buildAppBarIcon(Icons.edit),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.sourceSansPro(
                        color: const Color(0xFF8E8E93),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: const Icon(Icons.search,
                          color: Color(0xFF8E8E93), size: 20),
                      filled: true,
                      fillColor: const Color(0xFF767680).withOpacity(0.12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black, size: 22),
    );
  }

  Widget _buildStoriesSection(List<Map<String, dynamic>> storiesData) {
    return Container(
      height: 106,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: storiesData.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildYourStoryItem();
          }
          final story = storiesData[index - 1];
          return _buildStoryItem(
              story['image'], story['name'], story['isOnline']);
        },
      ),
    );
  }

  Widget _buildYourStoryItem() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.black, size: 28),
            ),
            const SizedBox(height: 7),
            Text(
              'Your story',
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                fontSize: 13,
                color: Colors.black.withOpacity(0.35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryItem(String image, String name, bool isOnline) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(image),
                ),
                if (isOnline)
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5AC845),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                fontSize: 13,
                color: Colors.black.withOpacity(0.35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(BuildContext context,
      {required String image,
      required String name,
      required String message,
      required bool hasRead}) {
    return InkWell(
      onTap: () => context.go('/messanger_swipe_actions'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (hasRead)
              Icon(
                Icons.check_circle_outline,
                color: Colors.grey.withOpacity(0.5),
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdItem(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/287_108.png'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Pixsellz',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'Ad',
                          style: GoogleFonts.sourceSansPro(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Make design process easier…',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'View More',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0084FD),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/287_115.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            border: Border(
              top: BorderSide(color: Colors.grey[300]!, width: 0.5),
            ),
          ),
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey[500],
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.people_alt_outlined),
                      Positioned(
                        top: -4,
                        right: -10,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0x295AC845),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '2',
                            style: GoogleFonts.sourceSansPro(
                              color: const Color(0xFF5AC845),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: 'People',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  label: 'Discover',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

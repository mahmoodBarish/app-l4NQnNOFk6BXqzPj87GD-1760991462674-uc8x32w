import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessangerSwipeActions extends StatelessWidget {
  const MessangerSwipeActions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stories = [
      {
        'image': 'assets/images/287_264.png',
        'name': 'Joshua',
        'isOnline': true
      },
      {
        'image': 'assets/images/287_269.png',
        'name': 'Martin',
        'isOnline': true
      },
      {
        'image': 'assets/images/287_274.png',
        'name': 'Karen',
        'isOnline': true
      },
      {
        'image': 'assets/images/287_279.png',
        'name': 'Martha',
        'isOnline': true
      },
      {
        'image': 'assets/images/287_251.png',
        'name': 'John',
        'isOnline': false
      },
      {
        'image': 'assets/images/287_242.png',
        'name': 'Chris',
        'isOnline': false
      },
    ];

    final List<Map<String, dynamic>> chats = [
      {
        'image': 'assets/images/287_242.png',
        'name': 'Martin Randolph',
        'message': 'You: What’s man! · 9:40 AM',
        'read': true,
      },
      {
        'image': 'assets/images/287_207.png',
        'name': 'Andrew Parker',
        'message': 'You: Ok, thanks! · 9:25 AM',
        'read': true,
      },
      {
        'image': 'assets/images/287_217.png',
        'name': 'Maisy Humphrey',
        'message': 'Have a good day, Jacob! · Fri',
        'read': true,
      },
      {
        'image': 'assets/images/287_227.png',
        'name': 'Karen Castillo',
        'message': 'You: Ok, See you in To… · Fri',
        'read': true,
      },
      {
        'image': 'assets/images/287_251.png',
        'name': 'Joshua Lawrence',
        'message': 'The business plan loo… · Thu',
        'read': false,
      },
      {
        'image': 'assets/images/287_310.png',
        'name': 'Pixsellz',
        'message': 'Make design process easier…',
        'isAd': true,
        'adImage': 'assets/images/287_317.png',
      },
      {
        'image': 'assets/images/287_237.png',
        'name': 'Maximillian Jacobson',
        'message': 'Messenger UI · Thu',
        'read': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildStories(stories),
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return _buildChatItem(context, chats[index]);
              },
              separatorBuilder: (context, index) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/287_286.png'),
              ),
              const SizedBox(width: 16),
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
              const SizedBox(width: 8),
              _buildAppBarIcon(Icons.edit),
            ],
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

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.sourceSansPro(
            color: const Color(0xFF8E8E93),
            fontSize: 17,
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8E8E93)),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildStories(List<Map<String, dynamic>> stories) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildStoryItem(
              name: 'Your story',
              isAdd: true,
            );
          }
          final story = stories[index - 1];
          return _buildStoryItem(
            name: story['name'],
            image: story['image'],
            isOnline: story['isOnline'],
          );
        },
      ),
    );
  }

  Widget _buildStoryItem({
    required String name,
    String? image,
    bool isAdd = false,
    bool isOnline = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.black.withOpacity(0.04),
                  backgroundImage: isAdd ? null : AssetImage(image!),
                  child: isAdd ? const Icon(Icons.add, color: Colors.black, size: 28) : null,
                ),
                if (isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5AD439),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
  
  Widget _buildChatItem(BuildContext context, Map<String, dynamic> chat) {
  return Slidable(
    key: ValueKey(chat['name']),
    startActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: const Color(0xFF007AFF),
          foregroundColor: Colors.white,
          icon: Icons.camera_alt,
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black,
          icon: Icons.videocam,
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black,
          icon: Icons.call,
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black,
          icon: Icons.menu,
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black,
          icon: Icons.notifications,
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: const Color(0xFFFE294D),
          foregroundColor: Colors.white,
          icon: Icons.delete,
        ),
      ],
    ),
    child: InkWell(
      onTap: () => context.go('/messanger_chats'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(chat['image']),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['name'],
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      if (chat['read'] == true)
                        const Icon(Icons.check_circle, color: Color(0xFFC2C5CC), size: 16),
                      if (chat['isAd'] == true)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            'Ad',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    chat['message'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: chat['read'] == false ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                   if (chat['isAd'] == true)
                    Text(
                      "View More",
                       style: GoogleFonts.sourceSansPro(
                        fontSize: 14,
                        color: const Color(0xFF0084FE),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ],
              ),
            ),
             if (chat['adImage'] != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    chat['adImage'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.people),
              Positioned(
                top: -2,
                right: -8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5AD439).withOpacity(0.16),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF5AD439),
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
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: const Color(0xFFA4AAB8),
      onTap: (index) {},
    );
  }
}
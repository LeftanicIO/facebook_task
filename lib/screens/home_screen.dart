import 'package:facebook_task2/utils/button_icon.dart';
import 'package:facebook_task2/utils/colors.dart';
import 'package:facebook_task2/utils/story_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // tracks which icon is currently activ
  final List<String> icons = [
    'assets/icons/home.png',
    'assets/icons/video.png',
    'assets/icons/store.png',
    'assets/icons/profile.png',
    'assets/icons/bell.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Facebook',
          style: GoogleFonts.inter(
            color: AppColors.blue,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          ButtonIcon(name: 'plus', choice: AppColors.black),
          ButtonIcon(name: 'search', choice: AppColors.black),
          ButtonIcon(name: 'messenger', choice: AppColors.black),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Build the 5 nav icons from the list, using each one's index
                  for (int i = 0; i < icons.length; i++)
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          selectedIndex = i; // remember which icon was tapped
                        });
                      },
                      child: ImageIcon(
                        AssetImage(icons[i]),
                        color: selectedIndex == i
                            ? AppColors
                                  .blue // this one is selected
                            : AppColors.gray, // all others stay gray
                        size: 35,
                      ),
                    ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/profile_image.avif',
                      ),
                      radius: 16,
                    ),
                  ),
                ],
              ),
              const Divider(height: 1),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 21,
                      backgroundImage: AssetImage(
                        'assets/images/profile_image.avif',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                AppColors.black, 
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'What’s in Your Mind?',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder
                                .none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    const ImageIcon(
                      AssetImage('assets/icons/photos.png'),
                      color: Color(0xFF0DE571),
                      size: 28,
                    ),
                  ],
                ),
              ),
              Container(height: 3, color: AppColors.gray),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.3,
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior:
                                Clip.none, 
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  'assets/images/profile_image.avif',
                                  width: size.width * 0.28,
                                  height: size.height * 0.125,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: -19,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: const BoxDecoration(
                                        color: AppColors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ), 
                          const Text(
                            'Create a\nStory',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StoryCard(pfpName: 'story_1_pfp', storyName: 'messi_story'),
                    SizedBox(width: 8),
                    StoryCard(
                      pfpName: 'story_2_pfp',
                      storyName: 'lamine_story',
                    ),
                    SizedBox(width: 8),
                    StoryCard(pfpName: 'story_1_pfp', storyName: 'messi_story'),
                    SizedBox(width: 8),
                    StoryCard(
                      pfpName: 'story_2_pfp',
                      storyName: 'lamine_story',
                    ),
                    SizedBox(width: 8),
                    StoryCard(pfpName: 'story_1_pfp', storyName: 'messi_story'),
                  ],
                ),
              ),
              Container(height: 3, color: AppColors.gray),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/story_1_pfp.png',
                      ),
                      radius: 26,
                    ),
                    SizedBox(width: 6),
                    Column(
                      children: [
                        Text(
                          'Route',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text('8h.'),
                            SizedBox(width: 4),
                            Icon(Icons.public, size: 12),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz, size: 30),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/route_post.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                cacheWidth: 800,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  ButtonIcon(name: 'like', choice: AppColors.black),
                  ButtonIcon(name: 'comment', choice: AppColors.black),
                  ButtonIcon(name: 'send', choice: AppColors.black),
                  Spacer(),
                  ButtonIcon(name: 'save', choice: AppColors.black),
                  

                ],
              ),
              
              Container(height: 3, color: AppColors.gray),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/story_1_pfp.png',
                      ),
                      radius: 26,
                    ),
                    SizedBox(width: 6),
                    Column(
                      children: [
                        Text(
                          'Route',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text('8h.'),
                            SizedBox(width: 4),
                            Icon(Icons.public, size: 12),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz, size: 30),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/route_post.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                cacheWidth: 800,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  ButtonIcon(name: 'like', choice: AppColors.black),
                  ButtonIcon(name: 'comment', choice: AppColors.black),
                  ButtonIcon(name: 'send', choice: AppColors.black),
                  Spacer(),
                  ButtonIcon(name: 'save', choice: AppColors.black),
                  

                ],
              ),
              
              Container(height: 3, color: AppColors.gray),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/story_1_pfp.png',
                      ),
                      radius: 26,
                    ),
                    SizedBox(width: 6),
                    Column(
                      children: [
                        Text(
                          'Route',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text('8h.'),
                            SizedBox(width: 4),
                            Icon(Icons.public, size: 12),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz, size: 30),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/route_post.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
                cacheWidth: 800,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  ButtonIcon(name: 'like', choice: AppColors.black),
                  ButtonIcon(name: 'comment', choice: AppColors.black),
                  ButtonIcon(name: 'send', choice: AppColors.black),
                  Spacer(),
                  ButtonIcon(name: 'save', choice: AppColors.black),
                  

                ],
              ),
              
              Container(height: 3, color: AppColors.gray),
              
              
            ],
          
          ),
        ],
      ),
    );
  }
}

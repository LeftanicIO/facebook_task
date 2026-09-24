import 'package:facebook_task2/utils/colors.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String pfpName;
  final String storyName;
  const StoryCard({super.key, required this.pfpName, required this.storyName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/$storyName.png',
            width: size.width * 0.28,
            height: size.height * 0.189,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.all(
              2,
            ), 
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: AppColors.blue, width: 3), // the ring
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/$pfpName.png'),
            ),
          ),
        ),
      ],
    );
  }
}

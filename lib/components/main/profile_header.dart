import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String fullName;
  final String avatar;
  final String profession;

  const ProfileHeader({
    super.key,
    required this.fullName,
    required this.avatar,
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [buildAvatarImage(), buildTextInfo()],
      ),
    );
  }

  SizedBox buildAvatarImage() {
    return SizedBox(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(avatar),
      ),
    );
  }

  Padding buildTextInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fullName, style: TextStyle(fontSize: 24)),
          Text(profession, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

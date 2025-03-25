import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/main/profile_bio.dart';
import 'package:flutter_application_1/components/main/profile_button.dart';
import 'package:flutter_application_1/components/main/profile_header.dart';
import 'package:flutter_application_1/models/person.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const String githubUri = "https://github.com/synzr";

  late Person person;

  @override
  void initState() {
    super.initState();
    _setPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Профиль")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            fullName: person.getFullName(),
            avatar: person.getAvatar(),
            profession: person.getProfession(),
          ),
          ProfileBio(bio: person.getBio()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileButton(text: 'Открыть GitHub', onTap: _onGithubButtonTap),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileButton(text: 'Убрать аватарку', onTap: _onDeleteAvatarTap),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onDeleteAvatarTap() {
    setState(() {
      person = Person(
        name: person.getName(),
        surname: person.getSurname(),
        profession: person.getProfession(),
        bio: person.getBio()
      );
    });
  }

  void _onGithubButtonTap() async {
    var uri = Uri.parse(githubUri);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      log("can't open github page");
    }
  }

  void _setPerson() {
    person = Person(
      name: "Михаил",
      surname: "Серебряков",
      // NOTE: прямая ссылка на аватарку с GitHub
      avatar: "https://avatars.githubusercontent.com/u/126566943",
      profession: "Backend Developer",
      bio: "Человек с планеты Земля",
    );
  }
}

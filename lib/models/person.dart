class Person {
  String name;
  String? surname;
  String? avatar;
  String profession;
  String bio;

  Person({
    required this.name,
    this.surname,
    this.avatar,
    required this.profession,
    required this.bio,
  });

  String getName() {
    return name;
  }

  String? getSurname() {
    return surname;
  }

  String getFullName() {
    if (surname != null) {
      return "$name ${surname as String}";
    }
    return name;
  }

  String getAvatar() {
    if (avatar != null) {
      return avatar as String;
    }

    // NOTE: другого изображения с сети Интернета на памяти - нет
    return "https://schizophrenia.storage.yandexcloud.net/schizophrenia.jpg";
  }

  String getProfession() {
    return profession;
  }

  String getBio() {
    return bio;
  }
}

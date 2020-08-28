import 'package:flutter/material.dart';

class Contact {
  const Contact({
    @required this.avatar,
    @required this.name,
    this.nameIndexLetter,
  });

  final String avatar;
  final String name;
  final String nameIndexLetter;
}

class ContactsData {
  final List<Contact> contacts = [
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/63.jpg',
      name: 'aluka',
      nameIndexLetter: 'A',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/83.jpg',
      name: '阿毛',
      nameIndexLetter: 'A',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/22.jpg',
      name: 'Bob',
      nameIndexLetter: 'B',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/21.jpg',
      name: 'Beyond',
      nameIndexLetter: 'B',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/24.jpg',
      name: 'Cat',
      nameIndexLetter: 'C',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/26.jpg',
      name: 'Jerry',
      nameIndexLetter: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/27.jpg',
      name: 'Tom',
      nameIndexLetter: 'T',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/28.jpg',
      name: 'Shmily',
      nameIndexLetter: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/29.jpg',
      name: 'Marry',
      nameIndexLetter: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/30.jpg',
      name: 'Nothing',
      nameIndexLetter: 'N',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/31.jpg',
      name: 'Dog',
      nameIndexLetter: 'D',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      name: 'Doing',
      nameIndexLetter: 'D',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/33.jpg',
      name: 'Hello',
      nameIndexLetter: 'H',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/34.jpg',
      name: 'Hi',
      nameIndexLetter: 'H',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/45.jpg',
      name: '曾经',
      nameIndexLetter: 'C',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/47.jpg',
      name: '许许多多的故事',
      nameIndexLetter: 'X',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/49.jpg',
      name: '许三多',
      nameIndexLetter: 'X',
    ),
  ];

  static ContactsData mock(){
    return ContactsData(); 
  }
}
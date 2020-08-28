import 'package:flutter/material.dart';
import 'package:wechat_clone/home/conversation_page.dart';

import '../constance.dart' show AppColors;

class Conversation {
  final String avatar;
  final String title;
  final String description;
  final String creatTime;
  final bool ismute;
  final int titleColor;
  final int unreadMsgConut;
  final bool displayDot;

  const Conversation({
    @required this.avatar,
    @required this.title,
    @required this.creatTime,
    this.titleColor : AppColors.ConversationTitleColor,
    this.description, 
    this.ismute : false,
    this.unreadMsgConut : 0,
    this.displayDot : false,

  }): assert(avatar != null),
      assert(title != null),
      assert(creatTime != null);

  bool isAvatarFromNet(){
    if(this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
        return true;
      }
    return false;
  }
}


const List<Conversation> ConversationModels = [
  const Conversation(
    avatar: 'assets/images/ic_wx_games.png',
    title: '微信游戏',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 99,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'assets/images/ic_file_transfer.png',
    title: '文件传输助手',
    creatTime: '17:17',
    ismute: true,
    description: '文件传输助手，用心创造快乐。',
    unreadMsgConut: 7,
    displayDot: false,
  ),
  const Conversation(
    avatar: 'assets/images/ic_tx_news.png',
    title: '微信新闻',
    creatTime: '17:17',
    ismute: false,
    description: '微信新闻，用心创造快乐。',
    unreadMsgConut: 7,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'assets/images/ic_group_chat.png',
    title: '群组聊天',
    creatTime: '17:17',
    ismute: true,
    description: '群组聊天，用心创造快乐。',
    unreadMsgConut: 7,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/83.jpg',
    title: '个人头像',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/92.jpg',
    title: '微信头像',
    creatTime: '17:17',
    ismute: true,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 44,
    displayDot: false,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
    title: '大帅哥',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/83.jpg',
    title: '个人头像',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/92.jpg',
    title: '微信头像',
    creatTime: '17:17',
    ismute: true,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 44,
    displayDot: false,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
    title: '大帅哥',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/83.jpg',
    title: '个人头像',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/92.jpg',
    title: '微信头像',
    creatTime: '17:17',
    ismute: true,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 44,
    displayDot: false,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
    title: '大帅哥',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/83.jpg',
    title: '个人头像',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/92.jpg',
    title: '微信头像',
    creatTime: '17:17',
    ismute: true,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 44,
    displayDot: false,
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
    title: '大帅哥',
    creatTime: '17:17',
    ismute: false,
    description: '腾讯游戏，用心创造快乐。',
    unreadMsgConut: 17,
    displayDot: true,
  ),
];


class ConversationPageData{
  const ConversationPageData({
    this.device,
    this.conversations,
  });

  final DeviceMode device;
  final List<Conversation> conversations;

  static mock(){
    return ConversationPageData(device: DeviceMode.MAC, conversations: ConversationModels);
  }
}
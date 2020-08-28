import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconNormalColor = 0xff999999;
  static const TabIconActiveColor = 0xff46c11b;
  static const PopupMenuTextColor = 0xffffffff;
  static const ConversationTitleColor = 0xff353535;
  static const ConversationItemBgColor = 0xffffffff;
  static const ConversationDesTitleColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotifyDotBgColor = 0xffff3e3e;
  static const NotifyDotTextColor = 0xffffffff;
  static const MuteIconBgColor = 0xffd8d8d8;
  static const DeviceInfoItemBgColor = 0xfff5f5f5;
  static const ContactItemBgColor = 0xfff5f5f5;
  static const ContactGroupTitleBgColor = 0xffebebeb;
}


class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ConversationTitleColor),
  );
  static const DesStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.ConversationDesTitleColor),
  );
  static const UnreadDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotTextColor),
  );
  static const DeviceInfoItemStyle = TextStyle(
    fontSize: 16.0,
    color: Color(AppColors.ConversationDesTitleColor),
  );
  static const ContactGroupTitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(0xff888888),
  );
}

class ConstantsDefine {
  static const IconFontFamily = 'appIconFont';
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnreadMsgDotSize =  20.0;
  static const MuteIconSize = 18.0;
  static const ContactAvatarSize = 48.0;
  static const IndexBarWidth = 24.0;
}
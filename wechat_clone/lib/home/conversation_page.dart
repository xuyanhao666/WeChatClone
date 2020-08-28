import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_clone/constance.dart';

import '../constance.dart' show AppColors,AppStyles,ConstantsDefine;
import '../model/conversationModel.dart' show ConversationPageData,Conversation;

enum DeviceMode{
  MAC,WINDOWS
}

class _ConversationItem extends StatelessWidget {

  const _ConversationItem({Key key,this.conversation})
    :assert(conversation != null),
    super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    //根据图片的获取方式显示头像
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: ConstantsDefine.ConversationAvatarSize,
        height: ConstantsDefine.ConversationAvatarSize,);
    }else{
        avatar = Image.asset(
        conversation.avatar,
        width: ConstantsDefine.ConversationAvatarSize,
        height: ConstantsDefine.ConversationAvatarSize,);
    }
    // avatar = conversation.isAvatarFromNet() ? Image.network(conversation.avatar,width: ConstantsDefine.ConversationAvatarSize,
    //       height: ConstantsDefine.ConversationAvatarSize,) : Image.asset(conversation.avatar,width: ConstantsDefine.ConversationAvatarSize,
    //       height: ConstantsDefine.ConversationAvatarSize,);


    //未读消息角标
    Widget avatarContainer;
    if(conversation.unreadMsgConut > 0 && !conversation.ismute){
      Widget unreadMsgText = Container(
        alignment: Alignment.center,
        width: ConstantsDefine.UnreadMsgDotSize,
        height: ConstantsDefine.UnreadMsgDotSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ConstantsDefine.UnreadMsgDotSize /2.0,),
          color: Color(AppColors.NotifyDotBgColor), 
        ),
        child: Text(conversation.unreadMsgConut.toString(),style: AppStyles.UnreadDotStyle,),
      );

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            child: unreadMsgText,
            top: -5.0,
            right: -5.0,
          )    
        ],
      );
    }else{
      avatarContainer = avatar;
    }

    Color muteIconBgColor = conversation.ismute ? Colors.transparent : Color(AppColors.MuteIconBgColor);
    //勿扰模式图标
    Widget muteIcon = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(conversation.creatTime,style: AppStyles.DesStyle,),
          Container(height: 10.0,),
          Icon(IconData(
            0xe64f,
            fontFamily: ConstantsDefine.IconFontFamily,
            ),
            color: muteIconBgColor,
            size: ConstantsDefine.MuteIconSize,)
        ]
      );
    
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBgColor),
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: ConstantsDefine.DividerWidth)
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   conversation.avatar,
          // width: ConstantsDefine.ConversationAvatarSize,
          // height: ConstantsDefine.ConversationAvatarSize,
          // ),
          avatarContainer,
          Container(width: 10.0,),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(conversation.title,style: AppStyles.TitleStyle,),
              Container(height: 10.0,),
              Text(conversation.description,style: AppStyles.DesStyle,),
            ],
          ),
          ),
          muteIcon,
        ],
      ),
    );
  }
}

//微信已登陆
class _DeviceInfoItem extends StatelessWidget {

  const _DeviceInfoItem({this.device : DeviceMode.MAC}) : assert(device != null);

  final DeviceMode device;

  int get deviceIcon{
    return device == DeviceMode.MAC ? 0xe64f : 0xe600;
  } 

  String get deviceName{
    return device == DeviceMode.MAC ? 'MAC' : 'WIN';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: ConstantsDefine.DividerWidth,color: Color(AppColors.DividerColor))
        ),
        color: Color(AppColors.DeviceInfoItemBgColor),
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(IconData(
          this.deviceIcon,
          fontFamily: ConstantsDefine.IconFontFamily,
        ),size: 24.0,color: Color(AppColors.ConversationDesTitleColor),),
        SizedBox(width: 16.0,),
        Text('$deviceName微信已登陆，手机通知已关闭。',style: AppStyles.DeviceInfoItemStyle,)
      ],
    ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    final ConversationPageData conversationPageData = ConversationPageData.mock();
    var conversations = conversationPageData.conversations;
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        if(conversationPageData.device != null){
          if(index == 0){
          return _DeviceInfoItem(device: conversationPageData.device,);
        }
        return _ConversationItem(conversation: conversations[index - 1],); 
        }else{
          return _ConversationItem(conversation: conversations[index],); 
        }
      },
      itemCount: conversationPageData.device != null ? conversations.length + 1 : conversations.length,
    );
  }
}
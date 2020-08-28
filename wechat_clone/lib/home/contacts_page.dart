import 'package:flutter/material.dart';

import '../model/contactsModel.dart' show Contact,ContactsData;
import '../constance.dart' show AppColors,ConstantsDefine,AppStyles;


class _ContactItem extends StatelessWidget {

  const _ContactItem({
    Key key,
    @required this.contact,
    @required this.onPressed,
    this.isShowGroupTitle

  }):assert(contact != null),super(key: key);

  final Contact contact;
  final VoidCallback onPressed;
  final bool isShowGroupTitle;
  final ITEM_HEIGHT = 48.0;

  bool get _isAvatarFromNet {
    return this.contact.avatar.startsWith('http') ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    //根据url判断是否为网络图片。
    Widget avatarIcon;
    if(_isAvatarFromNet){
      avatarIcon = Image.network(
        contact.avatar,
        width: ConstantsDefine.ContactAvatarSize,
        height: ConstantsDefine.ContactAvatarSize
      );
    }else {
      avatarIcon = Image.asset(
        contact.avatar,
        width: ConstantsDefine.ContactAvatarSize,
        height: ConstantsDefine.ContactAvatarSize
      );
    }
    //分组标签
    Widget _buttonItem = Container(
      padding: EdgeInsets.only(left: 0.0,right: 0.0,top: 10.0,bottom: 10.0),
      margin: EdgeInsets.only(left: 16.0,right: 16.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ContactItemBgColor),
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: ConstantsDefine.DividerWidth,
          ),
        ) 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          avatarIcon,
          SizedBox(width: 10.0), 
          Text(contact.name),
        ],
      )
    );

    Widget _bodyItem;
    if(contact.nameIndexLetter != null && isShowGroupTitle){
      _bodyItem = Container(
        child: Column(
        children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Color(AppColors.ContactGroupTitleBgColor),
              alignment: Alignment.centerLeft,
              child: Text(
                contact.nameIndexLetter,
                style: AppStyles.ContactGroupTitleStyle,
                ),
            ),
          _buttonItem,
        ],
      ),
      );

    }else{
      _bodyItem = _buttonItem;
    }
    return _bodyItem;
  }
}

const INDEX_BAR_WORDS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class ContactsPage extends StatefulWidget {
  //设置indexBar默认颜色为透明色。
  Color _indexBarBgColor = Colors.transparent;

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsData data = ContactsData.mock();
  final List<Contact> _contacts = [];
  ScrollController _scrollController ; 

  final List<_ContactItem> fuctionItems = [
    _ContactItem(
      contact: Contact(
        avatar: 'assets/images/ic_new_friend.png',
        name: '新的朋友',
      ),
      onPressed: (){
        print('1');
      },
    ),
    _ContactItem(
      contact: Contact(
        avatar: 'assets/images/ic_group_chat.png',
        name: '群聊',
      ),
      onPressed: (){
        print('2');
      },
    ),
    _ContactItem(
      contact: Contact(
        avatar: 'assets/images/ic_tag.png',
        name: '标签',
      ),
      onPressed: (){
        print('3');
      },
    ),
    _ContactItem(
      contact: Contact(
        avatar: 'assets/images/ic_public_account.png',
        name: '公众号',
      ),
      onPressed: (){
        print('4');
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
    //链式调用，添加三遍数据
    _contacts..addAll(data.contacts)..addAll(data.contacts)..addAll(data.contacts);
    _contacts.sort((Contact a, Contact b) => a.nameIndexLetter.compareTo(b.nameIndexLetter));

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  String _getLetter(BuildContext context, Offset offsetPos,int barItemHeight){
    RenderBox _box = context.findRenderObject();
    var _local = _box.globalToLocal(offsetPos);

    //设置index区间，不然溢出了
    int _index  = (_local.dy ~/ barItemHeight).clamp(0, INDEX_BAR_WORDS.length - 1);

    return INDEX_BAR_WORDS[_index];
  }

  Widget _indexBar(BuildContext context,BoxConstraints constraints){
    //生成indexBar列表widget
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word){
      return Expanded(
        child: Text(word),
      );
    }).toList();
    final double _indexBarTotalHeight = constraints.biggest.height;
    final int _barItemHeight = _indexBarTotalHeight ~/ _letters.length;
    return GestureDetector(
              onVerticalDragDown: (DragDownDetails details){
                setState(() {
                  widget._indexBarBgColor = Colors.black26;
                  _getLetter(context, details.globalPosition,_barItemHeight);
                });
                _scrollController.animateTo(100.0,curve: Curves.easeIn, duration: Duration(milliseconds: 200));
              },
              onVerticalDragEnd: (DragEndDetails details){
                setState(() {
                  widget._indexBarBgColor = Colors.transparent;
                });
              },
              onVerticalDragCancel: (){
                setState(() {
                  widget._indexBarBgColor = Colors.transparent;
                });
              },
              child: Column(
                children: _letters
              ),
            );

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context,int index){
            if(index < fuctionItems.length){
              return fuctionItems[index];
            }
            int _contactIndex = index - fuctionItems.length;
            bool _isShowGropuTitle = true;
            if (_contactIndex >= 1 && _contacts[_contactIndex].nameIndexLetter == _contacts[_contactIndex - 1].nameIndexLetter) {
              _isShowGropuTitle = false;
            } 
            Contact _contact = _contacts[_contactIndex];
            return _ContactItem(
              contact: _contact,
              isShowGroupTitle: _isShowGropuTitle,
              onPressed: (){
                print('点击了$_contact.name');
              },
            );
          },
          itemCount: _contacts.length + fuctionItems.length,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          width: ConstantsDefine.IndexBarWidth,
          bottom: 0.0,
          child: Container(
            color: widget._indexBarBgColor,
            child: LayoutBuilder(
              builder: _indexBar,
            )
          ),
        ),
      ],
    );
  }
}
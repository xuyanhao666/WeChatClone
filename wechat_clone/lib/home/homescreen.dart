import 'package:flutter/material.dart';

import './conversation_page.dart';
import './contacts_page.dart';
import './practicedart.dart';

import '../constance.dart' show ConstantsDefine, AppColors;

enum ActionItems{
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP
}

class BottomNavigationIconsView {
  final BottomNavigationBarItem item;

  BottomNavigationIconsView({Key key, String title, IconData icon, IconData activeIcon}):

  item = BottomNavigationBarItem(
    icon: Icon(icon),
    activeIcon: Icon(activeIcon),
    title: Text(title),
    backgroundColor: Colors.white
  ); 
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  List<BottomNavigationIconsView> _navigationViews;
  List<Widget> _pages;

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = [
      BottomNavigationIconsView(
        title: '微信',
        icon: IconData(
          0xe64f,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
        activeIcon: IconData(
          0xe62e,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
      ),
      BottomNavigationIconsView(
        title: '通讯录',
        icon: IconData(
          0xe655,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
        activeIcon: IconData(
          0xe6c2,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
      ),
      BottomNavigationIconsView(
        title: '发现',
        icon: IconData(
          0xe629,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
      ),
      BottomNavigationIconsView(
        title: '我',
        icon: IconData(
          0xe600,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
        activeIcon: IconData(
          0xe608,
          fontFamily: ConstantsDefine.IconFontFamily
        ),
      ),
    ];
    _pages = [
      ConversationPage(),
      ContactsPage(),
      Practice(),
      Container(color: Colors.orange,),
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

_bulidPopupMenuItem(int iconName, String title){
  return Row(
    children: <Widget>[
      Icon(IconData(
        iconName,
        fontFamily: ConstantsDefine.IconFontFamily
      ),size: 22.0,color:const Color(AppColors.PopupMenuTextColor),),
      Container(width: 14.0,),
    Text(title,style: TextStyle(color:const Color(AppColors.PopupMenuTextColor)))
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor:const Color(AppColors.TabIconActiveColor),
      items: _navigationViews.map((BottomNavigationIconsView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){  
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        });
        print('点击了第$index个tab');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0, //bar下部的阴影
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,size: 22.0,),
            onPressed: (){
              print('点击了searchBtn');
            },
    
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _bulidPopupMenuItem(0xe64f, '发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _bulidPopupMenuItem(0xe64f, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _bulidPopupMenuItem(0xe64f, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _bulidPopupMenuItem(0xe64f, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _bulidPopupMenuItem(0xe64f, '帮助与反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(Icons.add,size: 22.0,),
            onSelected: (ActionItems selectedValue){
              print('你点击的是$selectedValue');
            },
          ) ,
          Container(width: 16.0,)
        ],
        ), 
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index){
          return _pages[index];
        },
        controller: _pageController, 
        itemCount: _pages.length,
        onPageChanged: (int index){
          print('当前是第$index页');
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
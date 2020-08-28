import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({Key key}) : super(key: key);

  //命名参数
  _changeNum ({@required int num}){
  }

  //占位参数
  _changeNum2 (int num){
  }

  //参数默认值
  _changeNum3 (int num, [int count = 3]){
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    list..add('1')..add('2')..add('3')..add('4');
    // list.forEach((f){
    //   print(f);
    // });
    _changeNum(num: 23);

    print(list);
    print(list.join(','));
    print(list.join('2'));
    // var definelist = list.map((value){
    //   value = value + 'boom';
    //   }).toList();
    // definelist.forEach((f){
    //   print('map的元素'+f);
    // });

    var sss = 'sir';
    print(sss is String);// true
    print(sss is! String);// false

  // ??=运算符 如果 ??= 运算符前面的变量为null，则赋值，否则不赋值
  // var param1 = "hello", param2 = null;
  //也可入上一行所定义的一样，但是dart语言不建议init为null，可以不赋值，默认就是为null
  var param1 = "hello", param2;
  param1 ??= "world";
  param2 ??= "world";
  print("param1 = $param1"); // param1 = hello
  print("param2 = $param2"); // param2 = world

    return Container(
      color: Colors.brown,
      child: Text('adad'),
    );
  }
}

abstract class Doer {
  // 抽象方法，没有方法体，需要子类去实现
  void doSomething();
  // 普通的方法
  void greet() {
    print("hello world!");
  }
}

class EffectiveDoer extends Doer {
  // 实现了父类的抽象方法
  void doSomething() {
    print("I'm doing something...");
  }
}
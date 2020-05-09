//资源类
class R{
  static const _IntPic intPic =  _IntPic();
}


//主页的图片
class _IntPic{
  //const构造函数必须用于成员变量都是final或静态变量的类
  const _IntPic();
  // ignore: non_constant_identifier_names
  final String int_pic_01 = 'images/intpic/int_pic_01.jpg';


}
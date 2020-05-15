import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class BaseWidgetGradient extends StatefulWidget {
  BaseWidgetGradient({ Key key }) : super(key: key);

  @override
  BaseWidgetGradientState createState() => new BaseWidgetGradientState();
}

class BaseWidgetGradientState extends State<BaseWidgetGradient> with SingleTickerProviderStateMixin {

  //动画相关
  AnimationController _animationController;
  AnimationController get animationController => _animationController;
  Animation<double> _animation;
  Animation<double> get animation => _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_animationController.dispose()的位置应该在super.dispose()前执行。
    //先调用controller.dispose释放了动画资源，再调用super
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
//    _animationController.stop();
//    _animationController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          child: Scrollbar(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UtilText.title('LinearGradient：'),

                SizedBox(height: ScreenUtil().setHeight(2),width: double.infinity,),

                //默认
                _item(
                  text: '默认',
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.center,
                    colors: [Colors.lightBlueAccent,Colors.orange,Colors.greenAccent],
                    tileMode: TileMode.clamp,
                  ),
                ),

                //镜面反射
                _item(
                  text: '镜面反射',
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.center,
                    colors: [Colors.lightBlueAccent,Colors.orange,Colors.greenAccent],
                    tileMode: TileMode.mirror,
                    stops: [0.2,0.3,1]
                  ),
                ),

                //重复
                _item(
                  text: '重复',
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.center,
                    colors: [Colors.lightBlueAccent,Colors.orange,Colors.greenAccent],
                    tileMode: TileMode.repeated,
                  ),
                ),

                //stops
                _item(
                  text: 'stops',
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.2,0.35,0.45],
                    colors: [Colors.lightBlueAccent,Colors.orange,Colors.greenAccent],
                  ),
                ),

                //给文字创建渐变效果
                Padding(
                  padding:EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(24)
                  ),
                  child: Text('给文字创建渐变效果：',style: _style,)),
                Text(
                  '这是一段渐变的文字',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    //根据gradient创建shader,
                    //createShader的参数rect指定了渐变的范围
                    foreground: Paint()..shader = LinearGradient(
                      colors: [Colors.red,Colors.blue,Colors.orange]
                    ).createShader(Rect.fromLTWH(0, 0, 100, 10))
                  ),
                ),
                
                //整一段会闪烁的文字
                Padding(padding:EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(24)
                ),child: Text('整一段会闪烁的文字：',style: _style,)),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context,child){
                    return Text(
                      '这是一段会闪烁的文字',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          //根据gradient创建shader,
                          //createShader的参数rect指定了渐变的范围
                          foreground: Paint()..shader = LinearGradient(
                            colors: [Colors.orange,Colors.blue,Colors.orange],
                            stops: [_animation.value - 0.2,_animation.value,_animation.value + 0.2]
                          ).createShader(Rect.fromLTWH(0, 0, 160, 10))
                      ),
                    );
                  },
                ),
                
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(24)
                  ),
                  child: UtilText.title('RadialGradient：'),
                ),

                _item(
                  gradient: RadialGradient(
                    center: const Alignment(0.7, -0.6), // near the top right
                    radius: 0.2,
                    colors: [
                    const Color(0xFFFFFF00), // yellow sun
                    const Color(0xFF0099FF), // blue sky
                    ],
                    stops: [0.4, 1.0],
                  )
                ),

                _item(
                    gradient: RadialGradient(
                      center: Alignment(0,0), // near the top right
                      radius: 0.4,
                      colors: [
                        const Color(0xFFFFFF00), // yellow sun
                        const Color(0xFF0099FF), // blue sky
                      ],
                    )
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(24)
                  ),
                  child: UtilText.title('SweepGradient：'),
                ),

                _item(
                    gradient: SweepGradient(
                      colors: [
                        Colors.blue,
                        Colors.orange,
                        Colors.greenAccent
                      ],
                      center: Alignment.center,
                      startAngle: pi / 2,
                      endAngle: pi + pi / 2,
                      stops: [0.1,0.2,0.7],
                    ),
                ),

                //修改开始弧度
                _item(
                  gradient: SweepGradient(
                    colors: [
                      Colors.blue,
                      Colors.orange,
                      Colors.greenAccent
                    ],
                    center: Alignment.center,
                    startAngle: pi / 2,
                    endAngle: pi + pi / 2,
                    stops: [0.1,0.2,0.7],
                    //顺时针旋转90度
                    transform:GradientRotation(pi / 2)
                  ),

                ),







              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _style = TextStyle(color: Colors.lightBlue,fontSize: ScreenUtil().setSp(22));

  Widget _item({Gradient gradient,String text = ''}){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(24)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text,style: _style,),
          Container(
            height: ScreenUtil().setHeight(300),
            width: ScreenUtil().setWidth(300),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(4)
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(4)
                ),
                border: Border.all(
                    color: Colors.grey,
                    width: ScreenUtil().setWidth(4)
                ),
                gradient: gradient
            ),
          )
        ],
      ),
    );
  }
}
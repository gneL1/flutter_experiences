import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AnimationWidgetPhysics extends StatefulWidget {
  AnimationWidgetPhysics({ Key key }) : super(key: key);

  @override
  AnimationWidgetPhysicsState createState() => new AnimationWidgetPhysicsState();
}

class AnimationWidgetPhysicsState extends State<AnimationWidgetPhysics> {

  //球心高度
  double y = 70.0;

  //Y轴速度
  double vy = -10.0;

  //重力
  double gravity = 0.1;

  //地面反弹力
  double bounce = -0.5;

  //球的半径
  double radius = 50.0;

  //地面高度
  final double height = 700.0;

  //下落方法
  void _fail(_){
    y += vy;
    vy += gravity;

    //如果球体接触到地面，根据地面反弹力改变球体的y轴速度
    if( y + radius > height){
      y = height - radius;
      vy *= bounce;
    }
    else if(y - radius < 0){
      y = 0 + radius;
      vy *= bounce;
    }

    setState(() {

    });
  }

  Ticker ticker;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //使用一个Ticker在每次更新界面时运行球体下落方法
    ticker = Ticker(_fail)..start();
  }

  @override
  void dispose() {
    ticker.stop();
    ticker.dispose();
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('物理动画'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          ScreenUtil().setWidth(20)
        ),
//        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: y - radius,
                      left: MediaQuery.of(context).size.width / 2 - radius,
                      child: Container(
                        width: radius * 2,
                        height: radius * 2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                ),
              )
            ],
          ),
//        ),
      ),
    );
  }
}
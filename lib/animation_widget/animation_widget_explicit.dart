import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AnimationWidgetExplicit extends StatefulWidget {
  AnimationWidgetExplicit({ Key key }) : super(key: key);

  @override
  AnimationWidgetExplicitState createState() => new AnimationWidgetExplicitState();
}

class AnimationWidgetExplicitState extends State<AnimationWidgetExplicit> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _turns;
  bool _playing = false;

  //控制动画运行状态
  void _toggle(){
    if(_playing){
      _playing = false;
      _controller.stop();
    }
    else{
      _controller.forward()..whenComplete((){
        _controller.reverse();
      });
      _playing = true;
    }
    setState(() {
      
    });
  }
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化动画控制器，设置动画时间
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5)
    );
    
    //设置动画取值范围和时间曲线
    _turns = Tween(
      begin: 0.0,
      end:  pi * 2
    ).animate(_controller);
//    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('显式动画'),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RotationTransition(
                //旋转_turns个圈
                turns: _turns,
                child: Container(
                  color: Colors.blue[100],
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(200),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
              _pad(),

              Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(200),
                child: FlatButton(
                  onPressed: (){
                    _toggle();
                  },
                  color: Colors.lightBlue.withOpacity(0.2),
                  child: Text('toggle'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _pad(){
    return SizedBox(height: ScreenUtil().setHeight(20),);
  }
}
import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class BaseWidgetTransform extends StatefulWidget {
  BaseWidgetTransform({ Key key }) : super(key: key);

  @override
  BaseWidgetTransformState createState() => new BaseWidgetTransformState();
}

class BaseWidgetTransformState extends State<BaseWidgetTransform> {

  _GenericPress _baseTrans = _GenericPress();
  _GenericPress _translateTrans = _GenericPress();
  _GenericPress _rotateTrans = _GenericPress();
  _GenericPress _scaleTrans = _GenericPress();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    _baseTrans.dispose();
    _translateTrans.dispose();
    _rotateTrans.dispose();
    _scaleTrans.dispose();
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _item(
                text: '基本使用：',
                press: _baseTrans,
                child: Transform(
                  //沿着y轴扭曲/倾斜
                  transform: Matrix4.skewY(pi / 180 * _baseTrans._num),
                  //相对于坐标系原点的对齐方式
                  alignment: Alignment.topRight,
                  child: Container(
                    color: Colors.lightBlueAccent,
                    width: ScreenUtil().setWidth(160),
                    height: ScreenUtil().setHeight(56),
                    alignment: Alignment.center,
                    child: Text('基本使用${_baseTrans.num}'),
                  ),
                )
              ),






              _item(
                text: '平移：',
                press: _translateTrans,
                //默认原点为左上角
                child: Transform.translate(
                  offset: Offset(_translateTrans.num, 0),
                  //transformHitTests,如果Transform的child有一个按钮，
                  //为true时，在hitTest点击时会判断点击落点是否在transfrom所做的操作（旋转，拉伸或者位移等）后的区域里面
                  //直白点就是转换后的按钮仍然可以点击
                  //为false时，点击按钮原来的区域仍然会触发点击事件，但是点击按钮当前区域就不行了
                  transformHitTests: true,
                  child: Container(
                    color: Colors.lightBlueAccent,
                    width: ScreenUtil().setWidth(160),
                    height: ScreenUtil().setHeight(56),
                    alignment: Alignment.center,
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                        print('点击了按钮');
                      },
                      child: Text('平移${_translateTrans.num}')
                    ),
                  ),
                )
              ),

              _item(
                  text: '旋转：',
                  press: _rotateTrans,
                  child: Transform.rotate(
                    //旋转角度
                    angle: pi / 180 * _rotateTrans.num,
                    //旋转中心点的偏移
                    origin: Offset(0, 0),
                    //相对于坐标系原点的对齐方式
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.lightBlueAccent,
                      width: ScreenUtil().setWidth(160),
                      height: ScreenUtil().setHeight(56),
                      alignment: Alignment.center,
                      child: Text('基本使用${_rotateTrans.num}'),
                    ),
                  )
              ),

              _item(
                  text: '缩放：',
                  press: _scaleTrans,
                  child: Transform.scale(
                    scale: _scaleTrans.num * 0.01 + 1,
                    //缩放原点
                    origin: Offset(0, 100),
                    //相对于坐标系原点的对齐方式
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.lightBlueAccent,
                      width: ScreenUtil().setWidth(160),
                      height: ScreenUtil().setHeight(56),
                      alignment: Alignment.center,
                      child: Text('基本使用${_scaleTrans.num}'),
                    ),
                  )
              ),
              
            ],
          ),
        ),
      ),
    );
  }


  Widget _item({
    String text = '',
    Widget child,
    _GenericPress press
  }){
    return Padding(
      padding: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(24)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UtilText.title(text),
          SizedBox(width: ScreenUtil().setWidth(24),),
          Container(
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setHeight(300),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              )
            ),
            child: child,
          ),

          Container(
              height: ScreenUtil().setHeight(300),
              alignment: Alignment.bottomCenter,
              child: FlatButton(onPressed: (){
                press.onPressStart(
                  callback: (){
                    setState(() {

                    });
                  }
                );
              }, child: Text('开始'))
          ),
          Container(
              height: ScreenUtil().setHeight(300),
              alignment: Alignment.bottomCenter,
              child: FlatButton(onPressed: press.onPressStop, child: Text('停止'))
          ),
        ],
      ),
    );
  }
}


class _GenericPress{
  double _num = 0;
  double get num => _num;
  Timer _timer;
  void onPressStart({VoidCallback callback}){
    _timer = Timer.periodic(Duration(milliseconds: 50), (v){
      print('当前v是$v,num是${_num + 1}');
      _num = _num + 1;
      if(callback != null)callback();
    });
  }

  void onPressStop(){
    if(_timer != null && _timer.isActive){
      _timer.cancel();
    }
  }

  void dispose(){
    if(_timer != null && _timer.isActive){
      _timer.cancel();
    }
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class BaseWidgetShaderMask extends StatefulWidget {
  BaseWidgetShaderMask({ Key key }) : super(key: key);

  @override
  BaseWidgetShaderMaskState createState() => new BaseWidgetShaderMaskState();
}

class BaseWidgetShaderMaskState extends State<BaseWidgetShaderMask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShaderMask'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UtilText.title('基本用法：'),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(24)
                ),
                child: ShaderMask(
                  blendMode : BlendMode.modulate,
                  shaderCallback: (Rect bounds){
                    //可用的Gradient有[LinearGradient], [RadialGradient], [SweepGradient]
                    return RadialGradient(
                      center: Alignment.center,
                      radius: 1,
                      tileMode: TileMode.mirror,
                      colors: [Colors.yellowAccent,Colors.blue,Colors.greenAccent]
                    ).createShader(bounds);
                  },
                  child: Text(
                    '这是一段测试文字',
                    style:TextStyle(
                        fontSize: ScreenUtil().setSp(36),
                        color: Colors.white
                    ),
                  ),
                ),
              ),

              Divider(),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(24),
                ),
                child: UtilText.title('用在FlatButton里：'),
              ),


              ShaderMask(
                shaderCallback: (Rect bounds){
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      colors: [Color(0xff2092e2),Color(0xff07bcbe)]
                  ).createShader(bounds);
                },
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: (){

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(68),
                    child: Icon(
                      Icons.mode_edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: ScreenUtil().setHeight(24),
              ),


              ShaderMask(
                shaderCallback: (Rect bounds){
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter, 
                    tileMode: TileMode.mirror,
                    colors: [Color(0xff2092e2),Color(0xff07bcbe)]
                  ).createShader(bounds);
                },
                blendMode: BlendMode.saturation,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.transparent,
                  onPressed: (){

                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(68),
                    child: Icon(
                      Icons.mode_edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}
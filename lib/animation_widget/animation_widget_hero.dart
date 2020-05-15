import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/R.dart';
import 'package:flutterexperiences/Router.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class AnimationWidgetHero extends StatefulWidget {
  AnimationWidgetHero({ Key key }) : super(key: key);

  @override
  AnimationWidgetHeroState createState() => new AnimationWidgetHeroState();
}

class AnimationWidgetHeroState extends State<AnimationWidgetHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          ScreenUtil().setWidth(20)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  UtilText.title('Hero：'),
                  Container(
                    width: ScreenUtil().setWidth(300),
                    height: ScreenUtil().setHeight(300),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                    ),
                    alignment: Alignment.center,
                    child: Hero(
                      tag: Router.AnimationWidget_Hero,
//                      child: Container(
//                        color: Colors.lightBlue,
//                        width: ScreenUtil().setWidth(56),
//                        height: ScreenUtil().setHeight(56),
//
//                      ),
                      child: UtilText.maskShader('He'),
//                      child: Icon(Icons.gradient,size: ScreenUtil().setWidth(88),)
                    )
                  )
                ],
              )
//              UtilText.title('Hero：'),
//              _pad(),
//              Container(
//                width: ScreenUtil().setWidth(300),
//                height: ScreenUtil().setHeight(300),
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.grey)
//                ),
//                alignment: Alignment.center,
//                child: Hero(
//                  tag: Router.AnimationWidget_Hero,
//                  child: UtilText.maskShader('Hero'),
//
//                ),
//              )
              
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
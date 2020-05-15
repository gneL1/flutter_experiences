import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/Router.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_hero.dart';
import 'package:flutterexperiences/utils/util_item.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class AnimationWidgetIndex extends StatefulWidget {
  AnimationWidgetIndex({ Key key }) : super(key: key);

  @override
  AnimationWidgetIndexState createState() => new AnimationWidgetIndexState();
}

class AnimationWidgetIndexState extends State<AnimationWidgetIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画组件'),
      ),
      body: Column(
        children: <Widget>[
          UtilItem(
            icon: UtilText.maskShader('隐式'),
            onPressed: (){
              Navigator.pushNamed(context, Router.AnimationWidget_Implicit);
            },
            title: '隐式动画',
            description: '如AnimatedContainer、AnimatedOpacity、'
                'AnimatedPadding、AnimatedPositioned、AnimatedSwitcher、AnimatedAlign 等',
            isShape: true,
          ),

          UtilItem(
            icon: UtilText.maskShader('显式'),
            onPressed: (){
              Navigator.pushNamed(context, Router.AnimationWidget_Explicit);
            },
            title: '显式动画',
            description: '如RotationTranstion、FadeTranstion、ScaleTranstion、'
                'SizeTranstion、SlideTransition等',
            isShape: true,
          ),

          UtilItem(
            icon: Hero(tag:Router.AnimationWidget_Hero,child: UtilText.maskShader('He')),
//            icon: Hero(
//              tag:Router.AnimationWidget_Hero,
//              child: Container(
//                color: Colors.lightBlue,
//                width: ScreenUtil().setWidth(56),
//                height: ScreenUtil().setHeight(56),
//              ),
//            ),
            onPressed: (){
//              Navigator.pushNamed(context, Router.AnimationWidget_Hero);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return AnimationWidgetHero();
                },)
              );
            },
            title: 'Hero动画',
            description: '在页面切换时一个元素从旧页面运动到新页面的动画',
            isShape: true
          ),

          UtilItem(
            icon: UtilText.maskShader('交织'),
            onPressed: (){
              Navigator.pushNamed(context, Router.AnimationWidget_Interval);
            },
            title: '交织动画',
            description: '由一系列的小动画组成的动画，每个小动画可以是连续或间断的，也可以相互重叠',
            isShape: true,
          ),

          UtilItem(
            icon: UtilText.maskShader('物理'),
            onPressed: (){
              Navigator.pushNamed(context, Router.AnimationWidget_Physics);
            },
            title: '物理动画',
            description: '模拟现实世界物体运动的动画。需要建立物体的运动模型',
            isShape: true,
          ),





        ],
      ),
    );
  }
}
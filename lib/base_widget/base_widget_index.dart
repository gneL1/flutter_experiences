import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/Router.dart';
import 'package:flutterexperiences/utils/util_item.dart';
import 'dart:math';

import 'package:flutterexperiences/utils/util_text.dart';

class BaseWidgetIndex extends StatefulWidget {
  BaseWidgetIndex({ Key key }) : super(key: key);

  @override
  BaseWidgetIndexState createState() => new BaseWidgetIndexState();
}

class BaseWidgetIndexState extends State<BaseWidgetIndex> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
      ),
      body: Column(
        children: <Widget>[
          UtilItem(
            icon: UtilText.maskShader('Te'),
            onPressed: (){
              Navigator.pushNamed(context, Router.BaseWidget_TextView);
            },
            title: 'Text',
            description: '文本组件',
            isShape: true,
          ),
          UtilItem(
            icon: UtilText.maskShader('SM'),
            onPressed: (){
              Navigator.pushNamed(context, Router.BaseWidget_ShaderMask);
            },
            title: 'ShaderMask',
            description: '遮罩组件，可以使子组件拥有多种颜色或渐变效果',
            isShape: true,
          ),

          UtilItem(
            icon: UtilText.maskShader('Gra'),
            onPressed: (){
              Navigator.pushNamed(context, Router.BaseWidget_Gradient);
            },
            title: 'Gradient',
            description: '渐变效果',
            isShape: true,
          ),

          UtilItem(
            icon: UtilText.maskShader('DbF'),
            onPressed: (){
              Navigator.pushNamed(context, Router.BaseWidget_DropBackFilter);
            },
            title: 'DropbackFilter',
            description: '高斯模糊',
            isShape: true,
          ),


          UtilItem(
            icon: UtilText.maskShader('Sd'),
            onPressed: (){
              Navigator.pushNamed(context, Router.BaseWidget_Shadow);
            },
            title: 'Shadow',
            description: '阴影效果',
            isShape: true,
          ),

          UtilItem(
            icon: UtilText.maskShader('Tf'),
            onPressed: (){
              Navigator.pushNamed(context, Router.BaseWidget_Transform);
            },
            title: 'Transform',
            description: '变换组件，可以对child做平移、旋转、缩放等操作',
            isShape: true,
          ),
          




        ],
      ),
    );
  }


}
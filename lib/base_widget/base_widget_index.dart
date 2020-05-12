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


        ],
      ),
    );
  }


}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_item.dart';

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
            icon: _text(text: 'Tv'),
            onPressed: (){

            },
            title: 'TextView',
            description: '文本组件',
            isShape: true,
          )

        ],
      ),
    );
  }

  Widget _text({String text}){
    return ShaderMask(
      shaderCallback: (Rect bounds){
        return RadialGradient(
          center: Alignment.center,
          radius: 1,
          tileMode: TileMode.mirror,
          colors: <Color>[
            Colors.lightBlueAccent,Colors.lightBlue[300]
          ],
        ).createShader(bounds);
      },
      child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 2
                )
              ]
          )
      ),
    );
  }
}
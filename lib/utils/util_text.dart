import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UtilText extends StatelessWidget{

  final String text;
  final UtilTextType type;

  const UtilText.title(this.text,{Key key,}) :
        this.type = UtilTextType.Title,
        super(key: key);

  const UtilText.maskShader(this.text,{Key key,}) :
        this.type = UtilTextType.ShaderMask,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(type){
      case UtilTextType.Title:
        return Text(
          text,
          style: TextStyle(
              color: Colors.blue,
              fontSize: ScreenUtil().setSp(28),
              fontWeight: FontWeight.w500
          ),
        );
        break;
      case UtilTextType.ShaderMask:
        return RepaintBoundary(
          child: ShaderMask(
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
                    decoration: TextDecoration.none,
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 2
                      )
                    ]
                )
            ),
          ),
        );
        break;
    }

  }
}


enum UtilTextType{
  Title,
  ShaderMask
}


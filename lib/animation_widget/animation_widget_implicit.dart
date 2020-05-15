import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class AnimationWidgetImplicit extends StatefulWidget {
  AnimationWidgetImplicit({ Key key }) : super(key: key);

  @override
  AnimationWidgetImplicitState createState() => new AnimationWidgetImplicitState();
}

class AnimationWidgetImplicitState extends State<AnimationWidgetImplicit> {

  double _opacity = 1.0;
  
  //改变目标值
  void _toggle(){
    //大于0设为0，等于0就设为1
    _opacity = _opacity > 0 ? 0.0 : 1.0;
    setState(() {
      
    });
  }

  double _size = 100;
  double _radius = 4;
  Color _color = Colors.yellowAccent;

  void _animate(){
    //改变属性值
    setState(() {
      _size = _size == 100 ? 200 : 100;
      _radius = _radius == 4 ? 100 : 4;
      _color = _color == Colors.yellowAccent ? Colors.green : Colors.yellowAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('隐式动画'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              UtilText.title('AnimatedOpacity：'),
              _pad(),

              //显示或隐藏的动画
              AnimatedOpacity(
                //传入目标值
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Container(
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.lightBlueAccent,
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
                  child: Text('opacity'),
                ),
              ),

              _pad(),
              Divider(),
              _pad(),
              UtilText.title('AnimatedContainer：'),
              _pad(),
              
              AnimatedContainer(
                width: _size,
                height: _size,
                curve: Curves.easeIn,
                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_radius),
                  border: Border.all(color: Colors.grey,width: 4)
                ),
                duration: Duration(seconds: 1),
                child: Icon(Icons.ac_unit),
              ),

              _pad(),

              Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(200),
                child: FlatButton(
                  onPressed: (){
                    _animate();
                  },
                  color: Colors.lightBlue.withOpacity(0.2),
                  child: Text('animate'),
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
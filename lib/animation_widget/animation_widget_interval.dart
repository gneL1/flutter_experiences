import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterexperiences/utils/util_text.dart';

class AnimationWidgetInterval extends StatefulWidget {
  AnimationWidgetInterval({ Key key }) : super(key: key);

  @override
  AnimationWidgetIntervalState createState() => new AnimationWidgetIntervalState();
}

class AnimationWidgetIntervalState extends State<AnimationWidgetInterval> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _width;
  Animation<double> _height;
  Animation<Color> _color;
  Animation<double> _border;
  Animation<BorderRadius> _borderRadius;

  Animation<Offset> _move;

  void _play(){
    if(_controller.isCompleted){
      _controller.reverse();
    }
    else{
      _controller.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5)
    );

    _width = Tween<double>(
      begin: 100,
      end: 300
    ).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.2,curve: Curves.ease)
        )
    );


    _height = Tween<double>(
      begin: 100,
      end: 300
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Interval(0.2, 0.4,curve: Curves.ease))
    );

    _color = ColorTween(
      begin: Colors.blue,
      end: Colors.yellowAccent
    ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.4, 0.6,curve: Curves.ease)
        )
    );





    _borderRadius = Tween<BorderRadius>(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(150.0)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 0.8,curve: Curves.ease)
      )
    );

    _border = Tween<double>(
      begin: 0,
      end: 25
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1.0,curve: Curves.easeIn)
      )
    );

    _move = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1,1)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn
    ));

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
        title: Text('交织动画'),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 13,
                color: Colors.orange,
              ),
              UtilText.title('Interval的使用：'),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(24),bottom: ScreenUtil().setHeight(24)),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context,child){
                    return Container(
                      width: _width.value,
                      height: _height.value,
                      decoration: BoxDecoration(
                        color: _color.value,
//                        color: Colors.green,
                        borderRadius: _borderRadius.value,
                        border: Border.all(
                          width: _border.value,
                          color: Colors.orange
                        )
                      ),
                    );
                  },
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(200),
                child: FlatButton(
                  onPressed: (){
                    _play();
                  },
                  color: Colors.lightBlue.withOpacity(0.2),
                  child: Text('toggle'),
                ),
              ),

              Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(800),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                alignment: Alignment.topLeft,
                child: SlideTransition(
                  position: _move,
                  child: Container(
                   width: ScreenUtil().setWidth(300),
                   height: ScreenUtil().setHeight(300),
                   color: Colors.orange,
                  ),
                  transformHitTests: true,
                ),
              ),
              
              
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.lightBlueAccent,
                height: ScreenUtil().setHeight(200),
              )






            ],
          ),
        ),
      ),
    );
  }
}
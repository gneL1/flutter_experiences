import 'package:flutter/material.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_explicit.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_hero.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_implicit.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_index.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_interval.dart';
import 'package:flutterexperiences/animation_widget/animation_widget_physics.dart';
import 'package:flutterexperiences/base_widget/base_widget_backdropfilter.dart';
import 'package:flutterexperiences/base_widget/base_widget_gradient.dart';
import 'package:flutterexperiences/base_widget/base_widget_index.dart';
import 'package:flutterexperiences/base_widget/base_widget_shadermask.dart';
import 'package:flutterexperiences/base_widget/base_widget_shadow.dart';
import 'package:flutterexperiences/base_widget/base_widget_textview.dart';
import 'package:flutterexperiences/custom_widget/custom_widget_index.dart';
import 'package:flutterexperiences/lock_page/lock_page.dart';

class Router{

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static FocusNode focusNode = FocusNode();

  //关闭焦点
  static void closeFocusNode(){
    FocusScope.of(navigatorKey.currentContext).requestFocus(focusNode);
  }

  static const String BaseWidget_Index = 'BaseWidgetIndex';
  static const String BaseWidget_TextView = 'BaseWidgetTextView';
  static const String BaseWidget_ShaderMask = 'BaseWidgetShaderMask';
  static const String BaseWidget_Gradient = 'BaseWidgetGradient';
  static const String BaseWidget_DropBackFilter = 'BaseWidgetDropBackFilter';
  static const String BaseWidget_Shadow = 'BaseWidgetShadow';


  static const String CustomWidget_Index = 'CustomWidgetIndex';

  static const String AnimationWidget_Index = 'AnimationWidgetIndex';
  static const String AnimationWidget_Implicit = 'AnimationWidgetImplicit';
  static const String AnimationWidget_Explicit = 'AnimationWidgetExplicit';
  static const String AnimationWidget_Hero = 'AnimationWidgetHero';
  static const String AnimationWidget_Interval = 'AnimationWidgetInterval';
  static const String AnimationWidget_Physics = 'AnimationWidgetPhysics';




  static const String Lock_Page = 'LockPage';



  static Route generateRoute(RouteSettings settings){
    switch (settings.name){
      case BaseWidget_Index:
        return MaterialPageRoute(builder: (context){
          return BaseWidgetIndex();
        });
        break;
      case CustomWidget_Index:
        return MaterialPageRoute(builder: (context){
          return CustomWidgetIndex();
        });
        break;
      case BaseWidget_TextView:
        return MaterialPageRoute(builder: (context){
          return BaseWidgetTextView();
        });
        break;
      case BaseWidget_ShaderMask:
        return MaterialPageRoute(builder: (context){
          return BaseWidgetShaderMask();
        });
        break;
      case BaseWidget_Gradient:
        return MaterialPageRoute(builder: (context){
          return BaseWidgetGradient();
        });
        break;
      case BaseWidget_DropBackFilter:
        return MaterialPageRoute(builder: (context){
          return BaseWidgetDropBackFilter();
        });
        break;

      case BaseWidget_Shadow:
        return MaterialPageRoute(builder: (context){
          return BaseWidgetShadow();
        });
        break;

      case Lock_Page:
        return MaterialPageRoute(builder: (context){
          return LockPage();
        });
        break;
      case AnimationWidget_Index:
        return MaterialPageRoute(builder: (context){
          return AnimationWidgetIndex();
        });
        break;

      case AnimationWidget_Implicit:
        return MaterialPageRoute(builder: (context){
          return AnimationWidgetImplicit();
        });
        break;

      case AnimationWidget_Explicit:
        return MaterialPageRoute(builder: (context){
          return AnimationWidgetExplicit();
        });
        break;

      case AnimationWidget_Hero:
        return MaterialPageRoute(builder: (context){
          return AnimationWidgetHero();
        });
        break;

      case AnimationWidget_Interval:
        return MaterialPageRoute(builder: (context){
          return AnimationWidgetInterval();
        });
        break;

      case AnimationWidget_Physics:
        return MaterialPageRoute(builder: (context){
          return AnimationWidgetPhysics();
        });
        break;

    }
  }
}


//打开弹窗的方法
void usualDialog({
  @required Widget route,
  Color color,
  bool barrierDismissible = true,
}){
  Router.navigatorKey.currentState.push(
    _CustomDialogRoute(
      pageBuilder: (_,__,___){
        return route;
      },
      barrierColor:color == null ? Color(0x4D000000) : color,
      barrierDismissible: barrierDismissible,
      transitionDuration: Duration(milliseconds: 300),
    ),

//    PageRouteBuilder(
//      pageBuilder: (_,__,___){
//        return route;
//      },
//      //不透明，是否可以看见底下的页面，为true时看不见
//      opaque: false,
//      //背景颜色
//      barrierColor: Color(0x4D000000),
//      //点击背景时是否可以关闭页面
//      barrierDismissible: true,
//      //打开页面时动画持续时间
//      transitionDuration: Duration(milliseconds: 0),
//      //是否保持打开页面的状态。
//      //为true时保持状态，当从打开的弹窗A跳转到另一个页面B后，关闭B页面，A之前所保存的数据任然存在
//      maintainState: false,
//      //为true时，如果打开页面有Scaffold,那么其appBar上的按钮是"❌"符号，为false时则是"⬅"符号
//      fullscreenDialog: false,
//      //是barrier的semanticsLabel语义标签，当barrierDismissible可以关闭(true)且在打开读屏功能时，
//      //触摸barrier会读出barrierLabel
//      barrierLabel: '点击可关闭',
//      //RouteSettings,可以设置路由的名字和参数
////      settings: ,
//    ),
  );
}


class _CustomDialogRoute<T> extends PopupRoute<T> {
  _CustomDialogRoute({
    @required RoutePageBuilder pageBuilder,
    bool barrierDismissible = true,
    String barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder transitionBuilder,
    RouteSettings settings,
  }) : assert(barrierDismissible != null),
        _pageBuilder = pageBuilder,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _barrierColor = barrierColor,
        _transitionDuration = transitionDuration,
        _transitionBuilder = transitionBuilder,
        super(settings: settings);

  final RoutePageBuilder _pageBuilder;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String get barrierLabel => _barrierLabel;
  final String _barrierLabel;

  @override
  Color get barrierColor => _barrierColor;
  final Color _barrierColor;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  final RouteTransitionsBuilder _transitionBuilder;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return  _pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (_transitionBuilder == null) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
    } // Some default transition
    return _transitionBuilder(context, animation, secondaryAnimation, child);
  }
}
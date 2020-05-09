import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterexperiences/utils/util_functions.dart';

class UtilItem extends StatelessWidget {

  final String title;
  final String description;
  final VoidCallback onPressed;
  final Widget icon;
  final Color backgroundColor;
  final bool isShape;
  UtilItem({
    Key key,
    this.title = '',
    this.description = '',
    this.onPressed,
    this.icon,
    this.backgroundColor = Colors.lightBlueAccent,
    this.isShape = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return isShape ? _shapeHead(child: _child()) : _head(child: _child());
  }


  Widget _child(){
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(90),
          height: ScreenUtil().setHeight(90),
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(24)
          ),
          decoration: BoxDecoration(
              color: getRandomColor(opacity: 0.2),
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white,
                  width: 3
              )
          ),
          alignment: Alignment.center,
          child: icon == null ? Icon(
            Icons.build,
            color: backgroundColor.withOpacity(0.8),
          ) : icon,
        ),

        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24),
              right: ScreenUtil().setWidth(24),
              top: ScreenUtil().setHeight(24),
              bottom: ScreenUtil().setHeight(24),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w500,

                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(8),
                    ),
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

      ],
    );
  }


  Widget _head({Widget child}){
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: backgroundColor),
          color: backgroundColor.withOpacity(0.25),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
            vertical: ScreenUtil().setHeight(8)
        ),
        height: ScreenUtil().setHeight(120),
        child :InkWell(
          borderRadius: BorderRadius.all(Radius.circular(6)),

          onTap: onPressed,
          child: child,
        )
    );
  }


  Widget _shapeHead({Widget child}){
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16),
          vertical: ScreenUtil().setHeight(8)
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: _ItemShape(isClip: true,color: backgroundColor)
        ),
        child: Material(
          color: Colors.lightBlueAccent.withOpacity(0.25),
          shape: _ItemShape(color: backgroundColor),

          child: InkWell(

            borderRadius: BorderRadius.all(Radius.circular(6)),

            onTap: onPressed,
            child: SizedBox(
              height: ScreenUtil().setHeight(120),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}




typedef CustomPopItemBuilder = List<UtilItem> Function(BuildContext context);

class _ItemShape extends ShapeBorder{

  final bool isClip;
  final Color color;

  _ItemShape({
    this.isClip = false,
    this.color = Colors.lightBlueAccent
  });

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    if(isClip){
      Path path = Path();
      path.fillType = PathFillType.evenOdd;

      double length;

      var w = rect.width;
      var h = rect.height;
      if(rect.width > rect.height){
        length = rect.height / 8;
      }
      else{
        length = rect.width / 8;
      }

      path.addPolygon([
        Offset(0,length),
        Offset(0,h - length),
        Offset(length, h),
        Offset(length + rect.width / 3, h),
        Offset(length + rect.width / 3 + length / 2, h - length / 2),
        Offset(w - length - rect.width / 3 - length / 2, h - length / 2),
        Offset(w - length - rect.width / 3 , h),
        Offset(w - length, h),
        Offset(w, h - length),
        Offset(w, length),
        Offset(w - length, 0),
        Offset(length, 0)
      ], true);


      return path;
    }
    else{
      return null;
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
//    // TODO: implement paint
    if(!isClip){
      Paint paint = Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round;

      Path path = Path();
      double length;

      var w = rect.width;
      var h = rect.height;
      if(rect.width > rect.height){
        length = rect.height / 8;
      }
      else{
        length = rect.width / 8;
      }

//      path.fillType = PathFillType.evenOdd;
      path.addPolygon([
        Offset(0,length),
        Offset(0,h - length),
        Offset(length, h),
        Offset(length + rect.width / 3, h),
        Offset(length + rect.width / 3 + length / 2, h - length / 2),
        Offset(w - length - rect.width / 3 - length / 2, h - length / 2),
        Offset(w - length - rect.width / 3 , h),
        Offset(w - length, h),
        Offset(w, h - length),
        Offset(w, length),
        Offset(w - length, 0),
        Offset(length, 0)
      ], true);
      canvas.drawPath(path, paint);

      Path pathTop = Path();
      pathTop.addPolygon([
        Offset(rect.width / 3, 0),
        Offset(rect.width / 3 * 2, 0),
        Offset(rect.width / 3 * 2 - length,4.0),
        Offset(rect.width / 3  + length,4.0),
      ], true);

      paint.style = PaintingStyle.fill;

      canvas.drawPath(pathTop, paint);
    }

  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterexperiences/utils/util_functions.dart';

class UtilItem extends StatelessWidget {

  final String title;
  final String description;
  final VoidCallback onPressed;
  final Widget icon;
  final Color backgroundColor;
  UtilItem({
    Key key,
    this.title = '',
    this.description = '',
    this.onPressed,
    this.icon,
    this.backgroundColor = Colors.lightBlueAccent

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
          child: Row(
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
          ),
        )
    );
  }
}




typedef CustomPopItemBuilder = List<UtilItem> Function(BuildContext context);


// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFlexibleSpaceBar extends StatefulWidget {
  const CustomFlexibleSpaceBar({
    Key key,
    this.title,
    this.background,
    this.centerTitle,
    this.titlePadding,
    this.appbarColor,
    this.callBack,
    this.onImageTap,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
  })  : assert(collapseMode != null),
        super(key: key);

  final Widget title;

  final Color appbarColor;

  final Widget background;

  final bool centerTitle;

  final CollapseMode collapseMode;

  final List<StretchMode> stretchModes;

  final EdgeInsetsGeometry titlePadding;

  static Widget createSettings({
    double toolbarOpacity,
    double minExtent,
    double maxExtent,
    @required double currentExtent,
    @required Widget child,
  }) {
    assert(currentExtent != null);
    return FlexibleSpaceBarSettings(
      toolbarOpacity: toolbarOpacity ?? 1.0,
      minExtent: minExtent ?? currentExtent,
      maxExtent: maxExtent ?? currentExtent,
      currentExtent: currentExtent,
      child: child,
    );
  }

  final Function(double opacity) callBack;
  final Function onImageTap;

  @override
  _CustomFlexibleSpaceBarState createState() => _CustomFlexibleSpaceBarState();
}

class _CustomFlexibleSpaceBarState extends State<CustomFlexibleSpaceBar> {
  bool _getEffectiveCenterTitle(ThemeData theme) {
    if (widget.centerTitle != null) return widget.centerTitle;
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
      case TargetPlatform.iOS:
        return true;
    }
    return null;
  }

  Alignment _getTitleAlignment(bool effectiveCenterTitle) {
    if (effectiveCenterTitle) return Alignment.bottomCenter;
    final TextDirection textDirection = Directionality.of(context);
    assert(textDirection != null);
    switch (textDirection) {
      case TextDirection.rtl:
        return Alignment.bottomRight;
      case TextDirection.ltr:
        return Alignment.bottomLeft;
    }
    return null;
  }

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final double deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final FlexibleSpaceBarSettings settings = context
          .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
      assert(
        settings != null,
        'A FlexibleSpaceBar must be wrapped in the widget returned by FlexibleSpaceBar.createSettings().',
      );

      final List<Widget> children = <Widget>[];

      final double deltaExtent = settings.maxExtent - settings.minExtent;

// 0.0 -> Expanded
// 1.0 -> Collapsed to toolbar
      final double t =
          (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);

// background
      if (widget.background != null) {
        final double fadeStart =
            math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
        const double fadeEnd = 1.0;
        assert(fadeStart <= fadeEnd);
        final double opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
        if (opacity > 0.0) {
          double height = settings.maxExtent;

// StretchMode.zoomBackground
          if (widget.stretchModes.contains(StretchMode.zoomBackground) &&
              constraints.maxHeight > height) {
            height = constraints.maxHeight;
          }

          final Stack bg = widget.background;

          final double deltaExtent = settings.maxExtent - settings.minExtent;

          var top =
              -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);

//              children.add(
//                Positioned(
//                  top: top,
//                  left: 0.0,
//                  right: 0.0,
//                  height: height,
//                  child: bg.children[0],
//                ),
//              );
//
//              children.add(
//                Opacity(
//                  opacity: Tween<double>(begin: 0.4, end: 0.8).transform(t),
//                  child: Container(
//                    color: Colors.black,
//                  ),
//                ),
//              );
//
//              children.add(
//                Positioned(
//                  top: -(settings.maxExtent - settings.currentExtent),
//                  left: 0.0,
//                  right: 0.0,
//                  height: height,
//                  child: Opacity(
//                    opacity: Tween<double>(begin: 1, end: 0).transform(t),
//                    child: bg.children[1],
//                  ),
//                ),
//              );

          widget.callBack(t);

          children.add(Stack(
            children: <Widget>[
//              Positioned(
//                top: _getCollapsePadding(t, settings),
//                left: 0.0,
//                right: 0.0,
//                height: height,
//                child: Opacity(
//                  opacity: opacity,
//                  child: widget.background,
//                ),
//              )

              Positioned(
                top: top,
                left: 0.0,
                right: 0.0,
                height: height,
                child: Opacity(
                  opacity: opacity,
                  child: Stack(
                    children: <Widget>[
                      bg.children[0],
                      InkWell(
                        child: Container(
                          color: Color.fromARGB(
                              Tween<double>(begin: 150.0, end: 230.0)
                                  .transform(t)
                                  .round(),
                              0,
                              0,
                              0),
                        ),
                        onTap: widget.onImageTap,
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: -(settings.maxExtent - settings.currentExtent),
                left: 0.0,
                right: 0.0,
                height: height,
                child: Opacity(
                  opacity: Tween<double>(begin: 1, end: 0).transform(t),
                  child: bg.children[1],
                ),
              ),
            ],
          ));

// StretchMode.blurBackground
          if (widget.stretchModes.contains(StretchMode.blurBackground) &&
              constraints.maxHeight > settings.maxExtent) {
            final double blurAmount =
                (constraints.maxHeight - settings.maxExtent) / 10;
            children.add(Positioned.fill(
                child: BackdropFilter(
                    child: Container(
                      color: Colors.transparent,
                    ),
                    filter: ui.ImageFilter.blur(
                      sigmaX: blurAmount,
                      sigmaY: blurAmount,
                    ))));
          }
        }
      }

// title
      if (widget.title != null) {
        final ThemeData theme = Theme.of(context);

        Widget title;
        switch (theme.platform) {
          case TargetPlatform.iOS:
            title = widget.title;
            break;
          case TargetPlatform.fuchsia:
          case TargetPlatform.android:
            title = Semantics(
              namesRoute: true,
              child: widget.title,
            );
        }

// StretchMode.fadeTitle
        if (widget.stretchModes.contains(StretchMode.fadeTitle) &&
            constraints.maxHeight > settings.maxExtent) {
          final double stretchOpacity = 1 -
              ((constraints.maxHeight - settings.maxExtent) / 100)
                  .clamp(0.0, 1.0);
          title = Opacity(
            opacity: stretchOpacity,
            child: title,
          );
        }

        final double opacity = settings.toolbarOpacity;
        if (opacity > 0.0) {
          TextStyle titleStyle = theme.primaryTextTheme.title;
          titleStyle =
              titleStyle.copyWith(color: titleStyle.color.withOpacity(opacity));
          final bool effectiveCenterTitle = _getEffectiveCenterTitle(theme);
          final EdgeInsetsGeometry padding = widget.titlePadding ??
              EdgeInsetsDirectional.only(
                start: effectiveCenterTitle ? 0.0 : 72.0,
                bottom: 16.0,
              );
          final double scaleValue =
              Tween<double>(begin: 1.5, end: 1.0).transform(t);
          final Matrix4 scaleTransform = Matrix4.identity()
            ..scale(scaleValue, scaleValue, 1.0);
          final Alignment titleAlignment =
              _getTitleAlignment(effectiveCenterTitle);
          children.add(Container(
            padding: padding,
            child: Transform(
              alignment: titleAlignment,
              transform: scaleTransform,
              child: Align(
                alignment: titleAlignment,
                child: DefaultTextStyle(
                  style: titleStyle,
                  child: title,
                ),
              ),
            ),
          ));
        }
      }

      return ClipRect(child: Stack(children: children));
    });
  }
}

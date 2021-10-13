library triple_status_button;

import 'package:flutter/material.dart';

class TripleStatusButton extends StatefulWidget {
  /// height of widget. the width will be height * 2. it's required.
  final double height;

  /// leftIcon will show left of widget
  final IconData? leftIcon;

  /// rightIcon will show right of widget
  final IconData? rightIcon;

  /// if hasIcon=true leftWidget and rightWidget will show. default value is [true]
  final bool? hasIcon;

  /// circleColor is color of circle in middle of widget. it's required.
  final Color circleColor;

  /// backgroundColor is color of main (background) widget. it's required.
  final Color backgroundColor;

  /// with circleAnimState you can get state of widget. [left,middle,right]
  final Function(CircleAnimState) circleAnimState;

  const TripleStatusButton(
      {Key? key,
      required this.height,
      this.leftIcon,
      required this.circleAnimState,
      this.rightIcon,
      required this.circleColor,
      this.hasIcon = true,
      required this.backgroundColor})
      : super(key: key);

  @override
  _TripleStatusButtonState createState() => _TripleStatusButtonState();
}

class _TripleStatusButtonState extends State<TripleStatusButton> {
  late double pos;
  CircleAnimState _circleAnimState = CircleAnimState.middle;
  CircleAnimState _lastCircleAnimState = CircleAnimState.middle;

  @override
  void initState() {
    super.initState();
    pos = widget.height / 2;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _setPosition();
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.height * 2 + (widget.height / 2),
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: _circleAnimState == CircleAnimState.middle
                  ? Curves.ease
                  : Curves.linear,
              left: pos / 2,
              child: Container(
                height: widget.height,
                width: widget.height * 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(90))),
                child: Stack(
                  children: [
                    if (widget.hasIcon!)
                      Positioned(
                        right: (widget.height * 2) - (widget.height / 2),
                        top: widget.height / 3,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _goToLeftPosition();
                            });
                          },
                          child: Icon(
                            widget.leftIcon,
                            color: _setColor(),
                            size: widget.height / 3,
                          ),
                        ),
                      ),
                    if (widget.hasIcon!)
                      Positioned(
                        left: (widget.height * 2) - (widget.height / 2),
                        top: widget.height / 3,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _goToRightPosition();
                              });
                            },
                            child: Icon(
                              widget.rightIcon,
                              color: _setColor(),
                              size: widget.height / 3,
                            )),
                      ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          curve: _circleAnimState == CircleAnimState.middle
                              ? Curves.ease
                              : Curves.linear,
                          left: pos,
                          child: Container(
                            height: widget.height,
                            width: widget.height,
                            decoration: BoxDecoration(
                                color: widget.circleColor,
                                border:
                                    Border.all(color: widget.backgroundColor,),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(1000))),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setPosition() {
    if (_circleAnimState == CircleAnimState.middle &&
        _lastCircleAnimState == CircleAnimState.middle) {
      _goToRightPosition();
    } else if (_circleAnimState == CircleAnimState.right) {
      _goToMiddlePosition();
    } else if (_circleAnimState == CircleAnimState.middle &&
        _lastCircleAnimState == CircleAnimState.right) {
      _goToLeftPosition();
    } else if (_circleAnimState == CircleAnimState.left &&
        _lastCircleAnimState == CircleAnimState.left) {
      _lastCircleAnimState = CircleAnimState.middle;
      _goToMiddlePosition();
    }
  }

  void _goToRightPosition() {
    _circleAnimState = CircleAnimState.right;
    _lastCircleAnimState = CircleAnimState.right;
    pos = widget.height;
    widget.circleAnimState(_circleAnimState);
  }

  void _goToLeftPosition() {
    _circleAnimState = CircleAnimState.left;
    _lastCircleAnimState = CircleAnimState.left;
    pos = 0.0;
    widget.circleAnimState(_circleAnimState);
  }

  void _goToMiddlePosition() {
    _circleAnimState = CircleAnimState.middle;
    pos = widget.height / 2;
    widget.circleAnimState(_circleAnimState);
  }

  Color _setColor() {
    if (_circleAnimState == CircleAnimState.middle) {
      return widget.circleColor;
    } else {
      return widget.circleColor.withOpacity(.3);
    }
  }
}

enum CircleAnimState { left, middle, right }

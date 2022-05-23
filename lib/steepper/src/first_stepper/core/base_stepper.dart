import 'package:flutter/material.dart';
import 'package:fluttertest/Commons/GetSize.dart';
import 'package:fluttertest/Commons/colors.dart';
import 'package:fluttertest/Commons/images.dart';
import 'package:lottie/lottie.dart';

import 'base_indicator.dart';

/// Callback is fired when a step is reached.
typedef OnStepReached = void Function(int index);

class BaseStepper extends StatefulWidget {
  /// Each child defines a step. Hence, total number of children determines the total number of steps.
  final List<Widget>? children;
  final List<String>? lablelist =["Basic Info","Address","Complete"];

  /// Whether to enable or disable the next and previous buttons.
  final bool nextPreviousButtonsDisabled;

  /// Whether to allow tapping a step to move to that step or not.
  final bool stepTappingDisabled;

  /// Icon to be used for the previous button.
  final Icon? previousButtonIcon;

  /// Icon to be used for the next button.
  final Icon? nextButtonIcon;

  /// This callback provides the __index__ of the step that is reached.
  final OnStepReached? onStepReached;

  /// Whether to show the steps horizontally or vertically. __Note: Ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The color of the step when it is not reached.
  final Color? stepColor;

  /// The color of a step when it is reached.
  final Color? activeStepColor;

  /// The border color of a step when it is reached.
  final Color? activeStepBorderColor;
  final Color? unactiveStepBorderColor;

  /// The color of the line that separates the steps.
  final Color? lineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of individual dot within the line that separates the steps.
  final double lineDotRadius;

  /// The radius of a step.
  final double stepRadius;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  /// Amount of padding on each side of the child widget.
  final double padding;

  /// Amount of margin on each side of the step.
  final double margin;

  /// The width of the active step border.
  final double activeStepBorderWidth;

  /// Whether to disable scrolling or not.
  final scrollingDisabled;

  /// The step that is currently active.
  final int activeStep;

  /// Specifies the alignment of the stepper.
  final AlignmentGeometry? alignment;

  /// Creates a basic stepper.
  BaseStepper({

    this.children,
    this.nextPreviousButtonsDisabled = true,
    this.stepTappingDisabled = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.stepColor,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeStepBorderWidth = 0.5,
    this.scrollingDisabled = false,
    this.activeStep = 0,
    this.alignment,
    this.unactiveStepBorderColor
  }) {
    assert(
      lineDotRadius <= 10 && lineDotRadius > 0,
      'lineDotRadius must be less than or equal to 10 and greater than 0',
    );

    assert(
      stepRadius > 0,
      'iconIndicatorRadius must be greater than 0',
    );

    assert(
      activeStep >= 0 && activeStep <= children!.length,
      'Error: Active Step out of range',
    );
  }

  @override
  _BaseStepperState createState() => _BaseStepperState();
}

class _BaseStepperState extends State<BaseStepper> {
  ScrollController? _scrollController;
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.activeStep;
    this._scrollController = ScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(BaseStepper oldWidget) {
    // Verify that the active step falls within a valid range.
    if (widget.activeStep >= 0 && widget.activeStep < widget.children!.length) {
      _selectedIndex = widget.activeStep;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  /// Controls the step scrolling.
  void _afterLayout(_) {
    // ! Provide detailed explanation.
    for (int i = 0; i < widget.children!.length; i++) {
      _scrollController!.animateTo(
        i * ((widget.stepRadius * 2) + widget.lineLength),
        duration: widget.stepReachedAnimationDuration,
        curve: widget.stepReachedAnimationEffect,
      );

      if (_selectedIndex == i) break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Controls scrolling behavior.
    if (!widget.scrollingDisabled) WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);

    return widget.direction == Axis.horizontal
        ? Row(
            children: <Widget>[
              widget.nextPreviousButtonsDisabled ? _previousButton() : Container(),
              Expanded(
                child: _stepperBuilder(),
              ),
              widget.nextPreviousButtonsDisabled ? _nextButton() : Container(),
            ],
          )
        : Column(
            children: <Widget>[
              widget.nextPreviousButtonsDisabled ? _previousButton() : Container(),
              Expanded(
                child: _stepperBuilder(),
              ),
              widget.nextPreviousButtonsDisabled ? _nextButton() : Container(),
            ],
          );
  }

  /// Builds the stepper.
  Widget _stepperBuilder() {
    return Align(
      alignment: widget.alignment ?? Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: widget.direction,
        controller: _scrollController,
        physics: widget.scrollingDisabled ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          child: widget.direction == Axis.horizontal ? Row(children: _buildSteps()) : Column(children: _buildSteps()),
        ),
      ),
    );
  }

  /// Builds the stepper steps.
  List<Widget> _buildSteps() {
    return List.generate(
      widget.children!.length,
      (index) {
        return widget.direction == Axis.horizontal
            ? Row(

                children: <Widget>[
                  _customizedIndicator(index),
                  _customizedDottedLine(index, Axis.horizontal),
                ],
              )
            : Column(
                children: <Widget>[
                  _customizedIndicator(index),
                  _customizedDottedLine(index, Axis.vertical),
                ],
              );
      },
    );
  }


  Widget _customizedIndicator(int index) {
    return BaseIndicator(

      isSelected: _selectedIndex == index,
      onPressed: widget.stepTappingDisabled
          ? () {
              if (widget.steppingEnabled) {
                setState(() {
                  _selectedIndex = index;

                  if (widget.onStepReached != null) {
                    widget.onStepReached!(_selectedIndex);
                  }
                });
              }
            }
          : null,
      color: widget.stepColor,
      activeColor: widget.activeStepColor,
      activeBorderColor: widget.activeStepBorderColor,
      unactiveBorderColor: widget.unactiveStepBorderColor,
      radius: widget.stepRadius,
      padding: widget.padding,
      margin: widget.margin,
      lablePadding: _selectedIndex > index?h.h1+2:h.h2,

      lable: widget.lablelist![index],
      activeBorderWidth: widget.activeStepBorderWidth,

      child: _selectedIndex > index?

      Container(
          height: 27.5 * 2,
          width: 27.5 * 2,
          child: Lottie.asset(istrue,repeat: false))



      :
      _selectedIndex == 2?Container(
          height: 27.5 * 2,
          width: 27.5 * 2,
          child: Lottie.asset(istrue,repeat: false)):
      Container(
        height: 24.0 * 2,
        width: 24.0 * 2,

        decoration: BoxDecoration(
          border: _selectedIndex > index?
          Border.all(
            color: Colors.transparent,
            width: 2,
          )
              :_selectedIndex==index? Border.all(
            color: appcolor,
            width: 2,
          ):

          Border.all(
            color: Colors.grey,
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child:  widget.children![index],
        ),
      ),



    );
  }


  Widget _customizedDottedLine(int index, Axis axis) {
    return index < widget.children!.length - 1
        ? Padding(
          padding:  EdgeInsets.only(bottom:h.h3+8),
          child: SizedBox(
              width:widget.lineLength ,

              child:
              Divider(thickness: 2 ,color: _selectedIndex > index?appcolor:Colors.grey.withOpacity(0.5),)),
        )
        : Container();
  }

  /// The previous button.
  Widget _previousButton() {
    return IgnorePointer(
      ignoring: _selectedIndex == 0,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget.previousButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal ? Icons.arrow_left : Icons.arrow_drop_up,color: white,
            ),
        onPressed:(){}
        // _goToPreviousStep,
      ),
    );
  }

  /// The next button.
  Widget _nextButton() {
    return IgnorePointer(
      ignoring: _selectedIndex == widget.children!.length - 1,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal ? Icons.arrow_right : Icons.arrow_drop_down,color: white,
            ),
        onPressed:(){}
        // _goToNextStep,
      ),
    );
  }

  /// Contains the logic for going to the next step.
  void _goToNextStep() {
    if (_selectedIndex < widget.children!.length - 1 && widget.steppingEnabled) {
      setState(() {
        _selectedIndex++;

        if (widget.onStepReached != null) {
          widget.onStepReached!(_selectedIndex);
        }
      });
    }
  }

  /// Controls the logic for going to the previous step.
  void _goToPreviousStep() {
    if (_selectedIndex > 0) {
      setState(() {
        _selectedIndex--;

        if (widget.onStepReached != null) {
          widget.onStepReached!(_selectedIndex);
        }
      });
    }
  }
}

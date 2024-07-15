import 'package:flutter/material.dart';

class CustomStatefulBuilder extends StatefulWidget {
  const CustomStatefulBuilder({
    required this.builder,
    this.dispose,
    super.key,
  });

  final StatefulWidgetBuilder builder;
  final void Function()? dispose;

  @override
  State<CustomStatefulBuilder> createState() => _CustomStatefulBuilderState();
}

class _CustomStatefulBuilderState extends State<CustomStatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);

  @override
  void dispose() {
    super.dispose();
    if (widget.dispose != null) {
      widget.dispose!();
    }
  }
}

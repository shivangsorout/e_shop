import 'package:e_shop/core/helpers/loading/loading_screen.dart';
import 'package:flutter/material.dart';

class OverlayWrapper extends StatefulWidget {
  final Widget child;
  final dynamic viewModel;
  const OverlayWrapper({
    super.key,
    required this.child,
    required this.viewModel,
  });

  @override
  State<OverlayWrapper> createState() => _OverlayWrapperState();
}

class _OverlayWrapperState extends State<OverlayWrapper> {
  // Listener callback
  _listener() {
    if (!mounted) return;

    if (widget.viewModel.isLoading) {
      LoadingScreen().show(
        context: context,
        text: widget.viewModel.loadingText.isEmpty
            ? 'Loading..'
            : widget.viewModel.loadingText,
      );
    } else {
      LoadingScreen().hide();
    }

    if (widget.viewModel.errorMessage != null &&
        widget.viewModel.errorMessage.isNotEmpty) {
      // Add dialog box code here
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.removeListener(_listener);

      // Add listener to ViewModel to listen for isLoading changes
      widget.viewModel.addListener(_listener);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

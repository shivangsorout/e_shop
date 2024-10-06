import 'package:e_shop/core/helpers/loading/loading_screen.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingOverlayWrapper extends StatefulWidget {
  final Widget child;
  const LoadingOverlayWrapper({super.key, required this.child});

  @override
  State<LoadingOverlayWrapper> createState() => _LoadingOverlayWrapperState();
}

class _LoadingOverlayWrapperState extends State<LoadingOverlayWrapper> {
  // Listener callback
  _listener() {
    if (!mounted) return;

    AuthViewModel authVM = context.read<AuthViewModel>();
    if (authVM.isLoading) {
      LoadingScreen().show(
        context: context,
        text: authVM.loadingText.isEmpty ? 'Loading..' : authVM.loadingText,
      );
    } else {
      LoadingScreen().hide();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AuthViewModel authVM = context.read<AuthViewModel>();

      authVM.removeListener(_listener);

      // Add listener to AuthViewModel to listen for isLoading changes
      authVM.addListener(_listener);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

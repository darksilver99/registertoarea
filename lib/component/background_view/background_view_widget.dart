import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'background_view_model.dart';
export 'background_view_model.dart';

class BackgroundViewWidget extends StatefulWidget {
  const BackgroundViewWidget({super.key});

  @override
  State<BackgroundViewWidget> createState() => _BackgroundViewWidgetState();
}

class _BackgroundViewWidgetState extends State<BackgroundViewWidget> {
  late BackgroundViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackgroundViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/7588695_1414_(2).jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0x65000000),
            ),
          ),
        ],
      ),
    );
  }
}

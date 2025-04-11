import 'package:awesome_namer_together/main.dart';
import 'package:awesome_namer_together/states/my_app_state.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(appState.wordpair.asLowerCase, style: style),
      ),
    );
  }
}

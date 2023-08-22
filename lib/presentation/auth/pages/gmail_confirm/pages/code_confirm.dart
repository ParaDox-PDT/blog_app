import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/utils/extension.dart';

import '../../../../../cubits/auth/auth_cubit.dart';
import '../../../../widgets/global_textfield.dart';

class CodeConfirm extends StatelessWidget {
  const CodeConfirm({super.key, required this.codeController});

  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            20.ph,
            GlobalTextField(
                hintText: "Confirm Code",
                textInputType: TextInputType.emailAddress,
                controller: codeController,
                textInputAction: TextInputAction.next),
          ],
        );
      },
    );
  }
}

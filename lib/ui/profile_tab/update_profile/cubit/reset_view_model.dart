import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/reset_password_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword(String oldPassword, String newPassword) async {
    emit(ResetPasswordLoading());

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        emit(ResetPasswordFailure("No authentication token found."));
        return;
      }

      final response = await Dio().patch(
        "https://route-movie-apis.vercel.app/auth/reset-password",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        },
      );

      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess(response.data['message']));
      } else {
        emit(ResetPasswordFailure("Failed to reset password."));
      }
    } catch (e) {
      if (e is DioException) {
        final message = e.response?.data['message'] ?? "An error occurred";
        emit(ResetPasswordFailure("$message [${e.response?.statusCode}]"));
      } else {
        emit(ResetPasswordFailure("Unexpected error: $e"));
      }
    }
  }
}

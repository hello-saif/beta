import 'package:get/get.dart';
import '../Data/Network_caller/Network_caller.dart'; // Adjust the path as necessary
import '../Data/Urls/urls.dart'; // Adjust the path as necessary
import '../Data/model/Network_Responce.dart'; // Adjust the path as necessary

class VerifyEmailController extends GetxController {
  // Use Rx types for reactive properties
  var _inProgress = false.obs;
  var _errorMessage = ''.obs;

  // Getters for the reactive properties
  bool get inProgress => _inProgress.value;
  String get errorMessage => _errorMessage.value;

  // Method to verify email
  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress.value = true; // Start the progress indicator
    try {
      final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.verifyEmail(email),
      );
      if (response.isSuccess) {
        isSuccess = true;
      } else {
        _errorMessage.value = response.errorMessage;
      }
    } catch (e) {
      _errorMessage.value = e.toString();
    }
    _inProgress.value = false; // Stop the progress indicator
    return isSuccess;
  }
}

import 'package:code_fetch_mobile_app/constants/app_constants.dart';

class BaseRepository {

  bool _isMockMode() {
    return AppConstants.checkIsMockMode;
  }

  Future<dynamic> _performMockDataCall(String processValue) async {
    throw UnimplementedError('_performMockDataCall must be overridden');
  }

  Future<dynamic> performAPICall(Function() apiCall, String processValue) async {
    if (_isMockMode()) {
      return _performMockDataCall(processValue);
    } else {
      return await apiCall();
    }
  }

}
class WeatherException implements Exception {
  String message;
  WeatherException([this.message = 'የሆነ ስህተት ተከስቷል']) {
    message = 'የአየር ሁኔታ የተለየ: $message';
  }

  @override
  String toString() {
    return message;
  }
}

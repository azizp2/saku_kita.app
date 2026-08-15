import '../models/api_error.dart';
import 'app_exception.dart';

class ApiException extends AppException {
  final List<ApiError> errors;

  ApiException({required this.errors})
    : super(errors.isNotEmpty ? errors.first.message : 'Terjadi kesalahan.');
}


// Opsional For Multiple Line
// class ApiException extends AppException {
//   final List<ApiError> errors;

//   ApiException({
//     required this.errors,
//   }) : super(
//           errors.isNotEmpty
//               ? errors.map((e) => e.message).join('\n')
//               : 'Terjadi kesalahan.',
//         );
// }
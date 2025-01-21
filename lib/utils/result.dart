import 'package:equatable/equatable.dart';

/// Utility class to wrap result data
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
///   case Pending(): {
///     print('Pending');
///   }
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Object? error) = Error._;

  const factory Result.pending() = Pending;
}

final class Pending<T> extends Result<T> {
  const Pending();

  @override
  String toString() => 'Result<$T>.pending()';
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> with EquatableMixin {
  const Ok._(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';

  @override
  List<Object?> get props => [value];
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> with EquatableMixin {
  const Error._(this.error);

  /// Returned error in result
  final Object? error;

  @override
  String toString() => 'Result<$T>.error($error)';

  @override
  List<Object?> get props => [error];
}


abstract class Failures {
  final String errorMsg;

  Failures({required this.errorMsg});
}

class ServerFailures extends Failures {
  ServerFailures({required super.errorMsg});
}

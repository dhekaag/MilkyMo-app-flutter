import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  // api config
  static final serverUrl = dotenv.env["SERVER_URL"];

  // google cloud service cloud credentials
  static final type = dotenv.env["type"];
  static final projectId = dotenv.env["project_id"];
  static final privateKeyId = dotenv.env["private_key_id"];
  static final privateKey = dotenv.env["private_key"];
  static final clientEmail = dotenv.env["client_email"];
  static final clientId = dotenv.env["client_id"];
  static final authUri = dotenv.env["auth_uri"];
  static final tokenUri = dotenv.env["token_uri"];
  static final authProviderX509CertUrl =
      dotenv.env["auth_provider_x509_cert_url"];
  static final clientX509CertUrl = dotenv.env["client_x509_cert_url"];
  static final universeDomain = dotenv.env["universe_domain"];
}

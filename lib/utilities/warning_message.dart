class WarningMessage {
  String getMessage({required int statusCode}) {
    String message = "";
    switch (statusCode) {
      case 200:
        message = 'Ok';
        break;

      case 401:
        message = 'Accès non autorisé';
        break;

      case 403:
        message = 'Accès restreint';
        break;

      case 404:
        message = 'Page introuvable';
        break;

      case 405:
        message = 'Accès non autorisé';
        break;

      case 421:
        message = 'Mauvaise requete';
        break;

      case 498:
        message = 'Token expiré/invalide';
        break;

      case 500:
        message = 'Erreur interne du serveur';
        break;

      case 521:
        message = 'Serveur en maintenance';
        break;

      default:
        message = 'Désolé, une erreur est survenue!';
        break;
    }
    return message;
  }
}

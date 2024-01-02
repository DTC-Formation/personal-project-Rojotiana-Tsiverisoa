class AlertMessage {
  Map<String, String> getMessage({required int statusCode}) {
    String title = "";
    String message = "";

    switch (statusCode) {
      case 401:
        title = "Oupss";
        message = "Accès non autorisé!";
        break;

      case 403:
        title = "Désolé";
        message = "Accès restreint!";
        break;

      case 404:
        title = "Attention";
        message = "Veuillez remplir les champs correspondants s'il vous plaît!";
        break;

      case 405:
        title = "Désolé";
        message = 'Accès non autorisé';
        break;

      case 421:
        title = "Désolé";
        message = 'Mauvaise requete';
        break;

      case 498:
        title = "Désolé";
        message = 'Token expiré/invalide';
        break;

      case 500:
        title = "Désolé";
        message =
            "Le serveur est en maintenance pour le moment.\n Veuillez réessayer plus tard!";
        break;

      case 521:
        title = "Désolé";
        message =
            "Le serveur est en maintenance pour le moment.\n Veuillez réessayer plus tard!";
        break;

      default:
        title = "Oupss";
        message =
            "Une erreur est survenue! Veuillez réessayer s'il vous plaît.";
        break;
    }

    return {"title": title, "message": message};
  }
}

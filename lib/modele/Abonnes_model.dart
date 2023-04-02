class Abonnes {
  final String Nom;
  final String AgenceFavoris;
  final int BilletsCommandes;
  final String TypeUtilisateur;

  const Abonnes({
    required this.Nom,
    required this.AgenceFavoris,
    required this.BilletsCommandes,
    required this.TypeUtilisateur,
  });

  Abonnes copy({
    String? Nom,
    String? AgenceFavoris,
    int? BilletsCommandes,
    String? TypeUtilisateur,
  }) =>
      Abonnes(
        Nom: Nom ?? this.Nom,
        AgenceFavoris: AgenceFavoris ?? this.AgenceFavoris,
        BilletsCommandes: BilletsCommandes ?? this.BilletsCommandes,
        TypeUtilisateur: TypeUtilisateur ?? this.TypeUtilisateur,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Abonnes &&
          runtimeType == other.runtimeType &&
          Nom == other.Nom &&
          AgenceFavoris == other.AgenceFavoris &&
          BilletsCommandes == other.BilletsCommandes &&
          TypeUtilisateur == other.TypeUtilisateur;

  @override
  int get hashCode =>
      Nom.hashCode ^
      AgenceFavoris.hashCode ^
      BilletsCommandes.hashCode ^
      TypeUtilisateur.hashCode;
}

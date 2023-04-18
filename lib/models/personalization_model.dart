class Personalization {
  final String prev_industry;
  final String prev_jobTitle;
  final String skills;
  final String pref_industry;
  final String job_title;
  final bool hasTarget;
  final String? targetCompany;
  final String? companyListing;

  Personalization({
    required this.prev_industry,
    required this.prev_jobTitle,
    required this.skills,
    required this.pref_industry,
    required this.job_title,
    required this.hasTarget,
    this.targetCompany,
    this.companyListing,
  });

  toJson() => {
        "prev_industry": prev_industry,
        "prev_jobTitle": prev_jobTitle,
        "skills": skills,
        "pref_industry": pref_industry,
        "job_title": job_title,
        "hasTarget": hasTarget,
        "targetCompany": targetCompany,
        "companyListing": companyListing,
      };
}

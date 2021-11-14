class Release {
  const Release({
    required this.packageName,
    required this.track,
    required this.version,
    required this.status,
    this.releaseName,
    this.releaseNotes,
  });

  final String packageName;
  final String track;
  final String version;
  final String status;
  final String? releaseName;
  final String? releaseNotes;
}

class UploadBundle {
  const UploadBundle({
    required this.bundlePath,
    required this.packageName,
  });

  final String bundlePath;
  final String packageName;
}

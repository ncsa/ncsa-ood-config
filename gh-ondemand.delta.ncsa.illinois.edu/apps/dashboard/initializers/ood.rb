Rails.application.config.after_initialize do
  OodFilesApp.candidate_favorite_paths.tap do |paths|
    paths << FavoritePath.new("/projects")
    paths << FavoritePath.new("/taiga")
    paths << FavoritePath.new("/work")
  end
end

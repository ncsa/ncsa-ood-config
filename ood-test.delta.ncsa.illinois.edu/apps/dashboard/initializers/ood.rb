Rails.application.config.after_initialize do
  OodFilesApp.candidate_favorite_paths.tap do |paths|
    paths << FavoritePath.new("/ime")
    paths << FavoritePath.new("/old_scratch")
    paths << FavoritePath.new("/projects")
    paths << FavoritePath.new("/scratch")
    paths << FavoritePath.new("/taiga")
    paths << FavoritePath.new("/work")
  end
end

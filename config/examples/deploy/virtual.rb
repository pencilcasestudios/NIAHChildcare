# Ref: http://gist.github.com/293302
server DEPLOYMENT_CONFIG["virtual_server_name"], :web, :app, :db, primary: true
set :deployment_path, DEPLOYMENT_CONFIG["virtual_deployment_path"]
set :deploy_to, "#{applications_folder}/#{application}/#{deployment_path}"

# Don't forget to make this repo on the server
set :repository_server_name, DEPLOYMENT_CONFIG["virtual_server_name"]
set :repository, "#{user}@#{repository_server_name}:/var/Repositories/Git/#{application}.git"
# Don't forget to make this branch in the repository
set :branch, DEPLOYMENT_CONFIG["virtual_repository_deployment_branch"]




# Deployment dependencies
# Ref: https://github.com/capistrano/capistrano/wiki/Capistrano-Tasks#deploycheck
depend :remote, :writable, "#{asset_vault_path}/#{application}/Images/"




namespace :deploy do
  desc "Synchronise assets"
  task :sync_assets do
    # Upload assets to the AssetsVault
    run_locally "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded ~/Code/Rails/#{application}/app/assets/images/ #{user}@#{DEPLOYMENT_CONFIG["virtual_server_name"]}:#{asset_vault_path}/#{application}/Images/"

    # Sync assets from the AssetsVault to the deployed application
    run "rsync --verbose --stats --progress --compress --archive --partial --recursive --times --perms --links --delete --exclude '.*' --delete-excluded #{asset_vault_path}/#{application}/Images/ #{shared_path}/images/"
  end
end

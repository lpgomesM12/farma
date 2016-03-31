set :stage, :production
server '104.131.87.159', user: 'deploy', roles: %w{web app db}
OmniauthData = YAML.load_file(Rails.root.join('config', 'omniauth_config.yml'))[‘omniauth_keys’]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram,   OmniauthData[instagram]['token'],   OmniauthData[‘instagram’]['key']
end

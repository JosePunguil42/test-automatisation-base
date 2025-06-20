function fn() {
  var env = karate.env || 'local';

  // Configuración base para todos los entornos
  var config = {
    baseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  };

  // URLs para todos los microservicios (nombrados con formato port_nombre_microservicio)
  config.port_marvel_characters_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com';

  // Configuración específica por entorno
  if (env == 'dev') {
    config.baseUrl = 'https://api-dev.empresa.com';
    config.port_marvel_characters_api = 'https://api-dev.empresa.com/marvel-characters-api';
  } 
  else if (env == 'qa') {
    config.baseUrl = 'https://api-qa.empresa.com';
    config.port_marvel_characters_api = 'https://api-qa.empresa.com/marvel-characters-api';
  }

  return config;
}

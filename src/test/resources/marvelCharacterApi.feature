@REQ_HU-CTN-7170 @HU7170 @marvel_characters_api @marvel_characters_api @Agente2 @E2 @iniciativa_marvel_characters
Feature: HU-CTN-7170 Gestión de personajes Marvel (microservicio para CRUD de personajes)
  Background:
    * url port_marvel_characters_api
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @obtenerPersonajes @solicitudExitosa200
  Scenario: T-API-HU-CTN-7170-CA01-Obtener todos los personajes exitosamente 200 - karate
    Given path '/testuser/api/characters'
    When method GET
    Then status 200
    # And match response == read('classpath:data/marvel_characters_api/response_empty_list.json')

  @id:2 @obtenerPersonajePorId @solicitudExitosa200
  Scenario: T-API-HU-CTN-7170-CA02-Obtener personaje por ID exitosamente 200 - karate
    Given path '/testuser/api/characters', '1'
    When method GET
    Then status 200
    # And match response == read('classpath:data/marvel_characters_api/response_character_ok.json')

  @id:3 @obtenerPersonajePorId @noEncontrado404
  Scenario: T-API-HU-CTN-7170-CA03-Obtener personaje por ID no existente 404 - karate
    Given path '/testuser/api/characters', '999'
    When method GET
    Then status 404
    # And match response == read('classpath:data/marvel_characters_api/response_character_not_found.json')

  @id:4 @crearPersonaje @solicitudExitosa201
  Scenario: T-API-HU-CTN-7170-CA04-Crear personaje exitosamente 201 - karate
    Given path '/testuser/api/characters'
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request jsonData
    When method POST
    Then status 201
    # And match response == read('classpath:data/marvel_characters_api/response_character_ok.json')

  @id:5 @crearPersonaje @nombreDuplicado400
  Scenario: T-API-HU-CTN-7170-CA05-Crear personaje con nombre duplicado 400 - karate
    Given path '/testuser/api/characters'
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_duplicate.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response == read('classpath:data/marvel_characters_api/response_character_duplicate.json')

  @id:6 @crearPersonaje @faltanCampos400
  Scenario: T-API-HU-CTN-7170-CA06-Crear personaje con campos requeridos faltantes 400 - karate
    Given path '/testuser/api/characters'
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character_missing_fields.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response == read('classpath:data/marvel_characters_api/response_character_missing_fields.json')

  @id:7 @actualizarPersonaje @solicitudExitosa200
  Scenario: T-API-HU-CTN-7170-CA07-Actualizar personaje exitosamente 200 - karate
    Given path '/testuser/api/characters', '1'
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 200
    # And match response == read('classpath:data/marvel_characters_api/response_character_ok.json')

  @id:8 @actualizarPersonaje @noEncontrado404
  Scenario: T-API-HU-CTN-7170-CA08-Actualizar personaje no existente 404 - karate
    Given path '/testuser/api/characters', '999'
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 404
    # And match response == read('classpath:data/marvel_characters_api/response_character_not_found.json')

  @id:9 @eliminarPersonaje @solicitudExitosa204
  Scenario: T-API-HU-CTN-7170-CA09-Eliminar personaje exitosamente 204 - karate
    Given path '/testuser/api/characters', '1'
    When method DELETE
    Then status 204
    # And match response == ''

  @id:10 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-HU-CTN-7170-CA10-Eliminar personaje no existente 404 - karate
    Given path '/testuser/api/characters', '999'
    When method DELETE
    Then status 404
    # And match response == read('classpath:data/marvel_characters_api/response_character_not_found.json')

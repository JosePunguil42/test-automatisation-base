import com.intuit.karate.junit5.Karate;

class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
    }
    @Karate.Test
    Karate testMarvelApi() {
        return Karate.run("classpath:com/pichincha/features/marvel_characters_api/marvelCharactersApi.feature");
    }

}

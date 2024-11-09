function fn() {
    karate.configure('connectTimeout', 10000); //Timeout de conexión por si la api se cae o tiene problemas
    karate.configure('readTimeout', 10000); //Tiempo de lectura de respuesta

    return {
        api: {
           baseUrl: 'http://api.geonames.org/'
        },
        user: {
            name: 'karate'
        }
    };
}
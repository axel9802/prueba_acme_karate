function fn() {
    karate.configure('connectTimeout', 10000); //Timeout de conexión por si la api se cae o tiene problemas
    karate.configure('readTimeout', 10000); //Tiempo de lectura de respuesta

    var baseUrl = karate.properties['baseUrl'] || 'http://api.geonames.org/' //Trae la variable baseUrl desde .gradle y si no la encuentra pone la que está explicita aqui
    var user = karate.properties['user'] || 'karate' //Trae la variable user desde .gradle y si no la encuentra pone la que está explicita aqui

 return {
        api: {
           baseUrl: baseUrl
        },
        user: {
            name: user
        }
    };
}
# web-ttyd

Este es un ambiente que usa Traefik 1.7.7 para construir un entorno web donde pueden entrar usuarios a probar diversos SAST.

Lo he usado en cursos de programación segura.

ATENCION: Este repo contiene código inseguro a propósito en la carpeta exercises.

Se agredece aportes a seguridad en la infraestructura. Gracias

## En qué consiste

Esto permite construir un entorno web que se puede usar como laboratorio de clases.

Si lo instalas en el dominio TU_DOMINIO.COM entonces

   - TU_DOMINIO.COM/ttyd : le da acceso a los alumnos a una consola con acceso a un entorno linux que tiene instalado varios SAST open source
  
En este entorno se encuentran varias aplicaciones en la carpeta o directorio ~/exercise, la idea es que los alumnos ejecuten analisis SAST sobre estas.

Ejemplo:

    $ bandit -f html -o ${REPORT_DIR}/nombre_del_alumno_djangoat.html -r ~/exercise/DjanGoat 
 
Luego el alumno puede acceder a este sitio:

    TU_DOMINIO.COM/web/reportes/nombre_del_alumno_djangoat.html 

Para revisar el resultado del análisis del SAST badit.


## SAST incluidos en esta versión

  - bandit: para python
  - brakeman: para ruby on rails
  - find-sec-bugs: para analizar archivos .jar java
  
Uso:

    $ bandit -f html -o ${REPORT_DIR}/nombre_del_alumno_python_app.html -r ~/exercise/APP_PYTHON
    
    $ brakeman -f html -o ${REPORT_DIR}/nombre_del_alumno_ruby_app.html -r ~/exercise/APP_RUBY_ON_RAILS
    
    $ ~/bin/findsecbugs.sh -output ${REPORT_DIR}/nombre_del_alumno_java_app.html -html -progress APP_JAVA.jar
    
    
## Configuración

Modificar `traefik.toml`con los parametros <YOUR DOMAIN> y <YOUR EMAIL> estos son usados por Traefik para solicitar certificados a LetsEncrypt.
  
Luego crear un archivo `.env` a partir de `.env-sample`, creo que es bien claro lo que se debe configurar, se repiten variables pero esto es así porque hasta donde sé TOML no lee variables de entorno.


### Nota Importante

El archivo Dockerfile en `ttyd-custom` tiene definido en la última linea las credenciales que se usa para acceder al terminal, hoy tiene en duro el valor `USER:PASSWORD` esto hay que cambiarlo por las credenciales que quieras usar. 

Esto es un bug de esta versión, esto deberia tomarlo de una variable de ambiente.

## Ejecución

Esto se debe colocar en un entorno que tenga docker-compose y ejecutar:

    $ docker-compose up --build -d
    

# Autoría y Uso

Puedes usarlo en cualquier proyecto siempre que menciones al autor de este trabajo.

Autor: Eduardo Díaz Cortés

(c) 2020 Eduardo Díaz Cortés



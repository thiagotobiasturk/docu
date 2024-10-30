# Guía de Uso de Postman

## 1. ¿Cómo configuras y ejecutas una solicitud en Postman?

Para configurar y ejecutar una solicitud en Postman, sigue estos pasos:

1. **Selecciona el método HTTP**: Escoge el método adecuado (como GET, POST, PUT, etc.).
  
2. **Introduce la URL del endpoint**: Por ejemplo, `https://api.example.com/users`.

3. **Añade encabezados y parámetros**: Si tu solicitud necesita encabezados o parámetros, añádelos según sea necesario.

4. **Configura el cuerpo de la solicitud**: Para un método POST que envía datos de usuario, configura el cuerpo en formato JSON, como se muestra a continuación:

    ```json
    {
      "name": "John Doe",
      "email": "johndoe@example.com"
    }
    ```

5. **Ejecuta la solicitud**: Haz clic en "Send" para ejecutar la solicitud. Verás la respuesta en la sección de resultados.


## 2. ¿Cómo gestionas y utilizas variables en Postman?

Para gestionar y utilizar variables en Postman, sigue estos pasos:

1. **Definir una variable de entorno**: Supongamos que tienes una variable de entorno llamada `{{base_url}}` que guarda la URL base de la API. Puedes definirla en "Manage Environments".

2. **Usar la variable en la URL de tus solicitudes**: Puedes utilizar la variable en la URL de tus solicitudes de la siguiente manera: `{{base_url}}/users`.

3. **Acceder a la variable en una prueba**: Para acceder a la variable en una prueba, utiliza el siguiente comando:
    ```javascript
    pm.environment.get("base_url");
    ```

Las variables pueden ser de entorno, colección o globales, dependiendo de la configuración que necesites.

## 3. ¿Cómo configuras autenticación en Postman para probar una API?

Para configurar la autenticación en Postman, sigue estos pasos:

1. **Seleccionar el tipo de autenticación**: En la pestaña "Authorization", elige el tipo de autenticación que necesitas. Por ejemplo, selecciona **Bearer Token** para APIs que requieren autenticación con token.

2. **Introducir el token**: Introduce el token en el campo correspondiente:
    ```
    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
    ```

Esto añadirá automáticamente el token a la solicitud, permitiéndote acceder a recursos protegidos.

## 3. ¿Qué es una colección en Postman y cómo la usas en tus pruebas?

Una colección en Postman es un grupo de solicitudes que puedes organizar para pruebas específicas. Por ejemplo, puedes crear una colección llamada **"API de Usuarios"** que incluya solicitudes como:

- `GET /users`
- `POST /users`
- `PUT /users/{id}`
- `DELETE /users/{id}`

Esto facilita la ejecución de un conjunto de pruebas completo y te permite reutilizar la colección en múltiples entornos.

## 4. ¿Cómo se implementan pruebas automatizadas en Postman?

Para implementar pruebas automatizadas en Postman, sigue estos pasos:

1. **Accede a la pestaña "Tests"**: En la interfaz de Postman, dirígete a la pestaña "Tests".

2. **Agregar scripts de prueba**: Puedes agregar scripts para validar las respuestas. Por ejemplo, para verificar que el código de respuesta sea 200 y que el campo `status` en la respuesta sea "success", utiliza el siguiente código:

    ```javascript
    pm.test("Status code is 200", function () {
        pm.expect(pm.response.code).to.eql(200);
    });

    pm.test("Response status is success", function () {
        const jsonData = pm.response.json();
        pm.expect(jsonData.status).to.eql("success");
    });
    ```

Estas pruebas se ejecutarán cada vez que envíes la solicitud, automatizando así la validación de los datos en la respuesta.

## 4. ¿Cómo utilizas las pre-request scripts en Postman?

Los **pre-request scripts** en Postman son útiles para preparar datos antes de enviar la solicitud. Por ejemplo, si necesitas generar un token cada vez que se envía una solicitud, puedes hacer lo siguiente:

```javascript
pm.environment.set("auth_token", "Bearer " + generateToken());
```

## 6. ¿Qué sabes sobre la ejecución de colecciones en Newman?

Para ejecutar una colección en **Newman**, el CLI de Postman, utiliza el siguiente comando:

```bash
newman run MyCollection.json -e DevEnvironment.json
```
## 7. ¿Cómo manejas diferentes entornos en Postman y qué ventajas tiene?

Los **entornos** en Postman te permiten definir variables como la URL base en diferentes configuraciones, como Development, Staging y Production. 

En lugar de cambiar la URL manualmente, puedes configurar una variable `{{base_url}}` y seleccionar el entorno deseado en el menú de entornos. Esto facilita el cambio entre entornos y mantiene la consistencia en las pruebas. Las ventajas de usar entornos incluyen:

- **Facilidad de configuración**: Cambiar variables globalmente sin modificar cada solicitud individualmente.
- **Consistencia**: Asegurar que todas las pruebas se ejecuten con los mismos valores de variable en un entorno determinado.
- **Organización**: Mantener un conjunto de configuraciones específicas para diferentes etapas del desarrollo.

## 8. ¿Puedes explicar cómo escribir una prueba en Postman para validar datos específicos en una respuesta JSON?

Supongamos que la respuesta de una API es la siguiente:

```json
{
  "user": {
    "name": "John Doe",
    "email": "johndoe@example.com",
    "status": "active"
  }
}
```
Para verificar que el name sea John Doe, puedes escribir:

```javascript

const jsonData = pm.response.json();
pm.test("User name is John Doe", function () {
    pm.expect(jsonData.user.name).to.eql("John Doe");
});
```

Esto valida datos específicos de la respuesta JSON.

## 9. ¿Cómo puedes hacer una prueba de rendimiento básica en Postman?

Para realizar una prueba de rendimiento básica y evaluar el tiempo de respuesta, puedes escribir un script de prueba que verifique si el tiempo de respuesta es menor a 200 ms:

```javascript
pm.test("Response time is less than 200ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(200);
});
```
Esto asegura que la API responda en un tiempo aceptable, lo cual es importante en pruebas de rendimiento básicas.

Estas respuestas con ejemplos detallados te ayudarán a demostrar tus conocimientos prácticos sobre Postman en una entrevista técnica.







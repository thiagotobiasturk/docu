# QA Manual

## ¿Qué es ser un QA Manual?

Un QA Manual (Quality Assurance) es un profesional encargado de garantizar la calidad del software a través de pruebas manuales, sin usar herramientas de automatización. Su objetivo principal es identificar defectos o inconsistencias en el comportamiento del software para asegurar que el producto cumpla con los requerimientos y funcione correctamente para el usuario final.

El QA Manual sigue casos de prueba detallados y verifica las funcionalidades de una aplicación según los criterios de aceptación. Esto implica una atención minuciosa al detalle, una comprensión profunda de los flujos de trabajo y el comportamiento esperado del sistema, así como una capacidad para documentar los problemas encontrados.

## Ciclo de Vida de Desarrollo del Software (SDLC)

El ciclo de vida de desarrollo del software (SDLC) es el proceso estructurado que sigue un equipo de desarrollo para crear software. Los principales pasos donde participa un QA Manual son:

1. **Recolección de Requisitos**: El QA participa para entender lo que debe cumplir el software, generalmente basado en historias de usuario o especificaciones del cliente.
   
2. **Diseño**: En esta etapa, se detallan las funcionalidades y la arquitectura del sistema. El QA puede participar revisando documentos de diseño para planificar futuras pruebas.
   
3. **Desarrollo**: Los desarrolladores crean el código. El QA prepara los casos de prueba y criterios de aceptación para evaluar el software cuando esté listo para ser probado.
   
4. **Pruebas**: Esta es la etapa clave para el QA, donde se ejecutan diferentes tipos de pruebas para encontrar errores y asegurar que el software cumple con los requisitos.
   
5. **Implementación**: El software se lanza a producción, y el QA puede realizar pruebas de validación antes de su lanzamiento.
   
6. **Mantenimiento**: Después del lanzamiento, el QA puede realizar pruebas de regresión para asegurar que el software sigue funcionando bien tras los cambios.

## Historias de Usuario (User Stories)

Las historias de usuario son descripciones breves de una funcionalidad desde el punto de vista del usuario final. Estas historias ayudan al equipo de QA a entender qué se espera que haga el software. Cada historia de usuario tiene criterios de aceptación, que son las condiciones que deben cumplirse para que la historia sea considerada completa.

**Ejemplo de historia de usuario:**

"Como usuario, quiero poder iniciar sesión en la aplicación para acceder a mis datos personales."

Los criterios de aceptación para esta historia podrían ser:

- El usuario debe poder ingresar su nombre de usuario y contraseña.
- El sistema debe validar las credenciales.
- Si son correctas, debe redirigir al usuario a su perfil.

## Casos de Prueba (Test Cases)

Un caso de prueba es un conjunto de condiciones y acciones que deben ejecutarse para verificar si una funcionalidad del software funciona como se espera. Un buen caso de prueba incluye:

- Un identificador único.
- La descripción del objetivo del test.
- Los pasos para reproducir la prueba.
- El resultado esperado.

**Ejemplo de caso de prueba para la historia anterior:**

- **ID**: TC001
- **Descripción**: Verificar que el usuario pueda iniciar sesión correctamente.
- **Pasos**:
  1. Abrir la aplicación.
  2. Ingresar nombre de usuario válido.
  3. Ingresar contraseña válida.
  4. Hacer clic en "Iniciar sesión".
- **Resultado esperado**: El sistema debe redirigir al usuario a su perfil.

## Tipos de Pruebas en QA Manual

Un QA Manual realiza varios tipos de pruebas, dependiendo de lo que se necesita verificar. Aquí algunos de los más comunes:

### Pruebas Funcionales

Verifican que el software cumple con los requisitos funcionales especificados. Se centran en si cada funcionalidad hace lo que se espera, como iniciar sesión, enviar formularios, o realizar cálculos.

**Ejemplo**: Probar si un usuario puede completar una compra en línea.

### Pruebas No Funcionales

Evalúan aspectos no relacionados con las funciones específicas, como el rendimiento, la usabilidad, la seguridad, o la capacidad de carga.

**Ejemplo**: Verificar cuántos usuarios simultáneos puede manejar la aplicación antes de que se degrade el rendimiento.

### Pruebas de Regresión

Se ejecutan después de que se haya introducido un cambio o actualización en el software para asegurar que los cambios no hayan afectado las funcionalidades existentes.

**Ejemplo**: Si se actualiza el sistema de pago, se realizan pruebas de regresión para verificar que el resto del proceso de compra siga funcionando correctamente.

### Pruebas de Integración

Verifican que diferentes módulos o componentes del sistema funcionen juntos correctamente.

**Ejemplo**: Comprobar si el sistema de pago se integra bien con el sistema de inventario después de una compra.

### Pruebas Exploratorias

Son pruebas no estructuradas donde el QA explora la aplicación libremente para detectar posibles problemas. Estas pruebas se suelen realizar cuando se tiene poco tiempo para documentar casos de prueba formales o en etapas tempranas de desarrollo.

**Ejemplo**: Navegar por una nueva funcionalidad para descubrir comportamientos inesperados.

### Pruebas Basadas en Criterios de Aceptación

Las pruebas basadas en criterios de aceptación están diseñadas para validar que una funcionalidad cumple exactamente con las condiciones establecidas en la historia de usuario. Estos criterios proporcionan un objetivo claro para las pruebas, y si no se cumplen, la historia no se considera "hecha".

### Pruebas Estructuradas vs. Exploratorias

- **Pruebas estructuradas**: Son aquellas que se realizan siguiendo un plan de pruebas detallado con casos de prueba específicos. Se utilizan principalmente para pruebas funcionales, de regresión e integración.

- **Pruebas exploratorias**: Son más ad-hoc y libres. El tester explora diferentes partes del sistema sin un guion fijo, lo que le permite descubrir defectos ocultos o comportamientos no previstos.

## Criterios de Aceptación

Los criterios de aceptación son condiciones predefinidas que una funcionalidad debe cumplir para ser aceptada como completa. Los QA los utilizan para diseñar sus pruebas y asegurar que el software cumple con los requisitos del cliente.

## Pruebas de Caja Negra y Caja Blanca

### Pruebas de Caja Negra

Son pruebas en las que el tester no tiene conocimiento del código o la lógica interna del sistema. Se enfoca en las entradas y salidas del sistema, verificando si las funcionalidades cumplen con lo esperado sin analizar cómo se implementaron.

### Pruebas de Caja Blanca

A diferencia de la caja negra, las pruebas de caja blanca implican el conocimiento del código y la estructura interna del software. El QA se asegura de que el código funcione correctamente revisando los caminos lógicos y las condiciones.

## Pruebas de Usabilidad

Son pruebas que buscan evaluar qué tan fácil es para los usuarios interactuar con la aplicación. El enfoque está en la experiencia del usuario, la interfaz, la navegación y la accesibilidad.

## Conclusión

En resumen, el trabajo de un QA Manual implica el diseño y ejecución de una amplia gama de pruebas para asegurar que el software cumple con los requerimientos funcionales y no funcionales, asegurando que el producto es robusto, confiable y fácil de usar para los usuarios finales. Un buen QA se enfoca en encontrar errores antes de que lleguen al usuario final, colabora estrechamente con los desarrolladores y el equipo de producto, y tiene un enfoque en la calidad en cada etapa del ciclo de vida del software.

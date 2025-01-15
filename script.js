https://docs.google.com/document/d/1yT2k5Vhv7P0_fV7lofs3QbqRAi-MofwnoDWrXQIcy70/export?format=pdf
This is documentation related to App-gateway logs
const { exec } = require('child_process');

// Comando para obtener las funciones Lambda
const awsCommand = 'aws lambda list-functions --output json --query "Functions[].FunctionName" --profile my-profile';

// Función para ejecutar el comando AWS y manejar la salida
function executeAwsCommand(callback) {
    exec(awsCommand, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing command: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return;
        }

        // Llamamos al callback con la salida del comando (stdout)
        callback(stdout);
    });
}

// Función para simular el "Enter" (solo para interactuar con la salida)
function pressEnter() {
    process.stdin.write('\n');
}

// Función para manejar la paginación de la salida
function handlePagination(output) {
    let morePages = true;
    let retries = 0;
    const maxRetries = 10; // Limitar el número de intentos, ajusta según sea necesario

    // Función que procesa la salida y verifica si hay más resultados
    function processOutput() {
        // Imprimir la salida de la función Lambda
        console.log(output);

        // Verificar si hay más resultados en la salida (NextMarker indica más páginas)
        if (!output.includes("NextMarker") || retries >= maxRetries) {
            console.log("No more pages or max retries reached.");
            morePages = false;
        }

        if (morePages) {
            retries++;

            // Simular presionar Enter cada segundo para avanzar a la siguiente página
            setTimeout(() => {
                executeAwsCommand(handlePagination); // Ejecutar de nuevo el comando para obtener más funciones
            }, 1000); // Esperar 1 segundo antes de continuar con el siguiente intento
        }
    }

    processOutput(); // Iniciar el procesamiento
}

// Ejecutar el comando y manejar la paginación
executeAwsCommand(handlePagination);

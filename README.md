# LSS-Development-CRUD-Server

> **Nota:** La aplicación de este proyecto se encuentra <a href="https://github.com/FabianMaEs/LSS-Development-CRUD" target="_blank">aquí</a>

Este proyecto es un servidor desarrollado con Node.js y Express que se conecta a una base de datos SQL externa.

# Configuración y ejecución del servidor

1. Instala las dependencias
    - `npm install `
2. Descarga la base de datos
    - Descarga el archivo `base_de_datos.sql` e impórtalo en tu gestor de bases de datos SQL.
    - Verifica que las credenciales de la configuración de la conexión a la base de datos en el archivo index.js sean correctas (host, user, password y database)
3. Una vez configurado, inicia el servidor
    - `npm start` o `nodemon index.js`
4. El servidor estará disponible en <a href="http://localhost:3000" target="_blank">http://localhost:3000</a> por defecto para realizar las operaciones CRUD en conjunto con la aplicación.

# Tecnologías utilizadas

- Node.js
- Express.js
- MySQL Workbench
- Angular
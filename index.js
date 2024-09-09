const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;
const cors = require('cors');
app.use(cors());

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Hola mundo!');
});

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'gestor_salas'
});

// Conectar a la base de datos
connection.connect(err => {
    if (err) {
        console.error('Error conectando a la base de datos:', err);
        return;
    }
    console.log('Conectado a la base de datos.');
});

// Ruta genérica para ejecutar una consulta SQL
const executeQuery = (res, query) => {
    connection.query(query, (err, results) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(results);
        }
    });
};

// Definir rutas para cada tabla
app.get('/salas', (req, res) => {
    executeQuery(res, 'SELECT * FROM sala');
    console.log("Salas obtenidas");
});

app.get('/reservas', (req, res) => {
    executeQuery(res, 'SELECT * FROM reserva');
    console.log("Reservas obtenidas");
});

app.get('/sala/:id', (req, res) => {
    const id = req.params.id;
    const query = 'SELECT * FROM sala WHERE id = ?';
    connection.query(query, [id], (err, results) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(results);
        }
    });
});


app.get('/verificar_usuario/:nombre', (req, res) => {
    const nombre = req.params.nombre;
    const sqlQuery = `SELECT * FROM usuario WHERE nombre = ?`;

    connection.query(sqlQuery, [nombre], (err, results) => {
        if (err) {
            res.status(500).send(err);
            console.log("Error al verificar usuario: " + nombre);
        } else {
            res.json(results);
            console.log("Usuario verificado: " + nombre);
        }
    });
});

app.post('/registro_usuario', (req, res) => {
    const { usuario } = req.body;
    const query = 'INSERT INTO usuario (nombre) VALUES (?)';
    connection.query(query, [usuario], (err, results) => {
        if (err) {
            res.status(500).send(err);
            console.log("Error al registrar usuario: " + usuario);
        } else {
            res.json(results);
            console.log("Usuario registrado: " + usuario);
        }
    });
});

app.post('/agregar_reserva', (req, res) => {
    const { fecha, horaInicio, horaFin, usuario, idSala } = req.body;
    const query = 'INSERT INTO reserva (fecha, horaInicio, horaFin, usuario, id_sala) VALUES (?, ?, ?, ?, ?)';
    connection.query(query, [fecha, horaInicio, horaFin, usuario, idSala], (err, results) => {
        if (err) {
            res.status(500).send(err);
            console.log("Error al agregar reserva");
        } else {
            res.json(results);
            console.log("Reserva agregada");
        }
    });
});

app.delete('/eliminar_reserva/:fecha/:horaInicio/:id_sala', (req, res) => {
    const { fecha, horaInicio, id_sala } = req.params;
    const query = 'DELETE FROM reserva WHERE fecha = ? AND horaInicio = ? AND id_sala = ?';
    connection.query(query, [fecha, horaInicio, id_sala], (err, results) => {
        if (err) {
            res.status(500).send(err);
            console.log("Error al eliminar reserva");
        } else {
            res.json(results);
            console.log("Reserva eliminada");
        }
    });
});

app.post('/agregar_sala', (req, res) => {
    const { nombre } = req.body;
    const query = 'INSERT INTO sala (nombre) VALUES (?)';
    connection.query(query, [nombre], (err, results) => {
        if (err) {
            res.status(500).send(err);
            console.log("Error al agregar sala");
        } else {
            res.json(results);
            console.log("Sala agregada");
        }
    });
});

module.exports = connection;
app.listen(port, () => {
  console.log(`Servidor en http://localhost:${port}`);
});

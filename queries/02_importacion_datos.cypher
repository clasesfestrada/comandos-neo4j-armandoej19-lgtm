// IMPORTAR DATOS

// 1. Importar Estudiantes
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
    id: row.id,
    nombre: row.nombre,
    carrera: row.carrera,
    semestre: toInteger(row.semestre)
});

// 2. Importar Materias
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/materias.csv'
AS row

CREATE (:Materia {
    id: row.id,
    nombre: row.nombre,
    area: row.area
});

// 3. Importar Profesores
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/profesores.csv'
AS row

CREATE (:Profesor {
    id: row.id,
    nombre: row.nombre,
    departamento: row.departamento
});

// Crear Relaciones de Inscripción
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/inscripciones.csv'
AS row
MATCH (e:Estudiante {id: trim(row.estudiante_id)})
MATCH (m:Materia {id: trim(row.materia_id)})
CREATE (e)-[:INSCRITO_EN {
  calificacion: toFloat(row.calificacion),
  periodo: row.periodo
}]->(m);

// Crear Relaciones de Amistades
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/amistades.csv'
AS row
MATCH (e1:Estudiante {id: trim(row.estudiante_origen)})
MATCH (e2:Estudiante {id: trim(row.estudiante_destino)})
CREATE (e1)-[:AMIGO_DE {desde: row.desde, nivel: row.nivel}]->(e2);

// Crear Relaciones de Impartición
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/imparticiones.csv'
AS row
MATCH (p:Profesor {id: trim(row.profesor_id)})
MATCH (m:Materia {id: trim(row.materia_id)})
CREATE (p)-[:IMPARTE {anio: row.anio, semestre: row.semestre}]->(m);

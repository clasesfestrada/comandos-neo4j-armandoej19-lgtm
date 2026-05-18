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

CREATE (:Materias {
    id: row.id,
    nombre: row.nombre,
    area: row.area
});

// 3. Importar Profesores
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/profesores.csv'
AS row

CREATE (:Profesores{
    id: row.id,
    nombre: row.nombre,
    departamento: row.departamento
});

// Crear Relaciones de Inscripción (Paso 11)
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/inscripciones.csv'
AS row
MATCH (e:Estudiante {id: row.id_estudiante})
MATCH (m:Materia {id: row.id_materia})
CREATE (e)-[:INSCRITO_EN {
  calificacion: toFloat(row.calificacion),
  periodo: row.periodo
}]->(m);

// Crear Relaciones de Amistades (Paso 12)
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/amistades.csv'
AS row
MATCH (e1:Estudiante {id: row.id_estudiante1})
MATCH (e2:Estudiante {id: row.id_estudiante2})
CREATE (e1)-[:AMIGO_DE {desde: row.desde, nivel: row.nivel}]->(e2);

// Crear Relaciones de Imparticion (Paso 13)
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/imparticiones.csv'
AS row
MATCH (p:Profesor {id: row.id_profesor})
MATCH (m:Materia {id: row.id_materia})
CREATE (p)-[:IMPARTE {anio: row.anio, semestre: row.semestre}]->(m);
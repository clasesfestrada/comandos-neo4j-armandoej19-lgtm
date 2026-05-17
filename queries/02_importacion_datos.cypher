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
    //imports
});

// 3. Importar Profesores
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-armandoej19-lgtm/main/data/profesores.csv'
AS row

CREATE (:Profesores{
    //imports
});

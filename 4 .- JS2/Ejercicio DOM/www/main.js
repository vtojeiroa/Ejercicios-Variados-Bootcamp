"use strict";
/*
Ejercicio DOM 1
☑ Cargar este archivo de javascript desde un documento HTML sin 
  ningún contenido.
☑ A partir de los datos del objeto de abajo crear una <table> en el
  body usando los métodos del DOM aprendidos hasta ahora.
☑ La <table> debe de tener un caption, una fila de <th> con el  
  nombre de las columnas y 5 filas con los datos
☑ La tabla debe de tener un CSS que diferencie visualmente la fila de 
  cabecera y las filas de datos
☑ BONUS: detectar y destacar visualmente los valores mayores y menores
  de cada fila.
*/

function buildCaption(text) {
  const caption = document.createElement("caption");
  caption.textContent = text;

  return caption;
}

function buildTableHeader(data) {
  const tableHeader = document.createElement("tr");

  for (const headerElementText of data) {
    const headerElement = document.createElement("th");
    headerElement.textContent = headerElementText;
    tableHeader.append(headerElement);
  }

  return tableHeader;
}

function buildTableRow(rowData) {
  const tableRow = document.createElement("tr");

  const highValue = Math.max(...rowData);
  const lowValue = Math.min(...rowData);

  for (const rowElementText of rowData) {
    const rowElement = document.createElement("td");

    if (rowElementText === highValue) {
      rowElement.classList.add("high");
    }

    if (rowElementText === lowValue) {
      rowElement.classList.add("low");
    }

    //si el valor es el mayor del array poner clase hight, si no clase low
    rowElement.textContent = rowElementText;
    tableRow.append(rowElement);
  }

  return tableRow;
}

function buildTable() {
  // Crear tabla vacía
  const tableElement = document.createElement("table");

  // Meter un caption en la tabla
  const caption = buildCaption(tableData.caption);
  tableElement.append(caption);

  // Meter una cabecera en la tabla
  const header = buildTableHeader(tableData.columns);
  tableElement.append(header);

  // Meter n filas de datos en la tabla
  for (const dataRow of tableData.data) {
    const row = buildTableRow(dataRow);
    tableElement.append(row);
  }

  //devolver la tabla
  return tableElement;
}

const root = document.querySelector("#root");

const table = buildTable();
root.append(table);

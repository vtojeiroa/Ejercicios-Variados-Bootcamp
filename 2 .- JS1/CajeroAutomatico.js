'use strict';

/**
 * 1. Clase Cliente: nombre, apellido, monedero.
 *
 * 2. Clase Cajero: id, ingresarSaldo(), retirarSaldo(), verSaldo().
 *
 * 3. Clase Banco: nombre, abrirCuenta().
 *
 * 4. Clase CuentaCliente: id, nombreCliente, apellidoCliente, saldo.
 *
 */

// ###############################
// ### C l a s s   C l i e n t ###
// ###############################
class Client {
  constructor(name, surname, wallet) {
    this.name = name;
    this.surname = surname;
    this.wallet = wallet;
  }
}

// ###############
// ### B a n k ###
// ###############
class Bank {
  constructor(name) {
    this.name = name;
  }
  // Abrir cuenta de nuevo cliente
  newAccount(client) {
    // Generamos un id Ãºnico.
    const idAccount = Math.random()
      .toString(36)
      .substring(2);
    // Retornamos una nueva cuenta de cliente.
    return new ClientAccount(client.name, client.surname, idAccount);
  }
}

// #####################
// ### ClientAccount ###
// #####################
class ClientAccount {
  money = 0;
  constructor(clientName, clientSurname, idAccount) {
    this.clientName = clientName;
    this.clientSurname = clientSurname;
    this.idAccount = idAccount;
  }
}

// #####################
// ### C a s h i e r ###
// #####################
class Cashier {
  // Generamos un id Ãºnico.
  idCashier = Math.random()
    .toString(36)
    .substring(2);
  constructor() {}
  // Ingresar dinero
  addMoney(client, clientAccount, quantity) {
    // Comprobamos que el cliente lleva suficiente efectivo en la cartera.
    if (quantity <= client.wallet) {
      clientAccount.money += quantity;
      console.log(`Has ingresado ${quantity}â‚¬.`);
      return true;
    }
    console.log('No llevas suficiente dinero encima.');
    return false;
  }
  // Retirar dinero
  getMoney(client, clientAccount, quantity) {
    // Comprobamos que hay suficiente dinero en la cuenta.
    if (quantity <= clientAccount.money) {
      clientAccount.money -= quantity;
      console.log(`Has retirado ${quantity}â‚¬.`);
      return true;
    }
    console.log('No tienes suficiente efectivo en cuenta.');
    return false;
  }
  // Ver saldo
  showMoney(clientAccount) {
    console.log(`Tienes un total de ${clientAccount.money}â‚¬.`);
    return true;
  }
}

// Mi cliente
const manolo = new Client('Manolo', 'Lama', 1800);

// Mi banco
const abanca = new Bank('Abanca');

// Mi cuenta
const cuentaManolo = abanca.newAccount(manolo);

// Mi cajero
const cajero = new Cashier();

// Ingresamos dinero en la cuenta
cajero.addMoney(manolo, cuentaManolo, 120);

// Mostrar saldo
cajero.showMoney(cuentaManolo);

// Retirar saldo
cajero.getMoney(manolo, cuentaManolo, 10);

// Mostrar saldo
cajero.showMoney(cuentaManolo);

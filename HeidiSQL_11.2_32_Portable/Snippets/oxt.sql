-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.2.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para oxhospedajedb
CREATE DATABASE IF NOT EXISTS `oxhospedajedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `oxhospedajedb`;

-- Volcando estructura para tabla oxhospedajedb.a01enalquiler
CREATE TABLE IF NOT EXISTS `a01enalquiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `abierto` bit(1) NOT NULL,
  `fechaDeAlquiler` date DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `precioAcordado` double DEFAULT NULL CHECK (`precioAcordado` >= 0),
  `habitacion_id` int(11) NOT NULL,
  `personaResponsable_id` int(11) NOT NULL,
  `tipoDeMoneda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK30coxsh5q6cajmjttgl5fddbl` (`habitacion_id`),
  KEY `FK57cr6rdmg16fax7wwyqx1cb91` (`personaResponsable_id`),
  KEY `FK77tunabnisqj0wckp6t860yif` (`tipoDeMoneda_id`),
  CONSTRAINT `FK30coxsh5q6cajmjttgl5fddbl` FOREIGN KEY (`habitacion_id`) REFERENCES `inmueble` (`id`),
  CONSTRAINT `FK57cr6rdmg16fax7wwyqx1cb91` FOREIGN KEY (`personaResponsable_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `FK77tunabnisqj0wckp6t860yif` FOREIGN KEY (`tipoDeMoneda_id`) REFERENCES `moneda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a01enalquiler: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `a01enalquiler` DISABLE KEYS */;
INSERT INTO `a01enalquiler` (`id`, `activo`, `descripcion`, `abierto`, `fechaDeAlquiler`, `observaciones`, `precioAcordado`, `habitacion_id`, `personaResponsable_id`, `tipoDeMoneda_id`) VALUES
	(1, 1, NULL, b'1', '2024-11-03', '', 45, 1, 1, 2),
	(2, 1, NULL, b'1', '2024-11-03', '', 23, 1, 1, 2),
	(6, 1, NULL, b'1', '2024-11-03', '', 1000, 1, 1, 1),
	(7, 1, NULL, b'1', '2024-11-03', '', 200, 3, 2, 1);
/*!40000 ALTER TABLE `a01enalquiler` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.a01enalquiler_detalles
CREATE TABLE IF NOT EXISTS `a01enalquiler_detalles` (
  `A01EnAlquiler_id` int(11) NOT NULL,
  `descripcionDeLaImagen` varchar(255) DEFAULT NULL,
  `photo` varchar(32) DEFAULT NULL,
  KEY `FKqio1dacv0bfxic6cwa2lfw4er` (`A01EnAlquiler_id`),
  CONSTRAINT `FKqio1dacv0bfxic6cwa2lfw4er` FOREIGN KEY (`A01EnAlquiler_id`) REFERENCES `a01enalquiler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a01enalquiler_detalles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `a01enalquiler_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `a01enalquiler_detalles` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.a03cobropersonas
CREATE TABLE IF NOT EXISTS `a03cobropersonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaDelCobro` date DEFAULT NULL,
  `montoCobrado` double DEFAULT NULL CHECK (`montoCobrado` >= 1),
  `concepto_id` int(11) NOT NULL,
  `formaDeCobro_id` int(11) NOT NULL,
  `personaResponsable_id` int(11) NOT NULL,
  `tipoDeMoneda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3r0in2d7ifd1tv5rrn8j3j0g7` (`concepto_id`),
  KEY `FKqpw0qyx19p5brb9mp1udwmvgf` (`formaDeCobro_id`),
  KEY `FKlu7do72s4ox5wlran4f3mibpo` (`personaResponsable_id`),
  KEY `FKexg755mlspoqoll3qys5yvttc` (`tipoDeMoneda_id`),
  CONSTRAINT `FK3r0in2d7ifd1tv5rrn8j3j0g7` FOREIGN KEY (`concepto_id`) REFERENCES `conceptosdepagos` (`id`),
  CONSTRAINT `FKexg755mlspoqoll3qys5yvttc` FOREIGN KEY (`tipoDeMoneda_id`) REFERENCES `moneda` (`id`),
  CONSTRAINT `FKlu7do72s4ox5wlran4f3mibpo` FOREIGN KEY (`personaResponsable_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `FKqpw0qyx19p5brb9mp1udwmvgf` FOREIGN KEY (`formaDeCobro_id`) REFERENCES `modalidaddepago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a03cobropersonas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `a03cobropersonas` DISABLE KEYS */;
INSERT INTO `a03cobropersonas` (`id`, `activo`, `descripcion`, `fechaDelCobro`, `montoCobrado`, `concepto_id`, `formaDeCobro_id`, `personaResponsable_id`, `tipoDeMoneda_id`) VALUES
	(1, 1, NULL, '2024-11-03', 120, 1, 1, 1, 2);
/*!40000 ALTER TABLE `a03cobropersonas` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.a04montoexonerado
CREATE TABLE IF NOT EXISTS `a04montoexonerado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaDeLaExoneracion` date DEFAULT NULL,
  `montoExonerado` double DEFAULT NULL CHECK (`montoExonerado` >= 1),
  `concepto_id` int(11) NOT NULL,
  `personaResponsable_id` int(11) NOT NULL,
  `tipoDeMoneda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKloq0ojyjmrtfiemvm8lpngye0` (`concepto_id`),
  KEY `FKt6njqmjh0ej3yla9ct97w0het` (`personaResponsable_id`),
  KEY `FKhr03806ghx3ho7cw03lwlg6r7` (`tipoDeMoneda_id`),
  CONSTRAINT `FKhr03806ghx3ho7cw03lwlg6r7` FOREIGN KEY (`tipoDeMoneda_id`) REFERENCES `moneda` (`id`),
  CONSTRAINT `FKloq0ojyjmrtfiemvm8lpngye0` FOREIGN KEY (`concepto_id`) REFERENCES `conceptosdepagos` (`id`),
  CONSTRAINT `FKt6njqmjh0ej3yla9ct97w0het` FOREIGN KEY (`personaResponsable_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a04montoexonerado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `a04montoexonerado` DISABLE KEYS */;
INSERT INTO `a04montoexonerado` (`id`, `activo`, `descripcion`, `fechaDeLaExoneracion`, `montoExonerado`, `concepto_id`, `personaResponsable_id`, `tipoDeMoneda_id`) VALUES
	(1, 1, NULL, '2024-11-03', 1, 1, 1, 1);
/*!40000 ALTER TABLE `a04montoexonerado` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.a06pagoproveedores
CREATE TABLE IF NOT EXISTS `a06pagoproveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaDelPago` date DEFAULT NULL,
  `montoPagado` double DEFAULT NULL CHECK (`montoPagado` <= 10000000 and `montoPagado` >= 1),
  `concepto_id` int(11) NOT NULL,
  `formaDePago_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `tipoDeMoneda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9gn31atb0ca8beyab2idhdsf6` (`concepto_id`),
  KEY `FKgd2qqjq8rir23txpfyfcjs4t2` (`formaDePago_id`),
  KEY `FK1aj6u90l1hillavv52qssuvnq` (`proveedor_id`),
  KEY `FKl15dav4o5yabr4u3wbq2siuf5` (`tipoDeMoneda_id`),
  CONSTRAINT `FK1aj6u90l1hillavv52qssuvnq` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `FK9gn31atb0ca8beyab2idhdsf6` FOREIGN KEY (`concepto_id`) REFERENCES `conceptosdepagos` (`id`),
  CONSTRAINT `FKgd2qqjq8rir23txpfyfcjs4t2` FOREIGN KEY (`formaDePago_id`) REFERENCES `modalidaddepago` (`id`),
  CONSTRAINT `FKl15dav4o5yabr4u3wbq2siuf5` FOREIGN KEY (`tipoDeMoneda_id`) REFERENCES `moneda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a06pagoproveedores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `a06pagoproveedores` DISABLE KEYS */;
INSERT INTO `a06pagoproveedores` (`id`, `activo`, `descripcion`, `fechaDelPago`, `montoPagado`, `concepto_id`, `formaDePago_id`, `proveedor_id`, `tipoDeMoneda_id`) VALUES
	(1, 1, NULL, '2024-11-03', 20, 1, 1, 1, 1),
	(2, 1, NULL, '2024-11-03', 123, 1, 1, 1, 1);
/*!40000 ALTER TABLE `a06pagoproveedores` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.a08reporteestadodecuenta
CREATE TABLE IF NOT EXISTS `a08reporteestadodecuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `cantidadDeDias` int(11) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaDelCierre` date DEFAULT NULL,
  `montoAdeudado` double DEFAULT NULL,
  `montoCobrado` double DEFAULT NULL,
  `montoExonerado` double DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `saldoPendente` double DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a08reporteestadodecuenta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `a08reporteestadodecuenta` DISABLE KEYS */;
INSERT INTO `a08reporteestadodecuenta` (`id`, `activo`, `cantidadDeDias`, `cedula`, `descripcion`, `fechaDelCierre`, `montoAdeudado`, `montoCobrado`, `montoExonerado`, `nombre`, `saldoPendente`, `telefono`) VALUES
	(49, 1, 1, '12312123', '123213123', '2024-11-03', 1068, 120, 1, '123213123', 947, '989796'),
	(50, 1, 1, '12654789', 'AINEL BLANCA', '2024-11-03', 200, 0, 0, 'AINEL BLANCA', 200, '120983453');
/*!40000 ALTER TABLE `a08reporteestadodecuenta` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.a09reporteingresosegresos
CREATE TABLE IF NOT EXISTS `a09reporteingresosegresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaDelCierre` date DEFAULT NULL,
  `montoCobradoDeClientes` double DEFAULT NULL,
  `montoDeudorDelClientes` double DEFAULT NULL,
  `montoExoneradoDeClientes` double DEFAULT NULL,
  `montoPagadoAProveedor` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `saldoEgreso` double DEFAULT NULL,
  `saldoIngreso` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.a09reporteingresosegresos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `a09reporteingresosegresos` DISABLE KEYS */;
INSERT INTO `a09reporteingresosegresos` (`id`, `activo`, `descripcion`, `fechaDelCierre`, `montoCobradoDeClientes`, `montoDeudorDelClientes`, `montoExoneradoDeClientes`, `montoPagadoAProveedor`, `saldo`, `saldoEgreso`, `saldoIngreso`) VALUES
	(38, 1, '11', '2024-11-03', 0, 200, 0, 143, 57, 143, 0);
/*!40000 ALTER TABLE `a09reporteingresosegresos` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.conceptosdepagos
CREATE TABLE IF NOT EXISTS `conceptosdepagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.conceptosdepagos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `conceptosdepagos` DISABLE KEYS */;
INSERT INTO `conceptosdepagos` (`id`, `activo`, `descripcion`) VALUES
	(1, 1, 'ALQUILER'),
	(2, 1, 'CANTV'),
	(3, 1, 'REPARACION');
/*!40000 ALTER TABLE `conceptosdepagos` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.images
CREATE TABLE IF NOT EXISTS `images` (
  `ID` varchar(32) NOT NULL,
  `GALLERY` varchar(32) DEFAULT NULL,
  `image` longblob DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.images: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.inmueble
CREATE TABLE IF NOT EXISTS `inmueble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipoDeInmueble_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKie9pd9029jh2o0xvck28xk42g` (`tipoDeInmueble_id`),
  CONSTRAINT `FKie9pd9029jh2o0xvck28xk42g` FOREIGN KEY (`tipoDeInmueble_id`) REFERENCES `tipodeinmueble` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.inmueble: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` (`id`, `activo`, `descripcion`, `tipoDeInmueble_id`) VALUES
	(1, 1, 'HAB 1', 1),
	(2, 1, 'HAB 2', 1),
	(3, 1, 'HAB 3', 1);
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.modalidaddepago
CREATE TABLE IF NOT EXISTS `modalidaddepago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.modalidaddepago: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `modalidaddepago` DISABLE KEYS */;
INSERT INTO `modalidaddepago` (`id`, `activo`, `descripcion`) VALUES
	(1, 1, 'EFECTIVO BS'),
	(2, 1, 'EFECTIVO USD'),
	(3, 1, 'PAGO MOVIL');
/*!40000 ALTER TABLE `modalidaddepago` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.moneda: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` (`id`, `activo`, `descripcion`) VALUES
	(1, 1, 'USD'),
	(2, 1, 'BS');
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.nacionalidad
CREATE TABLE IF NOT EXISTS `nacionalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.nacionalidad: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` (`id`, `activo`, `descripcion`) VALUES
	(1, 1, 'V'),
	(2, 1, 'E');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.oxdiscussioncomments
CREATE TABLE IF NOT EXISTS `oxdiscussioncomments` (
  `id` varchar(32) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `discussionId` varchar(32) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXbhlx4vunn24ym1tbrlgq8g30m` (`discussionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.oxdiscussioncomments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oxdiscussioncomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdiscussioncomments` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `photo` varchar(32) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `nacionalidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa971yn2a4510bn1v91qg0n6ru` (`nacionalidad_id`),
  CONSTRAINT `FKa971yn2a4510bn1v91qg0n6ru` FOREIGN KEY (`nacionalidad_id`) REFERENCES `nacionalidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.personas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` (`id`, `activo`, `cedula`, `descripcion`, `direccion`, `photo`, `telefono`, `nacionalidad_id`) VALUES
	(1, 1, '11568789', 'ALBERTO JOSE', '', NULL, '989796', 1),
	(2, 1, '12654789', 'AINEL BLANCA', '', NULL, '120983453', 1);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;

-- Volcando estructura para procedimiento oxhospedajedb.proceso
DELIMITER //
CREATE PROCEDURE `proceso`()
BEGIN

DECLARE suma_cobrada DOUBLE;
DECLARE monto_pendiente DOUBLE;
DECLARE monto_exonerado DOUBLE;
DECLARE saldo_pendiente DOUBLE;

DECLARE saldo_egreso DOUBLE;
DECLARE saldo_ingreso DOUBLE;

DECLARE montoCobradoDeClientes DOUBLE;
DECLARE montoDeudorDelClientes DOUBLE;
DECLARE montoExoneradoDeClientes DOUBLE;
DECLARE montoPagadoAProveedor DOUBLE;
DECLARE saldo DOUBLE;
DECLARE saldoEgreso DOUBLE;
DECLARE saldoIngreso DOUBLE;

DECLARE cedula VARCHAR(150);
DECLARE nombre VARCHAR(150);
DECLARE telefono VARCHAR(150);
DECLARE idpersona INT;

DECLARE var_final INTEGER DEFAULT 0;

DECLARE cursor1 CURSOR FOR SELECT oxhospedajedb.personas.cedula,  oxhospedajedb.personas.descripcion, oxhospedajedb.personas.telefono, SUM( oxhospedajedb.a01enalquiler.precioAcordado ) AS montoDeuda, oxhospedajedb.personas.id 
FROM oxhospedajedb.a01enalquiler, oxhospedajedb.personas 
WHERE oxhospedajedb.a01enalquiler.personaResponsable_id = oxhospedajedb.personas.id
AND oxhospedajedb.a01enalquiler.activo = 1 GROUP BY oxhospedajedb.personas.cedula;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

DELETE FROM `oxhospedajedb`.`a08reporteestadodecuenta`;


SET saldo_pendiente = 0;

# Pago a los proveedores
SELECT SUM( `oxhospedajedb`.a06pagoproveedores.montoPagado ) FROM `oxhospedajedb`.a06pagoproveedores INTO saldo_egreso;

IF ISNULL( saldo_egreso ) THEN
	SET saldo_egreso = 0;
END IF;

  OPEN cursor1;

  bucle: LOOP

    FETCH cursor1 INTO cedula, nombre, telefono, monto_pendiente, idpersona;

    IF var_final = 1 THEN
      LEAVE bucle;
    END IF;

SELECT SUM( `oxhospedajedb`.a03cobropersonas.montoCobrado ) FROM `oxhospedajedb`.a03cobropersonas WHERE `oxhospedajedb`.a03cobropersonas.personaResponsable_id = idpersona INTO suma_cobrada;

SELECT SUM( `oxhospedajedb`.a04montoexonerado.montoExonerado ) FROM `oxhospedajedb`.a04montoexonerado WHERE `oxhospedajedb`.a04montoexonerado.personaResponsable_id = idpersona INTO monto_exonerado;

IF ISNULL( monto_pendiente ) THEN
	SET monto_pendiente = 0;
END IF;

IF ISNULL( suma_cobrada ) THEN
	SET suma_cobrada = 0;
END IF;

IF ISNULL( monto_exonerado ) THEN
	SET monto_exonerado = 0;
END IF;



SET saldo_pendiente = monto_pendiente - suma_cobrada - monto_exonerado ;

#SET saldo_egreso = saldo_egreso ;
SET saldo_ingreso = suma_cobrada ;

SET montoCobradoDeClientes = suma_cobrada;
SET montoDeudorDelClientes = monto_pendiente - suma_cobrada;
SET montoExoneradoDeClientes = monto_exonerado;
SET montoPagadoAProveedor = saldo_egreso;

SET saldo = montoDeudorDelClientes + montoCobradoDeClientes - montoExoneradoDeClientes - montoPagadoAProveedor;
SET saldoEgreso = montoPagadoAProveedor ;
SET saldoIngreso = suma_cobrada;


# Calcuar el Cierre de los Deudores
INSERT INTO `oxhospedajedb`.`a08reporteestadodecuenta` (`activo`, `cantidadDeDias`, `cedula`, `descripcion`, `fechaDelCierre`, `montoAdeudado`, `montoCobrado`, `montoExonerado`, `nombre`, `saldoPendente`, `telefono` ) VALUES (1, 1, cedula, nombre, '2024-11-03', monto_pendiente, suma_cobrada, monto_exonerado, nombre, saldo_pendiente, telefono);

# Calcular Ingresos y Egresos
DELETE FROM `oxhospedajedb`.`a09reporteingresosegresos`;
INSERT INTO `oxhospedajedb`.`a09reporteingresosegresos` (`activo`, `descripcion`, `fechaDelCierre`, `montoCobradoDeClientes`, `montoDeudorDelClientes`, `montoExoneradoDeClientes`, `montoPagadoAProveedor`, `saldo`, `saldoEgreso`, `saldoIngreso`) VALUES (1, '11', '2024-11-03', montoCobradoDeClientes, montoDeudorDelClientes, montoExoneradoDeClientes, montoPagadoAProveedor, saldo, saldoEgreso, saldoIngreso );


  END LOOP bucle;
  CLOSE cursor1;

END//
DELIMITER ;

-- Volcando estructura para tabla oxhospedajedb.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccionProveedor` varchar(255) DEFAULT NULL,
  `rif` varchar(255) DEFAULT NULL,
  `telefonoProveedor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.proveedores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`id`, `activo`, `descripcion`, `direccionProveedor`, `rif`, `telefonoProveedor`) VALUES
	(1, 1, 'REPARACIONES C.A.', '', 'J-999999', '0212998765');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.tasadecambio
CREATE TABLE IF NOT EXISTS `tasadecambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaDelDia` date DEFAULT NULL,
  `montoBolivares` double DEFAULT NULL CHECK (`montoBolivares` >= 1 and `montoBolivares` <= 300),
  `montoUsd` double DEFAULT NULL CHECK (`montoUsd` >= 1 and `montoUsd` <= 300),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.tasadecambio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tasadecambio` DISABLE KEYS */;
INSERT INTO `tasadecambio` (`id`, `activo`, `descripcion`, `fechaDelDia`, `montoBolivares`, `montoUsd`) VALUES
	(1, 1, NULL, '2024-11-03', 43, 1);
/*!40000 ALTER TABLE `tasadecambio` ENABLE KEYS */;

-- Volcando estructura para tabla oxhospedajedb.tipodeinmueble
CREATE TABLE IF NOT EXISTS `tipodeinmueble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla oxhospedajedb.tipodeinmueble: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipodeinmueble` DISABLE KEYS */;
INSERT INTO `tipodeinmueble` (`id`, `activo`, `descripcion`) VALUES
	(1, 1, 'HAB NORMAL'),
	(2, 1, 'TIPO ESTUDIO');
/*!40000 ALTER TABLE `tipodeinmueble` ENABLE KEYS */;

-- Volcando estructura para disparador oxhospedajedb.a01enalquiler_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a01enalquiler_after_delete` AFTER DELETE ON `a01enalquiler` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a01enalquiler_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a01enalquiler_after_insert` AFTER INSERT ON `a01enalquiler` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a01enalquiler_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a01enalquiler_after_update` AFTER UPDATE ON `a01enalquiler` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a03cobropersonas_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a03cobropersonas_after_delete` AFTER DELETE ON `a03cobropersonas` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a03cobropersonas_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a03cobropersonas_after_insert` AFTER INSERT ON `a03cobropersonas` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a03cobropersonas_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a03cobropersonas_before_update` BEFORE UPDATE ON `a03cobropersonas` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a04montoexonerado_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a04montoexonerado_after_delete` AFTER DELETE ON `a04montoexonerado` FOR EACH ROW BEGIN
CALL proceso();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a04montoexonerado_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a04montoexonerado_after_insert` AFTER INSERT ON `a04montoexonerado` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a04montoexonerado_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a04montoexonerado_after_update` AFTER UPDATE ON `a04montoexonerado` FOR EACH ROW BEGIN
CALL proceso();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a06pagoproveedores_before_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a06pagoproveedores_before_delete` AFTER DELETE ON `a06pagoproveedores` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a06pagoproveedores_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a06pagoproveedores_before_insert` AFTER INSERT ON `a06pagoproveedores` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador oxhospedajedb.a06pagoproveedores_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `a06pagoproveedores_before_update` AFTER UPDATE ON `a06pagoproveedores` FOR EACH ROW BEGIN

CALL proceso();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

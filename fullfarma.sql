/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : fullfarma

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-12-19 08:36:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(80) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Analgesicos', 'analgesico.png');
INSERT INTO `categorias` VALUES ('2', 'Liquidos', 'liquidos.png');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creado` datetime NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------

-- ----------------------------
-- Table structure for detalle_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE `detalle_pedidos` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double(7,2) NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `fk_detalle_pedidos_pedidos_1` (`id_pedido`),
  KEY `fk_detalle_pedidos_productos_1` (`id_producto`),
  CONSTRAINT `fk_detalle_pedidos_pedidos_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedidos`),
  CONSTRAINT `fk_detalle_pedidos_productos_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_pedidos
-- ----------------------------

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `precio_total` double(7,2) NOT NULL,
  `fecha_creado` date NOT NULL,
  PRIMARY KEY (`id_pedidos`),
  KEY `fk_pedidos_clientes_1` (`id_cliente`),
  CONSTRAINT `fk_pedidos_clientes_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidos
-- ----------------------------

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `imagen` varchar(80) NOT NULL,
  `precio` double(7,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `fecha_creado` datetime NOT NULL,
  `usuario_creador` int(11) NOT NULL,
  `fecha_modificado` datetime DEFAULT NULL,
  `usuario_modificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_categorias_1` (`id_categoria`),
  KEY `fk_productos_usuarios_1` (`usuario_creador`),
  KEY `fk_productos_usuarios_2` (`usuario_modificador`),
  CONSTRAINT `fk_productos_categorias_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_productos_usuarios_1` FOREIGN KEY (`usuario_creador`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_productos_usuarios_2` FOREIGN KEY (`usuario_modificador`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('1', '2', 'Agua Mineral', 'Agua mineral 100 porciento pura.', 'agua-mineral.jpg', '1.00', '5', 'Disponible', '2015-12-19 06:38:48', '1', null, null);
INSERT INTO `productos` VALUES ('2', '2', 'Purificador de Agua', 'bla bla bla bla', '2414-2015-02-11.jpg', '15.00', '3', 'Disponible', '2015-12-19 07:29:39', '1', null, null);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_creado` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

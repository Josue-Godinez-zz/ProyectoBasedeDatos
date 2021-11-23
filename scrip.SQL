/*
Created: 8/19/2021
Modified: 11/22/2021
Project: Gestion de Negocios
Model: Proyecto de Base de Datos
Company: Universidad Nacional SRB
Version: 1.0
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE SEQ_Sucursales0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Bodegas0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Servicios0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Promociones0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Negocios0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_TipoNegocios0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Clientes0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Personas0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Familias0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Productos0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Facturas0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_DetalleFacturas0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Proveedores0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_FacturasPorPagar0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Registros0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Descuentos0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_MedioPagoFactura0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_MedioPago0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
;

CREATE SEQUENCE SEQ_Lotes0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_Acciones0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_HistorialPrecios0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_CambioPrecios0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_BitacoraProveedores0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_BitacoraPromociones0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_BitacoraClientes0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_MovimientoInventario0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_BitacoraDescuentos0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_BitacoraFacturas0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_Empleados0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

CREATE SEQUENCE SEQ_Parametros0
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
;

-- Create tables section -------------------------------------------------

-- Table Negocios

CREATE TABLE Negocios(
  id_negocio Number NOT NULL,
  id_tipo_negocio Number NOT NULL,
  nombre_negocio Varchar2(30 ) NOT NULL,
  cedula_juridica_neg Varchar2(30 ) NOT NULL,
  correo_negocio Varchar2(60 ) NOT NULL
)
;

-- Add keys for table Negocios

ALTER TABLE Negocios ADD CONSTRAINT PK_Negocios PRIMARY KEY (id_negocio)
;

ALTER TABLE Negocios ADD CONSTRAINT cedula_juridica_neg UNIQUE (cedula_juridica_neg)
;

-- Table Tipos_Negocios

CREATE TABLE Tipos_Negocios(
  id_tipo_negocio Number NOT NULL,
  tipo_negocio Varchar2(30 ) NOT NULL
)
;

-- Add keys for table Tipos_Negocios

ALTER TABLE Tipos_Negocios ADD CONSTRAINT PK_Tipos_Negocios PRIMARY KEY (id_tipo_negocio)
;

-- Table Sucursales

CREATE TABLE Sucursales(
  id_sucursal Number NOT NULL,
  id_negocio Number,
  ubicacion_sucursal Varchar2(60 ) NOT NULL
)
;

-- Add keys for table Sucursales

ALTER TABLE Sucursales ADD CONSTRAINT PK_Sucursales PRIMARY KEY (id_sucursal)
;

-- Table Productos

CREATE TABLE Productos(
  id_producto Number NOT NULL,
  nombre Varchar2(30 ) NOT NULL,
  precio_compra Number NOT NULL,
  impuesto Number NOT NULL,
  id_familia Number NOT NULL,
  id_proveedor Number NOT NULL
)
;

-- Add keys for table Productos

ALTER TABLE Productos ADD CONSTRAINT PK_Productos PRIMARY KEY (id_producto)
;

-- Table Bodegas

CREATE TABLE Bodegas(
  id_bodega Number NOT NULL,
  id_negocio Number,
  nombre_bodega Varchar2(30 ) NOT NULL,
  ubicacion_bodega Varchar2(100 ) NOT NULL
)
;

-- Add keys for table Bodegas

ALTER TABLE Bodegas ADD CONSTRAINT PK_Bodegas PRIMARY KEY (id_bodega)
;

-- Table Proveedores

CREATE TABLE Proveedores(
  id_proveedor Number NOT NULL,
  nombre_proveedor Varchar2(30 ) NOT NULL,
  cedula_juridica Varchar2(30 ) NOT NULL
)
;

-- Add keys for table Proveedores

ALTER TABLE Proveedores ADD CONSTRAINT PK_Proveedores PRIMARY KEY (id_proveedor)
;

ALTER TABLE Proveedores ADD CONSTRAINT cedula_juridica UNIQUE (cedula_juridica)
;

-- Table CreditoNegocios

CREATE TABLE CreditoNegocios(
  id_negocio Number NOT NULL,
  id_proveedor Number NOT NULL,
  credito_actual Number NOT NULL,
  credito_max Number NOT NULL
)
;

-- Add keys for table CreditoNegocios

ALTER TABLE CreditoNegocios ADD CONSTRAINT PFK_CreditoNegocios PRIMARY KEY (id_negocio,id_proveedor)
;

-- Table Familias

CREATE TABLE Familias(
  id_familia Number NOT NULL,
  nombre_familia Varchar2(30 ) NOT NULL
)
;

-- Add keys for table Familias

ALTER TABLE Familias ADD CONSTRAINT PK_Familias PRIMARY KEY (id_familia)
;

-- Table Facturas

CREATE TABLE Facturas(
  id_factura Number NOT NULL,
  modalidad Varchar2(30 ) NOT NULL,
  tipo_factura Varchar2(1 ) NOT NULL,
  referencia Varchar2(30 ) NOT NULL,
  valor_referencia Number NOT NULL,
  observacion Varchar2(30 ) NOT NULL,
  fecha_venta_realizada Date NOT NULL,
  estado Varchar2(2 ) NOT NULL,
  id_sucursal Number,
  id_empleado Number,
  CONSTRAINT CK_Facturas0 CHECK (estado in ('C','P','N','Ca')),
  CONSTRAINT CK_Facturas1 CHECK (referencia in ('Proveedores','Clientes'))
)
;

-- Add keys for table Facturas

ALTER TABLE Facturas ADD CONSTRAINT PK_Facturas PRIMARY KEY (id_factura)
;

-- Table and Columns comments section

COMMENT ON COLUMN Facturas.referencia IS 'Hace referencia a la tabla de proveedor o de cliente'
;
COMMENT ON COLUMN Facturas.valor_referencia IS 'Guarda el id a quien esta referenciando'
;
COMMENT ON COLUMN Facturas.estado IS 'C=Completamente Pagada, P=Parcialmente Pagada, N= No Pagada, Ca = Cancelada, '
;

-- Table Servicios

CREATE TABLE Servicios(
  id_servicio Number NOT NULL,
  nombre_servicio Varchar2(30 ) NOT NULL,
  costo Number NOT NULL,
  impuesto_servicio Varchar2(1 ) NOT NULL,
  id_sucursal Number
)
;

-- Add keys for table Servicios

ALTER TABLE Servicios ADD CONSTRAINT PK_Servicios PRIMARY KEY (id_servicio)
;

-- Table Clientes

CREATE TABLE Clientes(
  id_cliente Number NOT NULL,
  id_negocio Number NOT NULL,
  credito_maximo Number NOT NULL,
  credito_favor Number NOT NULL,
  referencia Varchar2(30 ) NOT NULL,
  valor_referencia Number NOT NULL,
  estado_cliente Varchar2(1 ) NOT NULL
        CONSTRAINT CheckConstraintA1 CHECK (estado_cliente in ('A','I')),
  fecha_ingreso Date NOT NULL,
  CONSTRAINT CK_Clientes0 CHECK (referencia in ('Personas','Negocios'))
)
;

-- Add keys for table Clientes

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente)
;

-- Table Promociones

CREATE TABLE Promociones(
  id_promocion Number NOT NULL,
  id_negocio Number NOT NULL,
  codigo_promocion Varchar2(30 ) NOT NULL,
  descuento Number NOT NULL,
  descripcion Varchar2(30 ) NOT NULL,
  id_familia Number,
  id_producto Number,
  tipo_promocion Varchar2(1 ) NOT NULL,
  fecha_inicio Date NOT NULL,
  fecha_fin Date NOT NULL,
  productos_minimos Number NOT NULL,
  CONSTRAINT CK_Promociones0 CHECK (tipo_promocion in ('P','F'))
)
;

-- Add keys for table Promociones

ALTER TABLE Promociones ADD CONSTRAINT PK_Promociones PRIMARY KEY (id_promocion)
;

-- Table Descuentos

CREATE TABLE Descuentos(
  id_descuento Number NOT NULL,
  id_familia Number,
  id_proveedor Number,
  fecha_inicio Date NOT NULL,
  fecha_vencimiento Date NOT NULL,
  descuento Number NOT NULL
)
;

-- Add keys for table Descuentos

ALTER TABLE Descuentos ADD CONSTRAINT PK_Descuentos PRIMARY KEY (id_descuento)
;

-- Table Personas

create table PERSONAS
(
  id_persona        NUMBER not null,
  cedula            VARCHAR2(30) not null,
  nombre            VARCHAR2(30) not null,
  papellido         VARCHAR2(30) not null,
  sapellido         VARCHAR2(30),
  tipo_persona      VARCHAR2(1),
  estado_civil      VARCHAR2(1),
  direccion_trabajo VARCHAR2(150),
  direccion_casa    VARCHAR2(150),
  telefono          VARCHAR2(15),
  nacionalidad      VARCHAR2(30),
  residencia        VARCHAR2(30),
  fax               VARCHAR2(15),
  email             VARCHAR2(150),
  sexo              VARCHAR2(1),
  fecha_nacimiento  DATE,
  puesto            VARCHAR2(30),
  empresa           VARCHAR2(30),
  asegurado         VARCHAR2(1),
  escolaridad       VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create unique index IND_ID_PERSONA on PERSONAS (CEDULA)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PERSONAS
  add constraint PK_ID_PERSONA primary key (ID_PERSONA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Table DetalleFactura

CREATE TABLE DetalleFactura(
  id_detalle_factura Number NOT NULL,
  referencia Varchar2(30 ) NOT NULL,
  valor_referencia Number NOT NULL,
  valor Number NOT NULL,
  subtotal Number NOT NULL,
  total Number NOT NULL,
  descuento Number NOT NULL,
  fecha_venta Date NOT NULL,
  estado Varchar2(1 ) NOT NULL,
  id_factura Number NOT NULL,
  CONSTRAINT CK_DetalleFactura0 CHECK (estado in ('P','D','N','C')),
  CONSTRAINT CK_DetalleFactura1 CHECK (referencia in ('Productos','Servicios'))
)
;

-- Add keys for table DetalleFactura

ALTER TABLE DetalleFactura ADD CONSTRAINT PFK_DetalleFactura PRIMARY KEY (id_detalle_factura,id_factura)
;

-- Table and Columns comments section

COMMENT ON COLUMN DetalleFactura.referencia IS 'Servicio o producto'
;
COMMENT ON COLUMN DetalleFactura.valor_referencia IS 'id de un producto o servicio'
;
COMMENT ON COLUMN DetalleFactura.estado IS 'P= Pagado, D= Devuelto, N= No pagado, C=Cancelada'
;

-- Table MedioPagoFacturas

CREATE TABLE MedioPagoFacturas(
  id_medio_pago_factura Number NOT NULL,
  NoDocumento Number NOT NULL,
  monto Number NOT NULL,
  id_medio_pago Number,
  id_factura Number
)
;

-- Add keys for table MedioPagoFacturas

ALTER TABLE MedioPagoFacturas ADD CONSTRAINT PK_MedioPagoFacturas PRIMARY KEY (id_medio_pago_factura)
;

-- Table MedioPagos

CREATE TABLE MedioPagos(
  id_medio_pago Number NOT NULL,
  nombre_medio Varchar2(30 ) NOT NULL,
  estado Varchar2(30 ) NOT NULL
)
;

-- Add keys for table MedioPagos

ALTER TABLE MedioPagos ADD CONSTRAINT PK_MedioPagos PRIMARY KEY (id_medio_pago)
;

-- Table Inventarios

CREATE TABLE Inventarios(
  id_sucursal Number NOT NULL,
  id_lote Number NOT NULL,
  porcentaje_utilidad Number NOT NULL,
  porcentaje_max_descuento Number NOT NULL
)
;

-- Add keys for table Inventarios

ALTER TABLE Inventarios ADD CONSTRAINT PFK_Inventarios PRIMARY KEY (id_sucursal,id_lote)
;

-- Table FacturasPorPagar

CREATE TABLE FacturasPorPagar(
  id_factura_por_pagar Number NOT NULL,
  monto_total Number NOT NULL,
  monto_pagado Number NOT NULL,
  estado Varchar2(1 ) NOT NULL,
  fecha_ingreso Date NOT NULL,
  id_negocio Number,
  id_factura Number
)
;

-- Add keys for table FacturasPorPagar

ALTER TABLE FacturasPorPagar ADD CONSTRAINT PK_FacturasPorPagar PRIMARY KEY (id_factura_por_pagar)
;

-- Table Abonos

CREATE TABLE Abonos(
  id_factura_por_pagar Number NOT NULL,
  monto_abonado Number NOT NULL,
  fecha_abono Date NOT NULL,
  observacion Varchar2(50 )
)
;

-- Table HistorialPrecios

CREATE TABLE HistorialPrecios(
  id_historial_precio Number NOT NULL,
  id_producto Number NOT NULL,
  precio_antiguo Number NOT NULL,
  precio_nuevo Number NOT NULL,
  fecha_cambio Date NOT NULL
)
;

-- Add keys for table HistorialPrecios

ALTER TABLE HistorialPrecios ADD CONSTRAINT PK_HistorialPrecios PRIMARY KEY (id_historial_precio)
;

-- Table CodigoBarras

CREATE TABLE CodigoBarras(
  codigo_barra Varchar2(30 ) NOT NULL,
  id_producto Number NOT NULL
)
;

-- Table Lotes

CREATE TABLE Lotes(
  id_lote Number NOT NULL,
  fecha_caduca Date NOT NULL,
  fecha_registro Date NOT NULL,
  estado_ubicacion Varchar2(1 ) NOT NULL,
  cantidad_productos Number NOT NULL,
  id_bodega Number,
  id_producto Number
)
;

-- Add keys for table Lotes

ALTER TABLE Lotes ADD CONSTRAINT PK_Lotes PRIMARY KEY (id_lote)
;

-- Table Acciones

CREATE TABLE Acciones(
  id_accion Number NOT NULL,
  accion Varchar2(10 ) NOT NULL,
  id_promocion Number,
  id_cliente Number
)
;

-- Add keys for table Acciones

ALTER TABLE Acciones ADD CONSTRAINT PK_Acciones PRIMARY KEY (id_accion)
;

-- Table CambioPrecios

CREATE TABLE CambioPrecios(
  id_cambio_precio Number NOT NULL,
  id_producto Varchar2(30 ) NOT NULL,
  fecha_cambio Date NOT NULL,
  precio_antiguo Varchar2(30 ) NOT NULL,
  precio_nuevo Varchar2(30 ) NOT NULL
)
;

-- Add keys for table CambioPrecios

ALTER TABLE CambioPrecios ADD CONSTRAINT PK_CambioPrecios PRIMARY KEY (id_cambio_precio)
;

-- Table MovimientosInventarios

CREATE TABLE MovimientosInventarios(
  id_movimiento_inventario Number NOT NULL,
  id_lote Varchar2(30 ) NOT NULL,
  nueva_ubicacion Varchar2(30 ) NOT NULL,
  vieja_ubicacion Varchar2(30 ) NOT NULL,
  fecha_movimiento Date NOT NULL
)
;

-- Add keys for table MovimientosInventarios

ALTER TABLE MovimientosInventarios ADD CONSTRAINT PK_MovimientosInventarios PRIMARY KEY (id_movimiento_inventario)
;

-- Table BitacoraClientes

CREATE TABLE BitacoraClientes(
  id_bitacora_cliente Number NOT NULL,
  id_cliente Varchar2(30 ) NOT NULL,
  fecha_cambio Date NOT NULL,
  campo_modificado Varchar2(30 ) NOT NULL,
  valor_nuevo Varchar2(30 ) NOT NULL,
  valor_antiguo Varchar2(30 ) NOT NULL
)
;

-- Add keys for table BitacoraClientes

ALTER TABLE BitacoraClientes ADD CONSTRAINT PK_BitacoraClientes PRIMARY KEY (id_bitacora_cliente)
;

-- Table BitacoraProveedores

CREATE TABLE BitacoraProveedores(
  id_bitacora_proveedores Number NOT NULL,
  id_proveedor Varchar2(30 ) NOT NULL,
  nuevo_valor Varchar2(30 ) NOT NULL,
  viejo_valor Varchar2(30 ) NOT NULL,
  fecha_cambio Date NOT NULL,
  campo_modificado Varchar2(30 ) NOT NULL
)
;

-- Add keys for table BitacoraProveedores

ALTER TABLE BitacoraProveedores ADD CONSTRAINT PK_BitacoraProveedores PRIMARY KEY (id_bitacora_proveedores)
;

-- Table BitacoraPromociones

CREATE TABLE BitacoraPromociones(
  id_bitacora_promocion Number NOT NULL,
  id_promocion Varchar2(30 ) NOT NULL,
  valor_antiguo Varchar2(30 ) NOT NULL,
  valor_nuevo Varchar2(30 ) NOT NULL,
  campo_modificado Varchar2(30 ) NOT NULL,
  fecha_cambio Date NOT NULL
)
;

-- Add keys for table BitacoraPromociones

ALTER TABLE BitacoraPromociones ADD CONSTRAINT PK_BitacoraPromociones PRIMARY KEY (id_bitacora_promocion)
;

-- Table BitacoraDescuentos

CREATE TABLE BitacoraDescuentos(
  id_bitacora_descuento Number NOT NULL,
  id_descuento Varchar2(30 ) NOT NULL,
  campo_modificado Varchar2(30 ) NOT NULL,
  valor_antiguo Varchar2(30 ) NOT NULL,
  valor_nuevo Varchar2(30 ) NOT NULL,
  fecha_cambio Date NOT NULL
)
;

-- Add keys for table BitacoraDescuentos

ALTER TABLE BitacoraDescuentos ADD CONSTRAINT PK_BitacoraDescuentos PRIMARY KEY (id_bitacora_descuento)
;

-- Table BitacoraFacturas

CREATE TABLE BitacoraFacturas(
  id_bitacora_factura Number NOT NULL,
  id_factura Varchar2(30 ) NOT NULL,
  fecha_cambio Date NOT NULL,
  campo_modificado Varchar2(30 ) NOT NULL,
  nuevo_valor Varchar2(30 ) NOT NULL,
  valor_antiguo Varchar2(30 ) NOT NULL
)
;

-- Add keys for table BitacoraFacturas

ALTER TABLE BitacoraFacturas ADD CONSTRAINT PK_BitacoraFacturas PRIMARY KEY (id_bitacora_factura)
;

-- Table Empleados

CREATE TABLE Empleados(
  id_empleado Number NOT NULL,
  id_negocio Number,
  id_parametro Number,
  id_persona Number
)
;

-- Add keys for table Empleados

ALTER TABLE Empleados ADD CONSTRAINT PK_Empleados PRIMARY KEY (id_empleado)
;

-- Table Parametros

CREATE TABLE Parametros(
  id_parametro Number NOT NULL,
  nombre_rol Varchar2(30 ) NOT NULL,
  clave Varchar2(30 ) NOT NULL
)
;

-- Add keys for table Parametros

ALTER TABLE Parametros ADD CONSTRAINT PK_Parametros PRIMARY KEY (id_parametro)
;

-- Trigger for sequence SEQ_Negocios0 for column id_negocio in table Negocios ---------
CREATE OR REPLACE TRIGGER ts_Negocios_SEQ_Negocios0 BEFORE INSERT
ON Negocios FOR EACH ROW
BEGIN
  :new.id_negocio := SEQ_Negocios0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Negocios_SEQ_Negocios0 AFTER UPDATE OF id_negocio
ON Negocios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_negocio in table Negocios as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_TipoNegocios0 for column id_tipo_negocio in table Tipos_Negocios ---------
CREATE OR REPLACE TRIGGER ts_Tipos_Negocios_SEQ_TipoNegocios0 BEFORE INSERT
ON Tipos_Negocios FOR EACH ROW
BEGIN
  :new.id_tipo_negocio := SEQ_TipoNegocios0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Tipos_Negocios_SEQ_TipoNegocios0 AFTER UPDATE OF id_tipo_negocio
ON Tipos_Negocios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_tipo_negocio in table Tipos_Negocios as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Sucursales0 for column id_sucursal in table Sucursales ---------
CREATE OR REPLACE TRIGGER ts_Sucursales_SEQ_Sucursales0 BEFORE INSERT
ON Sucursales FOR EACH ROW
BEGIN
  :new.id_sucursal := SEQ_Sucursales0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Sucursales_SEQ_Sucursales0 AFTER UPDATE OF id_sucursal
ON Sucursales FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_sucursal in table Sucursales as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Productos0 for column id_producto in table Productos ---------
CREATE OR REPLACE TRIGGER ts_Productos_SEQ_Productos0 BEFORE INSERT
ON Productos FOR EACH ROW
BEGIN
  :new.id_producto := SEQ_Productos0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Productos_SEQ_Productos0 AFTER UPDATE OF id_producto
ON Productos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_producto in table Productos as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Bodegas0 for column id_bodega in table Bodegas ---------
CREATE OR REPLACE TRIGGER ts_Bodegas_SEQ_Bodegas0 BEFORE INSERT
ON Bodegas FOR EACH ROW
BEGIN
  :new.id_bodega := SEQ_Bodegas0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Bodegas_SEQ_Bodegas0 AFTER UPDATE OF id_bodega
ON Bodegas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_bodega in table Bodegas as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Proveedores0 for column id_proveedor in table Proveedores ---------
CREATE OR REPLACE TRIGGER ts_Proveedores_SEQ_Proveedores0 BEFORE INSERT
ON Proveedores FOR EACH ROW
BEGIN
  :new.id_proveedor := SEQ_Proveedores0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Proveedores_SEQ_Proveedores0 AFTER UPDATE OF id_proveedor
ON Proveedores FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_proveedor in table Proveedores as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Familias0 for column id_familia in table Familias ---------
CREATE OR REPLACE TRIGGER ts_Familias_SEQ_Familias0 BEFORE INSERT
ON Familias FOR EACH ROW
BEGIN
  :new.id_familia := SEQ_Familias0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Familias_SEQ_Familias0 AFTER UPDATE OF id_familia
ON Familias FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_familia in table Familias as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Facturas0 for column id_factura in table Facturas ---------
CREATE OR REPLACE TRIGGER ts_Facturas_SEQ_Facturas0 BEFORE INSERT
ON Facturas FOR EACH ROW
BEGIN
  :new.id_factura := SEQ_Facturas0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Facturas_SEQ_Facturas0 AFTER UPDATE OF id_factura
ON Facturas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_factura in table Facturas as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Servicios0 for column id_servicio in table Servicios ---------
CREATE OR REPLACE TRIGGER ts_Servicios_SEQ_Servicios0 BEFORE INSERT
ON Servicios FOR EACH ROW
BEGIN
  :new.id_servicio := SEQ_Servicios0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Servicios_SEQ_Servicios0 AFTER UPDATE OF id_servicio
ON Servicios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_servicio in table Servicios as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Clientes0 for column id_cliente in table Clientes ---------
CREATE OR REPLACE TRIGGER ts_Clientes_SEQ_Clientes0 BEFORE INSERT
ON Clientes FOR EACH ROW
BEGIN
  :new.id_cliente := SEQ_Clientes0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Clientes_SEQ_Clientes0 AFTER UPDATE OF id_cliente
ON Clientes FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_cliente in table Clientes as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Promociones0 for column id_promocion in table Promociones ---------
CREATE OR REPLACE TRIGGER ts_Promociones_SEQ_Promociones0 BEFORE INSERT
ON Promociones FOR EACH ROW
BEGIN
  :new.id_promocion := SEQ_Promociones0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Promociones_SEQ_Promociones0 AFTER UPDATE OF id_promocion
ON Promociones FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_promocion in table Promociones as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Personas0 for column id_persona in table Personas ---------
CREATE OR REPLACE TRIGGER ts_Personas_SEQ_Personas0 BEFORE INSERT
ON Personas FOR EACH ROW
BEGIN
  :new.id_persona := SEQ_Personas0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Personas_SEQ_Personas0 AFTER UPDATE OF id_persona
ON Personas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_persona in table Personas as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_DetalleFacturas0 for column id_detalle_factura in table DetalleFactura ---------
CREATE OR REPLACE TRIGGER ts_DetalleFactura_SEQ_DetalleFacturas0 BEFORE INSERT
ON DetalleFactura FOR EACH ROW
BEGIN
  :new.id_detalle_factura := SEQ_DetalleFacturas0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_DetalleFactura_SEQ_DetalleFacturas0 AFTER UPDATE OF id_detalle_factura
ON DetalleFactura FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_detalle_factura in table DetalleFactura as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_MedioPago0 for column id_medio_pago in table MedioPagos ---------
CREATE OR REPLACE TRIGGER ts_MedioPagos_SEQ_MedioPago0 BEFORE INSERT
ON MedioPagos FOR EACH ROW
BEGIN
  :new.id_medio_pago := SEQ_MedioPago0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_MedioPagos_SEQ_MedioPago0 AFTER UPDATE OF id_medio_pago
ON MedioPagos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_medio_pago in table MedioPagos as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_FacturasPorPagar0 for column id_factura_por_pagar in table FacturasPorPagar ---------
CREATE OR REPLACE TRIGGER ts_FacturasPorPagar_SEQ_FacturasPorPagar0 BEFORE INSERT
ON FacturasPorPagar FOR EACH ROW
BEGIN
  :new.id_factura_por_pagar := SEQ_FacturasPorPagar0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_FacturasPorPagar_SEQ_FacturasPorPagar0 AFTER UPDATE OF id_factura_por_pagar
ON FacturasPorPagar FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_factura_por_pagar in table FacturasPorPagar as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_HistorialPrecios0 for column id_historial_precio in table HistorialPrecios ---------
CREATE OR REPLACE TRIGGER ts_HistorialPrecios_SEQ_HistorialPrecios0 BEFORE INSERT
ON HistorialPrecios FOR EACH ROW
BEGIN
  :new.id_historial_precio := SEQ_HistorialPrecios0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_HistorialPrecios_SEQ_HistorialPrecios0 AFTER UPDATE OF id_historial_precio
ON HistorialPrecios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_historial_precio in table HistorialPrecios as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Lotes0 for column id_lote in table Lotes ---------
CREATE OR REPLACE TRIGGER ts_Lotes_SEQ_Lotes0 BEFORE INSERT
ON Lotes FOR EACH ROW
BEGIN
  :new.id_lote := SEQ_Lotes0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Lotes_SEQ_Lotes0 AFTER UPDATE OF id_lote
ON Lotes FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_lote in table Lotes as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Acciones0 for column id_accion in table Acciones ---------
CREATE OR REPLACE TRIGGER ts_Acciones_SEQ_Acciones0 BEFORE INSERT
ON Acciones FOR EACH ROW
BEGIN
  :new.id_accion := SEQ_Acciones0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Acciones_SEQ_Acciones0 AFTER UPDATE OF id_accion
ON Acciones FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_accion in table Acciones as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_CambioPrecios0 for column id_cambio_precio in table CambioPrecios ---------
CREATE OR REPLACE TRIGGER ts_CambioPrecios_SEQ_CambioPrecios0 BEFORE INSERT
ON CambioPrecios FOR EACH ROW
BEGIN
  :new.id_cambio_precio := SEQ_CambioPrecios0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_CambioPrecios_SEQ_CambioPrecios0 AFTER UPDATE OF id_cambio_precio
ON CambioPrecios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_cambio_precio in table CambioPrecios as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_MovimientoInventario0 for column id_movimiento_inventario in table MovimientosInventarios ---------
CREATE OR REPLACE TRIGGER ts_MovimientosInventarios_SEQ_MovimientoInventario0 BEFORE INSERT
ON MovimientosInventarios FOR EACH ROW
BEGIN
  :new.id_movimiento_inventario := SEQ_MovimientoInventario0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_MovimientosInventarios_SEQ_MovimientoInventario0 AFTER UPDATE OF id_movimiento_inventario
ON MovimientosInventarios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_movimiento_inventario in table MovimientosInventarios as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_BitacoraClientes0 for column id_bitacora_cliente in table BitacoraClientes ---------
CREATE OR REPLACE TRIGGER ts_BitacoraClientes_SEQ_BitacoraClientes0 BEFORE INSERT
ON BitacoraClientes FOR EACH ROW
BEGIN
  :new.id_bitacora_cliente := SEQ_BitacoraClientes0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_BitacoraClientes_SEQ_BitacoraClientes0 AFTER UPDATE OF id_bitacora_cliente
ON BitacoraClientes FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_bitacora_cliente in table BitacoraClientes as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_BitacoraProveedores0 for column id_bitacora_proveedores in table BitacoraProveedores ---------
CREATE OR REPLACE TRIGGER ts_BitacoraProveedores_SEQ_BitacoraProveedores0 BEFORE INSERT
ON BitacoraProveedores FOR EACH ROW
BEGIN
  :new.id_bitacora_proveedores := SEQ_BitacoraProveedores0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_BitacoraProveedores_SEQ_BitacoraProveedores0 AFTER UPDATE OF id_bitacora_proveedores
ON BitacoraProveedores FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_bitacora_proveedores in table BitacoraProveedores as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_BitacoraPromociones0 for column id_bitacora_promocion in table BitacoraPromociones ---------
CREATE OR REPLACE TRIGGER ts_BitacoraPromociones_SEQ_BitacoraPromociones0 BEFORE INSERT
ON BitacoraPromociones FOR EACH ROW
BEGIN
  :new.id_bitacora_promocion := SEQ_BitacoraPromociones0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_BitacoraPromociones_SEQ_BitacoraPromociones0 AFTER UPDATE OF id_bitacora_promocion
ON BitacoraPromociones FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_bitacora_promocion in table BitacoraPromociones as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_BitacoraDescuentos0 for column id_bitacora_descuento in table BitacoraDescuentos ---------
CREATE OR REPLACE TRIGGER ts_BitacoraDescuentos_SEQ_BitacoraDescuentos0 BEFORE INSERT
ON BitacoraDescuentos FOR EACH ROW
BEGIN
  :new.id_bitacora_descuento := SEQ_BitacoraDescuentos0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_BitacoraDescuentos_SEQ_BitacoraDescuentos0 AFTER UPDATE OF id_bitacora_descuento
ON BitacoraDescuentos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_bitacora_descuento in table BitacoraDescuentos as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_BitacoraFacturas0 for column id_bitacora_factura in table BitacoraFacturas ---------
CREATE OR REPLACE TRIGGER ts_BitacoraFacturas_SEQ_BitacoraFacturas0 BEFORE INSERT
ON BitacoraFacturas FOR EACH ROW
BEGIN
  :new.id_bitacora_factura := SEQ_BitacoraFacturas0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_BitacoraFacturas_SEQ_BitacoraFacturas0 AFTER UPDATE OF id_bitacora_factura
ON BitacoraFacturas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_bitacora_factura in table BitacoraFacturas as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Empleados0 for column id_empleado in table Empleados ---------
CREATE OR REPLACE TRIGGER ts_Empleados_SEQ_Empleados0 BEFORE INSERT
ON Empleados FOR EACH ROW
BEGIN
  :new.id_empleado := SEQ_Empleados0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Empleados_SEQ_Empleados0 AFTER UPDATE OF id_empleado
ON Empleados FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_empleado in table Empleados as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Parametros0 for column id_parametro in table Parametros ---------
CREATE OR REPLACE TRIGGER ts_Parametros_SEQ_Parametros0 BEFORE INSERT
ON Parametros FOR EACH ROW
BEGIN
  :new.id_parametro := SEQ_Parametros0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Parametros_SEQ_Parametros0 AFTER UPDATE OF id_parametro
ON Parametros FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_parametro in table Parametros as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Negocios ADD CONSTRAINT FK_Negocios_7 FOREIGN KEY (id_tipo_negocio) REFERENCES Tipos_Negocios (id_tipo_negocio)
;



ALTER TABLE Productos ADD CONSTRAINT FK_Proveedores_3 FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
;



ALTER TABLE CreditoNegocios ADD CONSTRAINT PFK_Negocios_1 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE CreditoNegocios ADD CONSTRAINT PFK_Proveedores_1 FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
;



ALTER TABLE Clientes ADD CONSTRAINT FK_Negocios_6 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE Promociones ADD CONSTRAINT FK_Negocios_3 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE Descuentos ADD CONSTRAINT FK_Familias_2 FOREIGN KEY (id_familia) REFERENCES Familias (id_familia)
;



ALTER TABLE Descuentos ADD CONSTRAINT FK_Proveedores_1 FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
;



ALTER TABLE Productos ADD CONSTRAINT FK_Familias_3 FOREIGN KEY (id_familia) REFERENCES Familias (id_familia)
;



ALTER TABLE DetalleFactura ADD CONSTRAINT PFK_Facturas_1 FOREIGN KEY (id_factura) REFERENCES Facturas (id_factura)
;



ALTER TABLE MedioPagoFacturas ADD CONSTRAINT FK_MedioPagos_1 FOREIGN KEY (id_medio_pago) REFERENCES MedioPagos (id_medio_pago)
;



ALTER TABLE MedioPagoFacturas ADD CONSTRAINT FK_Facturas_1 FOREIGN KEY (id_factura) REFERENCES Facturas (id_factura)
;



ALTER TABLE Promociones ADD CONSTRAINT FK_Familias_1 FOREIGN KEY (id_familia) REFERENCES Familias (id_familia)
;



ALTER TABLE Promociones ADD CONSTRAINT FK_Productos_1 FOREIGN KEY (id_producto) REFERENCES Productos (id_producto)
;



ALTER TABLE Sucursales ADD CONSTRAINT FK_Negocios_1 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE Bodegas ADD CONSTRAINT FK_Negocios_2 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE Inventarios ADD CONSTRAINT PFK_Sucursales_1 FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal)
;



ALTER TABLE FacturasPorPagar ADD CONSTRAINT FK_Negocios_5 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE FacturasPorPagar ADD CONSTRAINT FK_Facturas_2 FOREIGN KEY (id_factura) REFERENCES Facturas (id_factura)
;



ALTER TABLE Servicios ADD CONSTRAINT FK_Sucursales_1 FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal)
;



ALTER TABLE Abonos ADD CONSTRAINT FK_Facturas_3 FOREIGN KEY (id_factura_por_pagar) REFERENCES FacturasPorPagar (id_factura_por_pagar)
;



ALTER TABLE Facturas ADD CONSTRAINT FK_Negocios_4 FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal)
;



ALTER TABLE CodigoBarras ADD CONSTRAINT FK_productos_2 FOREIGN KEY (id_producto) REFERENCES Productos (id_producto)
;



ALTER TABLE Lotes ADD CONSTRAINT FK_Bodegas_1 FOREIGN KEY (id_bodega) REFERENCES Bodegas (id_bodega)
;



ALTER TABLE Lotes ADD CONSTRAINT FK_Lotes_1 FOREIGN KEY (id_producto) REFERENCES Productos (id_producto)
;



ALTER TABLE Inventarios ADD CONSTRAINT FK_Lotes_2 FOREIGN KEY (id_lote) REFERENCES Lotes (id_lote)
;



ALTER TABLE Acciones ADD CONSTRAINT FK_Promociones_0 FOREIGN KEY (id_promocion) REFERENCES Promociones (id_promocion)
;



ALTER TABLE Acciones ADD CONSTRAINT FK_Clientes_0 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
;



ALTER TABLE Empleados ADD CONSTRAINT FK_Negocios_8 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE Empleados ADD CONSTRAINT FK_Parametros_0 FOREIGN KEY (id_parametro) REFERENCES Parametros (id_parametro)
;



ALTER TABLE Empleados ADD CONSTRAINT FK_Personas_0 FOREIGN KEY (id_persona) REFERENCES Personas (id_persona)
;



ALTER TABLE Facturas ADD CONSTRAINT FK_Empleados_0 FOREIGN KEY (id_empleado) REFERENCES Empleados (id_empleado)
;






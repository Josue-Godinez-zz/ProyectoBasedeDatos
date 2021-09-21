/*
Created: 8/19/2021
Modified: 9/21/2021
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

CREATE SEQUENCE SEQ_Persona0
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

-- Create tables section -------------------------------------------------

-- Table Negocios

CREATE TABLE Negocios(
  id_negocio Number NOT NULL,
  id_tipo_negocio Number NOT NULL,
  nombre_negocio Varchar2(30 ) NOT NULL,
  cedula_juridica_neg Varchar2(30 ) NOT NULL
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
  id_producto Number INVISIBLE NOT NULL,
  nombre Varchar2(30 ) NOT NULL,
  codigo Varchar2(30 ) NOT NULL,
  precio_compra Number NOT NULL,
  fecha_ingreso Date NOT NULL,
  impuesto Number NOT NULL,
  estado Varchar2(1 ) NOT NULL,
  cantidad_disponibles Number NOT NULL,
  id_familia Number NOT NULL,
  id_proveedor Number NOT NULL,
  id_bodega Number,
  CONSTRAINT CK_Productos0 CHECK (estado in ('C','V','B'))
)
;

-- Add keys for table Productos

ALTER TABLE Productos ADD CONSTRAINT PK_Productos PRIMARY KEY (id_producto)
;

ALTER TABLE Productos ADD CONSTRAINT codigo UNIQUE (codigo)
;

-- Table and Columns comments section

COMMENT ON COLUMN Productos.estado IS 'V= Vencido, B= Bodega, C= Comprado'
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

-- Table CodigosBarras

CREATE TABLE CodigosBarras(
  codigobarra Varchar2(30 ) NOT NULL,
  id_producto Number NOT NULL
)
;

-- Add keys for table CodigosBarras

ALTER TABLE CodigosBarras ADD CONSTRAINT FK_CodigosBarras PRIMARY KEY (codigobarra)
;

-- Table Facturas

CREATE TABLE Facturas(
  id_factura Number NOT NULL,
  modalidad Varchar2(30 ) NOT NULL,
  tipo_factura Varchar2(1 ) NOT NULL,
  referencia Varchar2(30 ) NOT NULL,
  valor_referencia Number NOT NULL,
  observacion Varchar2(30 ) NOT NULL,
  estado Varchar2(1 ) NOT NULL,
  id_negocio Number NOT NULL,
  CONSTRAINT CKC_estado_factura CHECK (estado in ('C','P','N'))
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
COMMENT ON COLUMN Facturas.estado IS 'C=Completamente Pagada, P=Parcialmente Pagada, N= No Pagada, '
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
        CONSTRAINT CheckConstraintA1 CHECK (estado_cliente in ('A','I'))
)
;

-- Add keys for table Clientes

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente)
;

-- Table Promociones

CREATE TABLE Promociones(
  id_promocion Number NOT NULL,
  id_negocio Number NOT NULL,
  descuento Number NOT NULL,
  descripcion Varchar2(30 ) NOT NULL,
  id_familia Number,
  id_producto Number,
  fecha_inicio Date NOT NULL,
  fecha_fin Date NOT NULL,
  productos_minimos Number NOT NULL
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
  fecha_inicio Number NOT NULL,
  fecha_vencimiento Number NOT NULL,
  descuento Number NOT NULL
)
;

-- Add keys for table Descuentos

ALTER TABLE Descuentos ADD CONSTRAINT PK_Descuentos PRIMARY KEY (id_descuento)
;

-- Table Registros

CREATE TABLE Registros(
  id_registro Number NOT NULL,
  fecha_cambio Date NOT NULL,
  precio_antiguo Number NOT NULL,
  precio_nuevo Number NOT NULL,
  id_detalle_producto Number NOT NULL
)
;

-- Add keys for table Registros

ALTER TABLE Registros ADD CONSTRAINT PK_Registros PRIMARY KEY (id_registro)
;

-- Table Personas

CREATE TABLE Personas(
  id_persona Number NOT NULL,
  cedula Varchar2(30 ) NOT NULL,
  nombre Varchar2(30 ) NOT NULL,
  apellidos Varchar2(60 ) NOT NULL,
  tipo_persona Varchar2(1 ) NOT NULL,
  estado_civil Varchar2(1 ),
  direccion_trabajo Varchar2(150 ),
  direccion_casa Varchar2(150 ),
  telefono Varchar2(15 ) NOT NULL,
  nacionalidad Varchar2(30 ) NOT NULL,
  residencia Varchar2(30 ) NOT NULL,
  fax Varchar2(15 ),
  email Varchar2(150 ) NOT NULL,
  sexo Varchar2(1 ) NOT NULL,
  fecha_nacimiento Date NOT NULL,
  puesto Varchar2(30 ),
  empresa Varchar2(30 ),
  asegurado Varchar2(1 ) NOT NULL,
  escolaridad Varchar2(50 ),
  fecha_ingreso_cliente Date NOT NULL
)
;

-- Create indexes for table Personas

CREATE UNIQUE INDEX IND_Id_persona ON Personas (cedula)
;

-- Add keys for table Personas

ALTER TABLE Personas ADD CONSTRAINT PK_id_persona PRIMARY KEY (id_persona)
;

-- Table DetalleFactura

CREATE TABLE DetalleFactura(
  id_detalle_factura Number NOT NULL,
  referencia Varchar2(30 ) NOT NULL,
  valor_referencia Number NOT NULL,
  cantidad Number NOT NULL,
  valor_unitario Number NOT NULL,
  total Number NOT NULL,
  subtotal Number NOT NULL,
  descuento Number NOT NULL,
  fecha_venta Date NOT NULL,
  estado Varchar2(1 ) NOT NULL,
  id_factura Number NOT NULL,
  CONSTRAINT CK_DetalleFactura0 CHECK (estado in ('P','D','N'))
)
;

-- Add keys for table DetalleFactura

ALTER TABLE DetalleFactura ADD CONSTRAINT PFK_DetalleFactura PRIMARY KEY (id_detalle_factura,id_factura)
;

-- Table and Columns comments section

COMMENT ON COLUMN DetalleFactura.estado IS 'P= Pagado, D= Devuelto, N= Ninguno'
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
  id_producto Number NOT NULL,
  id_sucursal Number NOT NULL,
  porcentaje_utilidad Number NOT NULL,
  porcentaje_max_descuento Number NOT NULL
)
;

-- Add keys for table Inventarios

ALTER TABLE Inventarios ADD CONSTRAINT PFK_Inventarios PRIMARY KEY (id_producto,id_sucursal)
;

-- Table FacturasPorPagar

CREATE TABLE FacturasPorPagar(
  id_factura_por_pagar Number NOT NULL,
  monto_total Number NOT NULL,
  monto_pagado Number NOT NULL,
  estado Varchar2(1 ) NOT NULL,
  fecha_ultimo_abono Date NOT NULL,
  id_negocio Number,
  id_factura Number
)
;

-- Add keys for table FacturasPorPagar

ALTER TABLE FacturasPorPagar ADD CONSTRAINT PK_FacturasPorPagar PRIMARY KEY (id_factura_por_pagar)
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

-- Trigger for sequence SEQ_Registros0 for column id_registro in table Registros ---------
CREATE OR REPLACE TRIGGER ts_Registros_SEQ_Registros0 BEFORE INSERT
ON Registros FOR EACH ROW
BEGIN
  :new.id_registro := SEQ_Registros0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Registros_SEQ_Registros0 AFTER UPDATE OF id_registro
ON Registros FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_registro in table Registros as it uses sequence.');
END;
/

-- Trigger for sequence SEQ_Persona0 for column id_persona in table Personas ---------
CREATE OR REPLACE TRIGGER ts_Personas_SEQ_Persona0 BEFORE INSERT
ON Personas FOR EACH ROW
BEGIN
  :new.id_persona := SEQ_Persona0.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Personas_SEQ_Persona0 AFTER UPDATE OF id_persona
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


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Negocios ADD CONSTRAINT FK_Negocios_7 FOREIGN KEY (id_tipo_negocio) REFERENCES Tipos_Negocios (id_tipo_negocio)
;



ALTER TABLE Productos ADD CONSTRAINT FK_Proveedores_3 FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
;



ALTER TABLE CreditoNegocios ADD CONSTRAINT PFK_Negocios_1 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE CreditoNegocios ADD CONSTRAINT PFK_Proveedores_1 FOREIGN KEY (id_proveedor) REFERENCES Proveedores (id_proveedor)
;



ALTER TABLE CodigosBarras ADD CONSTRAINT FK_Productos_2 FOREIGN KEY (id_producto) REFERENCES Productos (id_producto)
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



ALTER TABLE Facturas ADD CONSTRAINT FK_Negocios_4 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
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



ALTER TABLE Productos ADD CONSTRAINT FK_Bodegas_1 FOREIGN KEY (id_bodega) REFERENCES Bodegas (id_bodega)
;



ALTER TABLE Inventarios ADD CONSTRAINT PFK_Productos_1 FOREIGN KEY (id_producto) REFERENCES Productos (id_producto)
;



ALTER TABLE Inventarios ADD CONSTRAINT PFK_Sucursales_1 FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal)
;



ALTER TABLE FacturasPorPagar ADD CONSTRAINT FK_Negocios_5 FOREIGN KEY (id_negocio) REFERENCES Negocios (id_negocio)
;



ALTER TABLE FacturasPorPagar ADD CONSTRAINT FK_Facturas_2 FOREIGN KEY (id_factura) REFERENCES Facturas (id_factura)
;



ALTER TABLE Servicios ADD CONSTRAINT FK_Sucursales_1 FOREIGN KEY (id_sucursal) REFERENCES Sucursales (id_sucursal)
;






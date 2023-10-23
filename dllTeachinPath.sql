-- public.cliente definition

CREATE TABLE public.cliente (
	id_cliente serial NOT NULL,
	nombre_cliente varchar NULL,
	genero varchar NOT NULL
);
COMMENT ON TABLE public.cliente IS 'Tabla que almacena informacion de los clientes';

ALTER TABLE public.cliente ADD CONSTRAINT cliente_pk PRIMARY KEY (id_cliente);
ALTER TABLE public.cliente ADD CONSTRAINT cliente_check CHECK (genero = 'f' or genero = 'm');

-- Column comments

COMMENT ON COLUMN public.cliente.id_cliente IS 'identificacor unico de la entidad cliente';
COMMENT ON COLUMN public.cliente.genero IS 'genero del cliente, ejemplo femenino';

-- public.producto definition

CREATE TABLE public.producto (
	id_producto serial NOT NULL,
	nombre_producto varchar NULL,
	precio float4 NULL DEFAULT 0.0,
	descripcion varchar NOT NULL
);
COMMENT ON TABLE public.producto IS 'Tabla que almacena informacion de los clientes';

ALTER TABLE public.producto ADD CONSTRAINT producto_pk PRIMARY KEY (id_producto);

-- Column comments

COMMENT ON COLUMN public.producto.id_producto IS 'clave primararia del producto';

-- public.pedido definition

CREATE TABLE public.pedido (
	id_pedido serial NOT NULL,
	id_cliente integer NULL,
	id_producto integer NULL,
	cantidad numeric NULL
);
COMMENT ON TABLE public.pedido IS 'Tabla que almacena informacion del pedido de productos que realizan los clientes';

ALTER TABLE public.pedido ADD CONSTRAINT pedido_pk PRIMARY KEY (id_pedido);
ALTER TABLE public.pedido ADD CONSTRAINT pedido_cliente_fk FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public.pedido ADD CONSTRAINT pedido_producto_fk FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto) ON DELETE RESTRICT ON UPDATE CASCADE;


-- Column comments

COMMENT ON COLUMN public.pedido.id_pedido IS 'Clave primaria del pedido';
COMMENT ON COLUMN public.pedido.id_cliente IS 'Foranea a la tabla cliente';
COMMENT ON COLUMN public.pedido.id_producto IS 'Foranea a la tabla producto';
COMMENT ON COLUMN public.pedido.cantidad IS 'Cantidad pedida del producto';

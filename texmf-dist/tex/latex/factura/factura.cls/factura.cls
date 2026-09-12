%%
%% This is file `factura.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% factura.dtx  (with options: `class')
%% 
%% Copyright 2022 Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3c of this license or (at your option) any later
%% version. This version of this license is in
%%  http://www.latex-project.org/lppl/lppl-1-3c.{html|txt|tex|pdf}
%% and the latest version of this license is in
%%  http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of
%% LaTeX version 2008/05/04 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Emilio Augusto Lazo Zaia.
%% 
%% This work consists of the files README and factura.dtx
%% with its derived files factura.ins, factura.cls, factura.def,
%% factura-ejemplo-aux.tex, factura-ejemplo-firma.tex,
%% factura-ejemplo-fondo.tex, factura-ejemplo-membrete.tex,
%% factura-ejemplo-notadecredito.tex, factura-ejemplo-notadedebito.tex,
%% factura-ejemplo-cotizacion.tex, factura-ejemplo-prefactura.tex,
%% factura-ejemplo-factura01.tex, factura-ejemplo-factura02.tex,
%% factura-ejemplo-factura03.tex, factura-ejemplo-factura04.tex,
%% factura-ejemplo-factura05.tex, factura-ejemplo-factura06.tex,
%% factura-ejemplo-factura07.tex, factura-ejemplo-factura08.tex,
%% factura-ejemplo-factura09.tex, factura-ejemplo-factura10.tex,
%% factura-ejemplo-reporte1.tex, factura-ejemplo-reporte2.tex,
%% factura-ejemplo-reporte3.tex, factura-ejemplo-reporte4.tex
%% and factura-beispiel-rechnung.tex.
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{factura}
[2022/01/22 v4.32
Clase para elaborar facturas legales
en la Repu'blica Bolivariana de Venezuela.
]

\RequirePackage{etoolbox}%  'etoolbox' para los condicionales binarios y para \AtEndPreamble.

%% Condicionales auxiliares que sólo pueden ser usados dentro de un grupo.
\newbool{DCU}
\newbool{DUC}
\newbool{Descuentos}
\newbool{ExpAbajo}\booltrue{ExpAbajo}
\newbool{IVA}
\newbool{NumItem}
\newbool{PrimeroDescripcion}
\newbool{SinCantidad}
\newbool{SinLineaHoriNI}
\newbool{SinLineaHoriTit}
\newbool{SinLineaHoriTot}
\newbool{SinLineasHoriExt}
\newbool{SinLineasVertExt}
\newbool{SinLineasVertInt}
\newbool{Subtotal}

%% Condicionales auxiliares para la posición de los objetos fijos cuando son medidos desde la derecha, o desde abajo.
\newbool{NotaFinalYarriba}
\newbool{NotaFinalYnegativo}% no hay NotaFinalXnegativo.
\newbool{ControlXnegativo}
\newbool{ControlYarriba}
\newbool{ControlYnegativo}
\newbool{FormalibreXnegativo}
\newbool{FormalibreYarriba}
\newbool{FormalibreYnegativo}
\newbool{DenominacionXnegativo}
\newbool{DenominacionYarriba}
\newbool{DenominacionYnegativo}
\newbool{FechaXnegativo}
\newbool{FechaYarriba}
\newbool{FechaYnegativo}
\newbool{FirmasYnegativo}% no hay FirmasXnegativo; hay X_inicial y X_final para las firmas.

%% Condicionales relativos a opciones de la clase.
\newif\ifagrupatotales
\newif\ifdescripcioncentrada
\newif\iffilascentradas
\newif\ifconlineasha
\newif\ifconreporte
\newif\ifcotizacion
\newif\ifcsv
\newif\ifdcu
\newif\ifdescuentos
\newif\ifdivisa
\newif\ifdosfirmas
\newif\ifduc
\newif\ifexpandecuadro
\newif\iffilas
\newif\ifG
\newif\ifivadescripcion
\newif\ifiva
\newif\iflinea
\newif\ifmonedaceldas
\newif\ifmonedadespues
\newif\ifnospanish
\newif\ifnotadecredito
\newif\ifnotadedebito
\newif\ifnumitem
\newif\ifprefactura
\newif\ifsincantidad
\newif\ifsindenominacion
\newif\ifsinencabezadofactura
\newif\ifsinencabezadoreporte
\newif\ifsinexpandir
\newif\ifsinfirmas
\newif\ifsiniva
\newif\ifsinivaexpresado
\newif\ifsinlineahni
\newif\ifsinlineahtit
\newif\ifsinlineahtot
\newif\ifsinlineash
\newif\ifsinlineashe
\newif\ifsinlineashi
\newif\ifsinlineasv
\newif\ifsinlineasve
\newif\ifsinlineasvi
\newif\ifsinmarcasfactura
\newif\ifsinmonedatotales
\newif\ifsinnumero
\newif\ifsinreverso
\newif\ifsintotales
\newif\ifsoloreporte
\newif\ifsubtotal
\newif\iftodosiva
\newif\iftwoside
\newif\ifunafirma
\newif\ifvencimiento

%% Condicionales auxiliares.
\newif\if@cdu \@cdutrue
\newif\if@factura \@facturatrue
\newif\if@reverso \@reversotrue
\newif\if@reporte
\newif\if@TasaCambio
\newif\if@FondoFactura
\newif\if@FondoReporte
\newif\if@FondoReporteStar
\newif\if@Nombre
\newif\if@PruebaRef
\newif\if@ExpandeCuadro
\newif\if@LineaDesdeInicio
\newif\if@LineaHastaTotal
\newif\if@LineaHastaFinal
\newif\if@LineaDescripcion
\newif\if@BIR
\newif\if@BIA
\newif\if@Exento
\newif\if@DescG
\newif\if@DescR
\newif\if@DescA
\newif\if@DescE
\newif\if@DescGnum
\newif\if@DescRnum
\newif\if@DescAnum
\newif\if@DescEnum
\newif\if@DescuentoTotal
\newif\if@EscribeMoneda

%% Longitudes para uso interno.
\newlength{\@TamDatos}
\newlength{\@TamResumen}
\newlength{\@TamFinalEncabezado}
\newlength{\@TamLineaFirmas}
\newlength{\@TamNumItem}
\newlength{\@TamCantidad}
\newlength{\@TamDescripcion}
\newlength{\@TamPrecioU}
\newlength{\@TamPrecioS}
\newlength{\@TamDescuento}
\newlength{\@TamIVA}
\newlength{\@TamPrecioT}
\newlength{\@GrosorLineaFirmas}
\newlength{\@GrosorLineaEncabezado}
\newlength{\@GrosorLineaNotaPrevia}
\newlength{\@GrosorLineaDescripcion}
\newlength{\@GrosorLineaNotaFinal}
\newlength{\@GrosorLineaInfoPag}
\newlength{\@EsquinaLineaEncabezado}
\newlength{\@EsquinaLineaNotaPrevia}
\newlength{\@EsquinaLineaDescripcion}
\newlength{\@EsquinaLineaNotaFinal}
\newlength{\@SombraEncabezado}
\newlength{\@SombraNotaPrevia}
\newlength{\@SombraDescripcion}
\newlength{\@SombraNotaFinal}
\newlength{\@LineaNodoXo}
\newlength{\@LineaNodoYo}
\newlength{\@LineaNodoXf}
\newlength{\@LineaNodoYf}
\newlength{\@SepTotales}
\newlength{\@PosFechaX}
\newlength{\@PosFechaY}
\newlength{\@PosDenominacionX}
\newlength{\@PosDenominacionY}
\newlength{\@PosFirmasXuno}
\newlength{\@PosFirmasXdos}
\newlength{\@PosFirmasY}
\newlength{\@PosNotaFinalXuno}
\newlength{\@PosNotaFinalXdos}
\newlength{\@PosNotaFinalY}
\newlength{\@PosControlX}
\newlength{\@PosControlY}
\newlength{\@PosFormalibreX}
\newlength{\@PosFormalibreY}
\newlength{\@EspacioVacioInicial}
\newlength{\@EspacioVacioFinal}
\newlength{\@EspacioSignoMonetario}
\newlength{\@SeparaItemsExtra}
\newlength{\@SeparaItemsExtraFinal}
\newlength{\@SeparaInternaEncabezado}
\newlength{\@SeparaInternaNotaPrevia}
\newlength{\@SeparaInternaDescripcion}
\newlength{\@SeparaInternaNotaFinal}
\newlength{\@SeparaDatosResumen}
\newlength{\@SeparaVertical}
\newlength{\@SeparaMinTotales}
\newlength{\@SeparaFilas}
\newlength{\@SeparaFinLineaDesc}
\newlength{\@SeparaTelefonoEmail}
\newlength{\@InicioReporte}
\newlength{\@FirmaFacturaXcorr}
\newlength{\@FirmaFacturaYcorr}
\newlength{\@FirmaReporteXcorr}
\newlength{\@FirmaReporteYcorr}
\newlength{\@FirmaReporteTextPos}
\newlength{\@FirmaReporteFirmaPos}
\newlength{\@FirmaReporteTamLinea}
\newlength{\@FirmaReportePosX}
\newlength{\@FirmaReporteExcesoLinea}
\newlength{\@TempDimen}
\newlength{\tabcolsep@@}
\newlength{\baselineskip@@}

%% Cajas para uso interno.
\newbox{\@CajaDatos}
\newbox{\@CajaResumen}
\newbox{\@CajaFirmaEmisor}
\newbox{\@CajaFirmas}
\newbox{\@CajaFecha}
\newbox{\@CajaDenominacion}
\newbox{\@CajaControl}
\newbox{\@CajaFormalibre}
\newbox{\@CajaNotaFinal}
\newbox{\@CajaEspacioVacio}
\newbox{\@CajaPrueba}
\newbox{\@CajaCaracterCR}

%% Contadores.
\newcounter{@IVANoGeneral}%  '0' con sólo IVA G, '1' cuando hay IVA R o IVA A, y '2' cuando hay ambos.
\newcounter{@Firmas}%  '0' para sinfirmas, '1' para unafirma, y '2' para dosfirmas.
\setcounter{@Firmas}{2}
\newcounter{NumItem}%  Número del ítem actual, para uso de algunas macros en el cuadro de la factura y para cuando se usa la opción 'numitem'.
\newcount\AuxFecha

%% Errores, advertencias e informaciones de LaTeX.
\newcommand{\CLASSERROR}[1]{\ClassError{factura}{** #1. **}{}}
\newcommand{\CLASSWARNING}[1]{\ClassWarning{factura}{** #1. **}{}}
\newcommand{\CLASSINFO}[1]{\ClassInfo{factura}{** #1. **}{}}


%% Opciones de la clase.
\DeclareOption{agrupatotales}{\agrupatotalestrue}%  Agrupados los totalizadores en el modo en columnas.
\DeclareOption{agrupado}{\agrupatotalestrue}%  TODO: Quitar en el futuro.
\DeclareOption{conlineasha}{\conlineashatrue}%  Una línea horizontal para cada ítem, como las facturas a mano.
\DeclareOption{conreporte}{\conreportetrue}%  Para imprimir factura y reporte.
\DeclareOption{cotizacion}{\cotizaciontrue}%  Cambia la denominación a 'COTIZACIÓN' y no 'FACTURA'.
\DeclareOption{csv}{\csvtrue}%  Para la salida en modo csv también.
\DeclareOption{dcu}{\dcutrue}%  Descripción, luego cantidad y luego precio unitario.
\DeclareOption{descripcioncentrada}{\descripcioncentradatrue}%  Para centrar la descripción de cada ítem en la factura.
\DeclareOption{centradesc}{\descripcioncentradatrue}%  TODO: Quitar en el futuro.
\DeclareOption{descuentos}{\descuentostrue}%  Para los descuentos individuales.
\DeclareOption{divisa}{\divisatrue}%  Para cambiar la moneda por la divisa y aceptar entrada de montos en divisas.
\DeclareOption{dosfirmas}{\dosfirmastrue}%  Pone las dos firmas para firmar.
\DeclareOption{duc}{\ductrue}%  Descripción, luego precio unitario y luego cantidad.
\DeclareOption{expandecuadro}{\expandecuadrotrue}%  Para rellenar con líneas en blanco de manera automática.
\DeclareOption{filas}{\filastrue}%  Estilo de totalización en filas.
\DeclareOption{filascentradas}{\filascentradastrue}%  Centra los totales en en modo de 'filas'.
\DeclareOption{centrado}{\filascentradastrue}%  TODO: Quitar en el futuro.
\DeclareOption{G}{\Gtrue}%  Con esta opción sale la letra 'G' en los items con IVA general, y sale el porcentaje en la base imponible general.
\DeclareOption{iva}{\ivatrue}%  Para la columna del IVA.
\DeclareOption{ivadescripcion}{\ivadescripciontrue}%  Para el tipo de impuesto en la descripción y no en el precio unitario y total.
\DeclareOption{impdesc}{\ivadescripciontrue}%  TODO: Quitar en el futuro.
\DeclareOption{linea}{\lineatrue}%  Para la línea que inutiliza el espacio en blanco.
\DeclareOption{monedadespues}{\monedadespuestrue}%   Para que el signo monetario salga después del monto y no antes.
\DeclareOption{monedaceldas}{\monedaceldastrue}%  Para poner el signo monetario en cada celda con montos.
\DeclareOption{nospanish}{\nospanishtrue}%  No carga babel en castellano ni la codificación T1 de las letras.
\DeclareOption{notadecredito}{\notadecreditotrue}%  Produce una nota de crédito.
\DeclareOption{notadedebito}{\notadedebitotrue}%  Produce una nota de débito.
\DeclareOption{numitem}{\numitemtrue}%  Para poner una columna extra al principio con el número del ítem.
\DeclareOption{prefactura}{\prefacturatrue}%  La prefactura; con el diseño de la forma libre... para enviar por correo electrónico, fax o imprimir preliminarmente.
\DeclareOption{sincantidad}{\sincantidadtrue}%  Para no poner el campo de la cantidad.
\DeclareOption{sindenominacion}{\sindenominaciontrue}%  No agrega el texto con la denominación del documento, para las formas libres que tienen el número de la factura ya impreso.
\DeclareOption{sindenom}{\sindenominaciontrue}%  TODO: Quitar en el futuro.
\DeclareOption{sinencabezadofactura}{\sinencabezadofacturatrue}%  Para no poner los datos del cliente y que el emisor haga ese diseño.
\DeclareOption{sinencabezadoreporte}{\sinencabezadoreportetrue}%  Para no poner el encabezado del reporte.
\DeclareOption{sinexpandir}{\sinexpandirtrue}%  No expande ninguna de las dos partes de la factura.
\DeclareOption{sinfirmas}{\sinfirmastrue}%  No agrega los espacios para firmar.
\DeclareOption{siniva}{\sinivatrue}%  No cobra IVA.
\DeclareOption{sinivaexpresado}{\sinivaexpresadotrue}%  Cuando no se cobra IVA y tampoco se quiere que aparezca la totalización del IVA.
\DeclareOption{sinlineahni}{\sinlineahnitrue}%  Estilo 'sinlineahni'.
\DeclareOption{sinlineahtot}{\sinlineahtottrue}%  Estilo 'sinlineahtot'.
\DeclareOption{sinlineahtit}{\sinlineahtittrue}%  Estilo 'sinlineahtit'.
\DeclareOption{sinlineashe}{\sinlineashetrue}%  Estilo 'sinlineashe'.
\DeclareOption{sinlineashi}{\sinlineashitrue}%  Estilo 'sinlineashi'.
\DeclareOption{sinlineash}{\sinlineashtrue}%  Estilo 'sinlineash'.
\DeclareOption{sinlineasve}{\sinlineasvetrue}%  Estilo 'sinlineasve'.
\DeclareOption{sinlineasvi}{\sinlineasvitrue}%  Estilo 'sinlineasvi'.
\DeclareOption{sinlineasv}{\sinlineasvtrue}%  Estilo 'sinlineasv'.
\DeclareOption{sinmarcasfactura}{\sinmarcasfacturatrue}%  Para evitar que aparezcan los caracteres especiales cuando la descripción es larga.
\DeclareOption{sinmarcas}{\sinmarcasfacturatrue}%  TODO: Quitar en el futuro.
\DeclareOption{sinmonedatotales}{\sinmonedatotalestrue}%  Para que no ponga el signo monetario en los totales.
\DeclareOption{sinnumero}{\sinnumerotrue}%  Escribir el texto de la denominación del documento pero sin escribir el número.
\DeclareOption{sinreverso}{\sinreversotrue}%  Para no imprimir el reverso de la factura.
\DeclareOption{sintotales}{\sintotalestrue}%  No escribe los totales al final, por ejemplo para cotizaciones de productos similares.
\DeclareOption{soloreporte}{\soloreportetrue}%  Para imprimir sólo el reporte.
\DeclareOption{subtotal}{\subtotaltrue}%  Para la columna extra del subtotal antes del descuento.
\DeclareOption{todosiva}{\todosivatrue}%  Con esta opción salen todos los IVA así valgan cero.
\DeclareOption{twoside}{\twosidetrue}%  Opción 'twoside' de article para los reportes.
\DeclareOption{unafirma}{\unafirmatrue}%  No agrega el espacio para que firme quien recibe.
\DeclareOption{vencimiento}{\vencimientotrue}%  Escribe fecha de vencimiento, aún con facturas sin crédito.

\ProcessOptions\relax

\LoadClass[12pt]{article}

%% Cargamos algunos paquetes siempre necesarios.
\RequirePackage{xparse}%  Algunos comandos los definimos con \NewDocumentCommand.
\RequirePackage[absolute]{textpos}%  Es necesario 'textpos' para colocar texto en ubicaciones arbitrarias.
\RequirePackage{eso-pic}%  Para el comando \AddToShipoutPicture.
\RequirePackage{atbegshi}%  Para \AtBeginShipoutNext; ya 'eso-pic' no incluye a 'atbegshi'.
\RequirePackage{xstring}%  Lo usamos sólo para tomar el menos al principio de una longitud.
\RequirePackage{calc}%  'calc' para hacer aritmética con las dimensiones.
\RequirePackage{fp-upn}%  Fundamental el paquete 'fp-upn' para todos los cálculos.
\RequirePackage{numprint}%  Con 'numprint' expresamos los totales en el formato requerido.
\RequirePackage{tikz}%  Para los recuadros del encabezado de la factura,
 \usetikzlibrary{shadows}%  y para el de la descripción.
 \tikzset{reuse path/.code={\pgfsyssoftpath@setcurrentpath{#1}}}
 \tikzset{even odd clip/.code={\pgfseteorule}, protect/.code={
  \clip[overlay,even odd clip,reuse path=#1]
  (-2383.99999pt,-2383.99999pt) rectangle (2383.99999pt,2383.99999pt);}}
\RequirePackage{tabularx}%  Con 'tabularx' hacemos la tabla.
\RequirePackage{environ}%  Con 'environ' podemos usar tabularx dentro del ambiente de la factura y escribir texto en el enddef.
\RequirePackage{fancyhdr}%  Las cabeceras fancy; así se use solamente en reporte, hay que cargarlo siempre.
\RequirePackage[calc]{datetime2}%  Para calcular la fecha del vencimiento del crédito.
\RequirePackage{anyfontsize}%  Para las tipografías en tamaños arbitrarios.
\RequirePackage{ifxetex}%  Para poder modificar correctamente la metadata del PDF y agregar la versión de la clase.
\RequirePackage{ifluatex}%  Ditto.
\RequirePackage{zref-savepos}%  Para guardar la posición en 'Y' expandiendo el cuadro, para la línea y para la firma en el reporte si la hubiera.
%% Hay que cargar siempre zref-savepos para poder compilar con LuaLaTeX porque este motor no tiene \pdfsavepos, \pdflastypos y zref-savepos las provee cuando no existen (motor LuaLaTex).

%% Gracias a Alan Munn y a wipet (Thanks to Alan Munn and wipet).
%% (https://tex.stackexchange.com/questions/396363/input-a-date-to-datetime2-in-a-format-different-than-iso)
\def\DTMsavedatex#1#2{%
 \expandafter \ifx \csname f=\DTMinformat\endcsname \relax
  \CLASSERROR{\string\DTMsavedatex: formato "\DTMinformat" desconocido}%
 \else
  \csname f=\DTMinformat\expandafter\endcsname#2&{#1}%
 \fi
}
\def\DTMfdef#1{\expandafter\def\csname f=#1\endcsname}
\def\DTMs#1#2{\DTMsavedate{#2}{#1}}
\DTMfdef{yyyy-mm-dd}#1-#2-#3&{\DTMs{#1-#2-#3}}
\DTMfdef{yyyy.mm.dd}#1.#2.#3&{\DTMs{#1-#2-#3}}
\DTMfdef{yyyymmdd}#1#2#3#4#5#6#7#8&{\DTMs{#1#2#3#4-#5#6-#7#8}}
\DTMfdef{dd-mm-yyyy}#1-#2-#3&{\DTMs{#3-#2-#1}}
\DTMfdef{dd.mm.yyyy}#1.#2.#3&{\DTMs{#3-#2-#1}}
\DTMfdef{ddmmyyyy}#1#2#3#4#5#6#7#8&{\DTMs{#5#6#7#8-#3#4-#1#2}}
\DTMfdef{mm-dd-yyyy}#1-#2-#3&{\DTMs{#3-#1-#2}}

%% Macros internas para el texto de la metadata que se va a escribir con el número de la versión de la clase.
\edef\@factura@ver{\expandafter\csname ver@factura.cls\endcsname}
\ExplSyntaxOn
  \seq_set_split:NnV \l_tmpa_seq {~} {\@factura@ver}
  \tl_set:Nx \@factura@vernum {\seq_item:Nn \l_tmpa_seq {2}}

  \seq_set_split:NnV \l_tmpa_seq {~} {\@factura@ver}
  \tl_set:Nx \@factura@fecha {\seq_item:Nn \l_tmpa_seq {1}}
\ExplSyntaxOff
\def\@factura@ver{Hecho con la clase factura-\@factura@vernum\ (\@factura@fecha)}

%% Escribimos la versión de la clase en la metadata del PDF.
\ifxetex
 \special{pdf: docinfo << /Subject (\@factura@ver) >>}
\else
 \AfterEndDocument{% AfterEndDocument y no AtEndDocument porque si no hyperref sustituye la metadata.
  \ifluatex
   \pdfextension info{/Subject (\@factura@ver)}
  \else
   \pdfinfo{/Subject (\@factura@ver)}
  \fi}
\fi

%% Lo hacemos otra vez compatible con LuaLaTeX.
\ifluatex
 \let\pdfsavepos\savepos
 \let\pdflastypos\lastypos
\fi

%% Macro que se va a ejecutar para establecer opciones; se ejecuta en el primer \AtEndPreamble.
\def\@EstableceOpciones{%
 % Establecemos los parámetros y macros relativas a la fecha.
 \DTMsetstyle{\@FormatoFecha}\DTMsetup{datesep=\@FechaSeparadores}\gdef\DTMinformat{\@FormatoFechaEntrada}

 % Tomamos las acciones pertinentes dependiendo de las opciones de la clase (o condicionales activados en el preámbulo que cambian las opciones de la clase)
 \ifnotadedebito
  \ifnotadecredito
   \CLASSERROR{Las opciones 'notadedebito' y 'notadecredito' no son compatibles. Sin efecto ambas opciones}
   \notadecreditofalse
   \notadedebitofalse
  \else
   \ifcotizacion
    \CLASSERROR{Las opciones 'notadedebito' y 'cotizacion' no son compatibles. Sin efecto ambas opciones}
    \notadedebitofalse
    \cotizacionfalse
   \fi
  \fi
 \fi
 \ifnotadecredito
  \ifcotizacion
   \CLASSERROR{Las opciones 'notadecredito' y 'cotizacion' no son compatibles. Sin efecto ambas opciones}
   \notadecreditofalse
   \cotizacionfalse
  \fi
 \fi
 \ifcotizacion\ifdefvoid{\@Credito}{}{\vencimientofalse}\fi
 \ifprefactura
  \ifcotizacion
   \prefacturafalse
   \cotizacionfalse
   \CLASSWARNING{Las opciones 'prefactura' y 'cotizacion' no son compatibles. Sin efecto ambas opciones}
  \else
   \setcounter{@Firmas}{0}
  \fi
 \fi
 \ifcotizacion\setcounter{@Firmas}{1}\fi

 \ifsinlineasv\booltrue{SinLineasVertExt}\booltrue{SinLineasVertInt}\fi
 \ifsinlineasvi\booltrue{SinLineasVertInt}\fi
 \ifsinlineasve\booltrue{SinLineasVertExt}\fi
 \ifsinlineash\booltrue{SinLineasHoriExt}\booltrue{SinLineaHoriNI}\booltrue{SinLineaHoriTit}\booltrue{SinLineaHoriTot}\fi
 \ifsinlineashi\booltrue{SinLineaHoriNI}\booltrue{SinLineaHoriTit}\booltrue{SinLineaHoriTot}\fi
 \ifsinlineahni\booltrue{SinLineaHoriNI}\fi
 \ifsinlineahtit\booltrue{SinLineaHoriTit}\fi
 \ifsinlineahtot
  \iffilas
   \CLASSWARNING{Las opciones 'sinlineahtot' y 'filas' no son compatibles. Sin efecto opcio'n 'sinlineahtot'}
   \sinlineahtotfalse
  \else
   \booltrue{SinLineaHoriTot}
  \fi
 \fi
 \ifsinlineashe\booltrue{SinLineasHoriExt}\fi

 \ifsindenominacion
 \else
  \ifcotizacion
  \else
   \ifsinnumero
    \CLASSERROR{La opcio'n para no poner el nu'mero so'lo es compatible con las cotizaciones. Sin efecto opcio'n 'sinnumero'}%
    \sinnumerofalse
   \fi
  \fi
 \fi

 \ifdosfirmas
  \setcounter{@Firmas}{2}
  \ifunafirma
   \unafirmafalse
   \ifsinfirmas
    \sinfirmasfalse
    \CLASSWARNING{Las opciones para las firmas son excluyentes. Permanece activada 'dosfirmas'}
   \else
    \CLASSWARNING{Las opciones para las firmas son excluyentes. Permanece activada 'dosfirmas'}
   \fi
  \else
   \ifsinfirmas
    \sinfirmasfalse
    \CLASSWARNING{Las opciones para las firmas son excluyentes. Permanece activada 'dosfirmas'}
   \fi
  \fi
 \fi
 \ifunafirma
  \setcounter{@Firmas}{1}
  \ifsinfirmas
   \sinfirmasfalse
   \CLASSWARNING{Las opciones para las firmas son excluyentes. Permanece activada 'unafirma'}
  \fi
 \fi
 \ifsinfirmas\setcounter{@Firmas}{0}\fi

 \ifdcu
  \@cdufalse\ducfalse
  \booltrue{DCU}\boolfalse{DUC}
  \booltrue{PrimeroDescripcion}
 \fi
 \ifduc
  \ifdcu
   \boolfalse{PrimeroDescripcion}\boolfalse{DCU}\dcufalse\ducfalse\@cdutrue
   \CLASSWARNING{Las opciones 'duc' y 'dcu' no son compatibles. Sin efecto ambas opciones}
  \else
   \ductrue\@cdufalse\dcufalse
   \booltrue{DUC}\boolfalse{DCU}
   \booltrue{PrimeroDescripcion}
  \fi
 \fi
 \ifnumitem\booltrue{NumItem}\fi
 \ifsincantidad
  \booltrue{SinCantidad}
  \ifdcu
   \dcufalse\@cdutrue\boolfalse{DCU}\boolfalse{PrimeroDescripcion}
   \CLASSWARNING{La opcio'n 'sincantidad' no es compatible con 'dcu'. Sin efecto opcio'n 'dcu'}
  \fi
  \ifduc
   \ducfalse\@cdutrue\boolfalse{DUC}\boolfalse{PrimeroDescripcion}
   \CLASSWARNING{La opcio'n 'sincantidad' no es compatible con 'duc'. Sin efecto opcio'n 'duc'}
  \fi
 \fi
 \ifdescuentos\booltrue{Descuentos}\fi
 \ifiva\ivadescripciontrue\booltrue{IVA}\fi
 \ifsubtotal
  \ifdescuentos
   \booltrue{Subtotal}
  \else
   \CLASSWARNING{La opcio'n 'subtotal' no aplica sin descuentos individuales. Sin efecto opcio'n 'subtotal'}
  \fi
 \fi

 \ifsintotales
  \iffilas
   \filasfalse
   \CLASSWARNING{La opcio'n 'sintotales' no aplica para el modo de totalizacio'n en filas. Sin efecto opcio'n 'filas'}
  \fi
  \ifcotizacion
  \else
   \CLASSWARNING{La opcio'n 'sintotales' no debe usarse en facturas sino en cotizaciones. No es va'lida una factura sin totales}
  \fi
 \fi

 \iffilascentradas
  \iffilas
  \else
   \filascentradasfalse
   \CLASSWARNING{La opcio'n 'filascentradas' no es compatible con el modo de totalizacio'n en columnas. Sin efecto opcio'n 'filascentradas'}
  \fi
 \fi
 \ifagrupatotales
  \iffilas
   \agrupatotalesfalse
   \CLASSWARNING{La opcio'n 'agrupatotales' no es compatible con el modo de totalizacio'n en filas. Sin efecto opcio'n 'agrupatotales'}
  \fi
 \fi

 \iftodosiva \@BIRtrue \@BIAtrue \@Exentotrue \Gtrue \fi
 \ifsiniva\AtBeginDocument{\gdef\@ImpuestoG{0}\gdef\@ImpuestoR{0}\gdef\@ImpuestoA{0}}\fi
 \ifsinivaexpresado
  \iffilas
   \filasfalse
   \CLASSWARNING{La opcio'n 'sinivaexpresado' no es compatible con la opcio'n 'filas'. Sin efecto la opcio'n 'filas'}
  \else
   \AtBeginDocument{\gdef\@ImpuestoG{0}\gdef\@ImpuestoR{0}\gdef\@ImpuestoA{0}}
  \fi
 \fi

 \iflinea
  \ifexpandecuadro
  \else
   \CLASSWARNING{La opcio'n 'linea' requiere la opcio'n 'expandecuadro'. Activando la opcio'n 'expandecuadro'}
   \expandecuadrotrue
  \fi
 \fi
 \ifsinmarcasfactura \def\@CaracterCR{\mbox{}} \def\@CaracterCeldasVacias{\mbox{}} \fi
 \ifnospanish
 \else
  \RequirePackage[spanish]{babel}%  Babel en castellano.
  \ifxetex
  \else
   \ifluatex
   \else
    \RequirePackage[T1]{fontenc}%  Codificación T1 para las tipografías; no aplica para XeLaTeX ni LuaLaTeX.
   \fi
  \fi
 \fi

 \ifexpandecuadro
  \ifsinexpandir
   \expandecuadrofalse
   \sinexpandirfalse
   \CLASSWARNING{Las opciones 'expandecuadro' y 'sinexpandir' no son compatibles. Sin efecto ambas opciones}
  \else
   \boolfalse{ExpAbajo}
  \fi
 \fi
 \ifsinexpandir\boolfalse{ExpAbajo}\expandecuadrofalse\fi

 \ifsinreverso\@reversofalse\fi
 \ifconreporte
  \@reportetrue
  \ifsoloreporte
   \soloreportefalse
   \CLASSWARNING{La opcio'n 'soloreporte' no es compatible con 'conreporte'. Sin efecto 'soloreporte'}
  \fi
 \fi
 \ifsoloreporte\@reportetrue\@facturafalse\@reversofalse\fi

 \ifcsv
  \if@factura
   \newwrite\csv \immediate\openout\csv=\jobname.csv
   \ifsintotales\else\AtEndDocument{\@EscribeTotalesEnCSV}\fi
  \else
   \csvfalse
   \CLASSWARNING{La opcio'n 'csv' require generar la factura. Sin efecto opcio'n 'csv'}
  \fi
 \fi

 \iftwoside
  \@twosidetrue\@mparswitchtrue
 \else
  \@twosidefalse\@mparswitchfalse
 \fi}

%% Antes de que se acabe el preámbulo, para agregar aquí cosas como cambios de opciones y que después puedan ser verificadas y validadas en el primer \AtEndPreamble.
%% Sin * hace append; con un * sustituye; con ** hace prepend.
\NewDocumentCommand{\BeforeEndPreamble}{s s +m}{
 \IfBooleanTF{#2}
  {\gpreto{\@BeforeEndPreamble}{#3}}
  {\IfBooleanTF{#1}{\long\gdef\@BeforeEndPreamble{#3}}{\gappto{\@BeforeEndPreamble}{#3}}}}

\BeforeEndPreamble{
 % Si hay una tasa de cambio especificada, pone la nota externa aclaratoria.
 % Si se está usando divisas, cambia la moneda.
 \ifdivisa
  \if@TasaCambio
   \NotaExterna{\TextoTasaCambio}
  \else
   \Moneda{\@Divisa}
  \fi
 \fi

 % Se establece el texto de la nota de crédito o débito como nota interna. Para cambiarlo hay que anular el texto con \AtEndPreamble{\NotaInterna{}}
 \ifnotadecredito
  \NotaInterna{\TextoNotaDeCredito}
  \CLASSINFO{Se establecio' el texto aclaratorio de la nota de cre'dito como 'nota interna'}
 \fi
 \ifnotadedebito
  \NotaInterna{\TextoNotaDeDebito}
  \CLASSINFO{Se establecio' el texto aclaratorio de la nota de de'bito como 'nota interna'}
 \fi}

%% Primer \AtEndPreamble: ejecuta \@EstableceOpciones, luego \@BeforeEndPreamble y luego otra vez \@EstableceOpciones.
\AtEndPreamble{
 \@EstableceOpciones
 \ifx\@undefined\@BeforeEndPreamble\else\@BeforeEndPreamble\@EstableceOpciones\fi

 % Escribimos en el .log las opciones cargadas:
 \ifagrupatotales \CLASSINFO{Opcio'n cargada: agrupatotales}\fi
 \ifdescripcioncentrada \CLASSINFO{Opcio'n cargada: descripcioncentrada}\fi
 \iffilascentradas \CLASSINFO{Opcio'n cargada: filascentradas}\fi
 \ifconlineasha \CLASSINFO{Opcio'n cargada: conlineasha}\fi
 \ifconreporte \CLASSINFO{Opcio'n cargada: conreporte}\fi
 \ifcotizacion \CLASSINFO{Opcio'n cargada: cotizacion}\fi
 \ifcsv \CLASSINFO{Opcio'n cargada: csv}\fi
 \ifdcu \CLASSINFO{Opcio'n cargada: dcu}\fi
 \ifdescuentos \CLASSINFO{Opcio'n cargada: descuentos}\fi
 \ifdivisa \CLASSINFO{Opcio'n cargada: divisa}\fi
 \ifdosfirmas \CLASSINFO{Opcio'n cargada: dosfirmas}\fi
 \ifduc \CLASSINFO{Opcio'n cargada: duc}\fi
 \ifexpandecuadro \CLASSINFO{Opcio'n cargada: expandecuadro}\fi
 \iffilas \CLASSINFO{Opcio'n cargada: filas}\fi
 \ifG \CLASSINFO{Opcio'n cargada: G}\fi
 \ifivadescripcion \CLASSINFO{Opcio'n cargada: ivadescripcion}\fi
 \ifiva \CLASSINFO{Opcio'n cargada: iva}\fi
 \iflinea \CLASSINFO{Opcio'n cargada: linea}\fi
 \ifmonedaceldas \CLASSINFO{Opcio'n cargada: monedaceldas}\fi
 \ifmonedadespues \CLASSINFO{Opcio'n cargada: monedadespues}\fi
 \ifnospanish \CLASSINFO{Opcio'n cargada: nospanish}\fi
 \ifnotadecredito \CLASSINFO{Opcio'n cargada: notadecredito}\fi
 \ifnotadedebito \CLASSINFO{Opcio'n cargada: notadedebito}\fi
 \ifnumitem \CLASSINFO{Opcio'n cargada: numitem}\fi
 \ifprefactura \CLASSINFO{Opcio'n cargada: prefactura}\fi
 \ifsincantidad \CLASSINFO{Opcio'n cargada: sincantidad}\fi
 \ifsindenominacion \CLASSINFO{Opcio'n cargada: sindenominacion}\fi
 \ifsinencabezadofactura \CLASSINFO{Opcio'n cargada: sinencabezadofactura}\fi
 \ifsinencabezadoreporte \CLASSINFO{Opcio'n cargada: sinencabezadoreporte}\fi
 \ifsinexpandir \CLASSINFO{Opcio'n cargada: sinexpandir}\fi
 \ifsinfirmas \CLASSINFO{Opcio'n cargada: sinfirmas}\fi
 \ifsiniva \CLASSINFO{Opcio'n cargada: siniva}\fi
 \ifsinivaexpresado \CLASSINFO{Opcio'n cargada: sinivaexpresado}\fi
 \ifsinlineahni \CLASSINFO{Opcio'n cargada: sinlineahni}\fi
 \ifsinlineahtit \CLASSINFO{Opcio'n cargada: sinlineahtit}\fi
 \ifsinlineahtot \CLASSINFO{Opcio'n cargada: sinlineahtot}\fi
 \ifsinlineash \CLASSINFO{Opcio'n cargada: sinlineash}\fi
 \ifsinlineashe \CLASSINFO{Opcio'n cargada: sinlineashe}\fi
 \ifsinlineashi \CLASSINFO{Opcio'n cargada: sinlineashi}\fi
 \ifsinlineasv \CLASSINFO{Opcio'n cargada: sinlineasv}\fi
 \ifsinlineasve \CLASSINFO{Opcio'n cargada: sinlineasve}\fi
 \ifsinlineasvi \CLASSINFO{Opcio'n cargada: sinlineasvi}\fi
 \ifsinmarcasfactura \CLASSINFO{Opcio'n cargada: sinmarcasfactura}\fi
 \ifsinmonedatotales \CLASSINFO{Opcio'n cargada: sinmonedatotales}\fi
 \ifsinnumero \CLASSINFO{Opcio'n cargada: sinnumero}\fi
 \ifsinreverso \CLASSINFO{Opcio'n cargada: sinreverso}\fi
 \ifsintotales \CLASSINFO{Opcio'n cargada: sintotales}\fi
 \ifsoloreporte \CLASSINFO{Opcio'n cargada: soloreporte}\fi
 \ifsubtotal \CLASSINFO{Opcio'n cargada: subtotal}\fi
 \iftodosiva \CLASSINFO{Opcio'n cargada: todosiva}\fi
 \iftwoside \CLASSINFO{Opcio'n cargada: twoside}\fi
 \ifunafirma \CLASSINFO{Opcio'n cargada: unafirma}\fi
 \ifvencimiento \CLASSINFO{Opcio'n cargada: vencimiento}\fi

 % Cargamos aquí 'geometry' para que sea después de haber establecido 'twoside'.
 \RequirePackage{geometry}}

%% Escribimos el total como comentario en el .log, en un gancho \AtEndDocument.
\AtEndDocument{
 \ifsintotales
 \else
  \if@factura\CLASSINFO{\@@Total: \space\space\space \Moneda \Total}\fi
 \fi}

%% La geometría para la factura, su reverso, y el reporte.
%% Para la factura, el margen superior está definido desde el encabezado con los datos del cliente;
%%  el margen inferior está definido hasta el final de la descripción (o del cuadro de la factura si no hay descripción).
%%  Hay elementos que salen fuera de estos márgenes, como las firmas, la nota final, la numeración y la fecha.
\def\GeometriaFactura#1{\gdef\@GeometriaFactura{#1}}
\def\GeometriaReverso#1{\gdef\@GeometriaReverso{#1}}
\def\GeometriaReporte#1{\gdef\@GeometriaReporte{#1}}

%% Se utiliza '\@Impuesto' como el factor del impuesto, el cual viene predefinido en '\@Alicuota'.
\def\@ImpuestoG{\@AlicuotaG}
\def\@ImpuestoR{\@AlicuotaR}
\def\@ImpuestoA{\@AlicuotaA}

%% Fijamos en cero los descuentos totales (necesario), y en 1 el factor de cambio divisa-moneda.
\def\@DescuentoGporc{0}
\def\@DescuentoRporc{0}
\def\@DescuentoAporc{0}
\def\@DescuentoEporc{0}
\def\@DescuentoGnum{0}
\def\@DescuentoRnum{0}
\def\@DescuentoAnum{0}
\def\@DescuentoEnum{0}
\FPset\@TasaCambio{1}

%% \Fecha, \FechaNota, \FormatoFecha, \Credito, \Moneda, \Divisa, \TasaCambio, \RazonSocial, \Nombre, \RIF, \CI, \Contacto, \Dirección, \Telefono, \Email, \Conforme, \Emisor, \Proveedor.
\NewDocumentCommand{\Fecha}{s m g g}{%
 \IfBooleanTF{#1}
  {\AtEndPreamble{\DTMsavedate{FechaEmision}{#2-#3-#4}}}
  {\AtEndPreamble{\DTMsavedatex{FechaEmision}{#2}}}}
\def\@Fecha{\DTMusedate{FechaEmision}}

\NewDocumentCommand{\FechaNota}{s m g g}{%
 \IfBooleanTF{#1}
  {\AtEndPreamble{\DTMsavedate{FechaNota}{#2-#3-#4}}}
  {\AtEndPreamble{\DTMsavedatex{FechaNota}{#2}}}}
\def\@FechaNota{\DTMusedate{FechaNota}}
\let\NotaFecha\FechaNota%  TODO: Quitar en el futuro.

\NewDocumentCommand{\FormatoFecha}{o g g}{%
 \IfValueT{#1}{\gdef\@FormatoFechaEntrada{#1}}\IfValueT{#2}{\gdef\@FormatoFecha{#2}}\IfValueT{#3}{\gdef\@FechaSeparadores{#3}}}

\def\Credito#1{\gdef\@Credito{#1}\vencimientotrue}
\def\Moneda#1{\gdef\@Moneda{#1}}
\def\Divisa#1{\gdef\@Divisa{#1}}
\def\TasaCambio#1{\FPset\@TasaCambio{#1}\@TasaCambiotrue}
\def\RazonSocial#1{\gdef\@RazonSocial{#1}}
\def\Nombre#1{\gdef\@RazonSocial{#1}\@Nombretrue}
\def\RIF#1{\gdef\@RIF{#1}}
\def\CI#1{\gdef\@RIF{#1}\let\@@RIF\@@CI\let\@CI\@RIF}
\def\Contacto#1{\gdef\@Contacto{#1}}
\def\Direccion#1{\gdef\@Direccion{#1}}
\def\Telefono#1{\gdef\@Telefono{#1}}
\def\Email#1{\gdef\@Email{#1}}
\def\Conforme#1{\gdef\@Conforme{#1}}
\def\Emisor#1{\gdef\@Emisor{#1}}
\def\Proveedor#1{\gdef\@Proveedor{#1}}

%% \Membrete, \EncabezadoFactura, \EncabezadoReporte.
\NewDocumentCommand{\Membrete}{+m}{\gdef\@Membrete{#1}}
\NewDocumentCommand{\EncabezadoFactura}{+m}{\gdef\@EncabezadoFactura{#1}}
\NewDocumentCommand{\EncabezadoReporte}{+m}{\gdef\@EncabezadoReporte{#1}}

%% Los descuentos totales.
\NewDocumentCommand{\Descuento}{s m}{%
 \IfBooleanTF{#1}
  {\@DescGnumtrue\@DescRnumtrue\@DescAnumtrue\@DescEnumtrue
  \gdef\@DescuentoGnum{#2}\gdef\@DescuentoRnum{#2}\gdef\@DescuentoAnum{#2}\gdef\@DescuentoEnum{#2}}
  {\@DescGnumfalse\@DescRnumfalse\@DescAnumfalse\@DescEnumfalse
  \gdef\@DescuentoGporc{#2}\gdef\@DescuentoRporc{#2}\gdef\@DescuentoAporc{#2}\gdef\@DescuentoEporc{#2}}%
 \@DescGtrue\@DescRtrue\@DescAtrue\@DescEtrue\@DescuentoTotaltrue}

\NewDocumentCommand{\DescuentoG}{s m}{%
 \IfBooleanTF{#1}{\@DescGnumtrue\gdef\@DescuentoGnum{#2}}{\@DescGnumfalse\gdef\@DescuentoGporc{#2}}%
 \@DescGtrue\@DescuentoTotaltrue}

\NewDocumentCommand{\DescuentoR}{s m}{%
 \IfBooleanTF{#1}{\@DescRnumtrue\gdef\@DescuentoRnum{#2}}{\@DescRnumfalse\gdef\@DescuentoRporc{#2}}%
 \@DescRtrue\@DescuentoTotaltrue}

\NewDocumentCommand{\DescuentoA}{s m}{%
 \IfBooleanTF{#1}{\@DescAnumtrue\gdef\@DescuentoAnum{#2}}{\@DescAnumfalse\gdef\@DescuentoAporc{#2}}%
 \@DescAtrue\@DescuentoTotaltrue}

\NewDocumentCommand{\DescuentoE}{s m}{%
 \IfBooleanTF{#1}{\@DescEnumtrue\gdef\@DescuentoEnum{#2}}{\@DescEnumfalse\gdef\@DescuentoEporc{#2}}%
 \@DescEtrue\@DescuentoTotaltrue}

\def\Denominacion#1{\gdef\@Denominacion{#1}}%  La denominación puede ser 'FACTURA', 'COTIZACIÓN', 'NOTA DE CRÉDITO', 'NOTA DE DÉBITO' u otra. Se predetermina alguna de estas opciones según las opciones con las que se carga la clase.
\let\Denom\Denominacion%  TODO: Quitar en el futuro.

%% Número de la factura con \Num, número de control con \NumControl, y número de serie de control \NumSerieControl.
%% Si el número de control no se especifica, toma el mismo que el de la factura.
%% Si el número de serie de control no se especifica, toma '00'.
\def\Num#1{\gdef\@Num{\nplpadding{\@DigitosNumeracion}\npthousandsep{}\numprint{#1}}}
\def\NumControl#1{\gdef\@NumControl{\nplpadding{\@DigitosNumeracion}\npthousandsep{}\numprint{#1}}}
\def\NumSerieControl#1{\gdef\@NumSerieControl{#1}}

\def\NumNota#1{\gdef\@NumNota{\nplpadding{\@DigitosNumeracion}\npthousandsep{}\numprint{#1}}}
\let\NotaNum\NumNota%  TODO: Quitar en el futuro.

%% Información de página: cabeceras de páginas o pies de página.
\def\InfoPagina#1{\gdef\@InfoPagina{#1}}

%% Resumen opcional que va a la derecha de los datos del cliente.
\NewDocumentCommand{\Resumen}{+m}{\gdef\@Resumen{#1}}

%% Nota previa (al cuadro), nota interna (del cuadro), nota externa (luego del cuadro) y nota final (luego de la descripción).
%% %% Sin *, sustituye; con un * hace append; con ** hace prepend.
\NewDocumentCommand{\NotaPrevia}{s s +m}{%
 \IfBooleanTF{#2}
 {\gpreto{\@NotaPrevia}{#3}}
 {\IfBooleanTF{#1}{\gappto{\@NotaPrevia}{#3}}{\gdef\@NotaPrevia{#3}}}}

\NewDocumentCommand{\NotaInterna}{s s +m}{%
 \IfBooleanTF{#2}
 {\gpreto{\@NotaInterna}{#3}}
 {\IfBooleanTF{#1}{\gappto{\@NotaInterna}{#3}}{\gdef\@NotaInterna{#3}}}}

\NewDocumentCommand{\NotaExterna}{s s +m}{%
 \IfBooleanTF{#2}
 {\gpreto{\@NotaExterna}{#3}}
 {\IfBooleanTF{#1}{\gappto{\@NotaExterna}{#3}}{\gdef\@NotaExterna{#3}}}}

\NewDocumentCommand{\NotaFinal}{s s +m}{%
 \IfBooleanTF{#2}
 {\gpreto{\@NotaFinal}{#3}}
 {\IfBooleanTF{#1}{\gappto{\@NotaFinal}{#3}}{\gdef\@NotaFinal{#3}}}}

%% Primer \AtBeginDocument para hacer chequeos. Los demás se ejecutan todos después de este.
\AtBeginDocument{%
 % Si no se especificó fecha, tomamos la de hoy. Además, advertimos cuando el documento se está compilando en una fecha distinta de la fecha establecida en el encabezado.
 \DTMifsaveddate{FechaEmision}{}{%
  \CLASSWARNING{No se especifico' fecha. Asumiendo la fecha de hoy}%
  \DTMsavedate{FechaEmision}{\the\year-\the\month-\the\day}}%
 \DTMsavenow{Ahora}%
 \DTMsaveddatediff{FechaEmision}{Ahora}{\AuxFecha}%
 \ifnum\AuxFecha=0%
 \else
  \CLASSWARNING{Fecha del documento \@Fecha\space distinta de la fecha de hoy}%
 \fi

%% (quitado por no vigente)
 % Establecemos el signo monetario dependiendo de la fecha de emisión de la factura, para efectos de la Reconversión Monetaria:
 % \ifx\@undefined\@Moneda
 %  \DTMsaveddatediff{FechaEmision}{FechaBsS}{\AuxFecha}%
 %  \ifnum\AuxFecha<0%
 %   \Moneda{\@MonedaBs}%
 %   \LetraNotaInterna{\fontsize{14}{18}}%
 %   \NotaInterna{\FPupn\TotalBsS{\Total{} 100000 div \@DigitosMoneda{} round}Según Decreto Presidencial 3.548, el total en Bolívares Soberanos es de {\bfseries \@MonedaBsS~\numprint{\TotalBsS}}}%
 %   \CLASSWARNING{Se establecio' el texto aclaratorio sobre el total en Boli'vares Soberanos como una nota interna}%
 %  \else
 %   \DTMsaveddatediff{FechaEmision}{FechaBs}{\AuxFecha}%
 %   \ifnum\AuxFecha>-1%
 %    \Moneda{\@MonedaBs}%
 %   \else
 %    \Moneda{\@MonedaBsS}%
 %    \LetraNotaInterna{\fontsize{14}{18}}%
 %    \NotaInterna{\FPupn\TotalBsF{\Total{} 100000 * \@DigitosMoneda{} round}El total en Bolívares Fuertes es de {\bfseries \@MonedaBsF~\numprint{\TotalBsF}}}%
 %    \CLASSWARNING{Se establecio' el texto aclaratorio sobre el total en Boli'vares Fuertes como una nota interna}%
 %   \fi
 %  \fi
 % \fi

 % Efectuamos distintos chequeos para dar errores o advertencias si faltó algún dato por especificar.
 \ifdivisa
 \else
  \if@TasaCambio
   \CLASSWARNING{Se pidio' tasa de cambio sin pedir opcio'n divisa. Ignorando tasa de cambio}
   \FPset\@TasaCambio{1}\@TasaCambiofalse
  \fi
 \fi
 \if@reporte
  \ifsinencabezadoreporte
   \ifdefvoid{\@RazonSocial}{\CLASSWARNING{No se especifico' la razo'n social. Puede dar error}}{}%
  \else
   \ifdefvoid{\@RazonSocial}{\CLASSERROR{Hay que definir la razo'n social}}{}%
  \fi
  \ifdefvoid{\@Num}{\CLASSWARNING{No se especifico' el nu'mero de la factura. Puede dar error}}{}%
  \ifdefvoid{\@Proveedor}{%
   \ifdefvoid{\@Emisor}
    {\ifsinencabezadoreporte
      \CLASSWARNING{No se especifico' el proveedor. Puede dar error}%
     \else
      \CLASSERROR{Hay que definir el nombre del proveedor cuando se emite un reporte}%
     \fi}%
    {\CLASSWARNING{Se toma el emisor como el proveedor por no haberse especificado este u'ltimo}%
    \let\@Proveedor=\@Emisor}}
   {}%
 \fi
 \if@factura
  \ifnotadecredito
   \ifdefvoid{\@NumNota}{\CLASSERROR{Debe definirse el nu'mero de la factura a corregir con una nota de cre'dito}}{}
   \DTMifsaveddate{FechaNota}{}{\CLASSERROR{Debe definirse la fecha de la factura a corregir con una nota de cre'dito}}
  \fi
  \ifnotadedebito
   \ifdefvoid{\@NumNota}{\CLASSERROR{Debe definirse el nu'mero de la factura a corregir con una nota de de'bito}}{}
   \DTMifsaveddate{FechaNota}{}{\CLASSERROR{Debe definirse la fecha de la factura a corregir con una nota de de'bito}}
  \fi
  \ifsinencabezadofactura
   \CLASSWARNING{Se pidio la opcio'n 'sinencabezadofactura'; no se esta' verificando si esta'n definidos algunos datos del cliente}
  \else
   \ifdefvoid{\@RazonSocial}{\CLASSERROR{Hay que definir la razo'n social}}{}%
   \ifdefvoid{\@RIF}{\CLASSERROR{Hay que definir el R.I.F}}{}%
   \ifdefvoid{\@Direccion}{\CLASSERROR{Hay que definir la direccio'n fiscal}}{}%
   \ifdefvoid{\@Telefono}{\CLASSWARNING{Pudiera definirse un nu'mero telefo'nico}}{}%
  \fi
  \ifdefvoid{\@Contacto}{\if@Nombre\else\CLASSWARNING{Pudiera definirse una persona de contacto}\fi}{}%
  \ifdefvoid{\@Email}{\CLASSWARNING{Pudiera definirse una direccio'n de correo electro'nico}}{}%
  \ifdefvoid{\@NotaFinal}{\CLASSWARNING{Pudiera definirse una nota final}}{}%
  \ifprefactura
   \ifdefvoid{\@FondoFactura}{\CLASSWARNING{En la opcio'n para prefactura se recomienda agregar el fondo}}{}%
  \fi
  % Fijamos la denominación del documento paras las cotizaciones, facturas o notas de crédito o débito, que son casos particulares del modo 'factura'.
  \ifdefvoid{\@Denominacion}{%
   \ifcotizacion
    \Denominacion{\@@DenominacionCotizacion}%
   \else
    \ifnotadecredito
     \Denominacion{\@@DenominacionNotaDeCredito}%
    \else
     \ifnotadedebito
      \Denominacion{\@@DenominacionNotaDeDebito}%
     \else
      \Denominacion{\@@DenominacionFactura}%
     \fi
    \fi
   \fi}{}%
  \ifsindenominacion
  \else
   \ifcotizacion
   \else
    \ifsinnumero
     \CLASSERROR{La opcio'n para no poner el nu'mero so'lo es compatible con las cotizaciones}%
    \else
     \ifdefvoid{\@Num}{\CLASSERROR{Hay que definir el nu'mero del documento a producir}}{}%
    \fi
   \fi
  \fi
 \fi

 % El cálculo de la fecha de vencimiento para cuando haya crédito o fecha de vencimiento explícita.
 \ifdefvoid{\@Credito}
  {\gdef\@FechaVencimiento{\DTMusedate{FechaEmision}}}
  {\DTMsaveddateoffsettojulianday{FechaEmision}{\@Credito}{\AuxFecha}%
   \DTMsavejulianday{FechaVencimiento}{\number\AuxFecha}%
   \gdef\@FechaVencimiento{\DTMusedate{FechaVencimiento}}}%
 \ifx\@undefined\@NumControl\let\@NumControl\@Num\fi
 \ifx\@undefined\@NumSerieControl\gdef\@NumSerieControl{00}\fi

 % Establecemos los porcentajes de las alícuotas, y redondeamos los descuentos.
 \FPupn\@AlicuotaGporc{\@AlicuotaG{} 100 * \@DigitosPorc{} round clip}%
 \FPupn\@AlicuotaRporc{\@AlicuotaR{} 100 * \@DigitosPorc{} round clip}%
 \FPupn\@AlicuotaAporc{\@AlicuotaA{} 100 * \@DigitosPorc{} round clip}%
 \FPset\@AlicuotaEporc{0}%
 \FPupn\@DescuentoGporc{\@DescuentoGporc{} \@DigitosPorc{} round clip}%
 \FPupn\@DescuentoRporc{\@DescuentoRporc{} \@DigitosPorc{} round clip}%
 \FPupn\@DescuentoAporc{\@DescuentoAporc{} \@DigitosPorc{} round clip}%
 \FPupn\@DescuentoEporc{\@DescuentoEporc{} \@DigitosPorc{} round clip}%
 \FPupn\@DescuentoGfactor{100 \@DescuentoGporc{} /}%
 \FPupn\@DescuentoRfactor{100 \@DescuentoRporc{} /}%
 \FPupn\@DescuentoAfactor{100 \@DescuentoAporc{} /}%
 \FPupn\@DescuentoEfactor{100 \@DescuentoEporc{} /}

 % Una vez definido todo en el preámbulo, los comandos usados para definir campos servirán para mostrar el campo que se definió con ese comando.
 \def\Moneda{\@Moneda}%
 \def\Divisa{\@Divisa}%
 \def\TasaCambio{\@TasaCambio}%
 \def\RazonSocial{\@RazonSocial}%
 \let\Nombre\RazonSocial
 \def\RIF{\@RIF}%
 \let\CI\RIF
 \def\Direccion{\@Direccion}%
 \def\Telefono{\@Telefono}%
 \def\Email{\@Email}%
 \def\Contacto{\@Contacto}%
 \def\Emisor{\@Emisor}%
 \def\Conforme{\@Conforme}%
 \def\Proveedor{\@Proveedor}%
 \def\Fecha{\@Fecha}%
 \def\FechaVencimiento{\@FechaVencimiento}%
 \def\FechaNota{\@FechaNota}%
 \def\Credito{\@Credito}%
 \def\Num{\@Num}%
 \def\NumSerieControl{\@NumSerieControl}%
 \def\NumControl{\@NumControl}%
 \def\NumNota{\@NumNota}%
 \def\NotaFinal{\@NotaFinal}%
 \def\Resumen{\@Resumen}%
 \def\NotaPrevia{\@NotaPrevia}%
 \def\NotaInterna{\@NotaInterna}%
 \def\NotaExterna{\@NotaExterna}%
 \def\TituloReporte{\@TituloReporte}}

\setlength{\parindent}{0pt}
\setlength{\lineskip}{0pt}%

%% Posiciones (X,Y) de los objetos: i) fecha, ii) forma libre, iii) número de control, vi) denominación, v) nota final, vi) firmas.
%% Con * abren hacia arriba las cajas. Los valores negativos se aceptan.
\NewDocumentCommand{\PosFecha}{s m m}{
 \setlength{\@PosFechaX}{#2}
 \setlength{\@PosFechaY}{#3}
 \IfBooleanTF{#1}{\booltrue{FechaYarriba}}{\boolfalse{FechaYarriba}}
 \IfBeginWith{#2}{-}{\booltrue{FechaXnegativo}}{\boolfalse{FechaXnegativo}}
 \IfBeginWith{#3}{-}{\booltrue{FechaYnegativo}}{\boolfalse{FechaYnegativo}}}

\NewDocumentCommand{\PosFormalibre}{s m m}{
 \setlength{\@PosFormalibreX}{#2}
 \setlength{\@PosFormalibreY}{#3}
 \IfBooleanTF{#1}{\booltrue{FormalibreYarriba}}{\boolfalse{FormalibreYarriba}}
 \IfBeginWith{#2}{-}{\booltrue{FormalibreXnegativo}}{\boolfalse{FormalibreXnegativo}}
 \IfBeginWith{#3}{-}{\booltrue{FormalibreYnegativo}}{\boolfalse{FormalibreYnegativo}}}

\NewDocumentCommand{\PosControl}{s m m}{
 \setlength{\@PosControlX}{#2}
 \setlength{\@PosControlY}{#3}
 \IfBooleanTF{#1}{\booltrue{ControlYarriba}}{\boolfalse{ControlYarriba}}
 \IfBeginWith{#2}{-}{\booltrue{ControlXnegativo}}{\boolfalse{ControlXnegativo}}
 \IfBeginWith{#3}{-}{\booltrue{ControlYnegativo}}{\boolfalse{ControlYnegativo}}}

\NewDocumentCommand{\PosDenominacion}{s m m}{
 \setlength{\@PosDenominacionX}{#2}
 \setlength{\@PosDenominacionY}{#3}
 \IfBooleanTF{#1}{\booltrue{DenominacionYarriba}}{\boolfalse{DenominacionYarriba}}
 \IfBeginWith{#2}{-}{\booltrue{DenominacionXnegativo}}{\boolfalse{DenominacionXnegativo}}
 \IfBeginWith{#3}{-}{\booltrue{DenominacionYnegativo}}{\boolfalse{DenominacionYnegativo}}}
\let\PosDenom\PosDenominacion%  TODO: Quitar en el futuro.

\NewDocumentCommand{\PosNotaFinal}{s m m m}{
 \setlength{\@PosNotaFinalXuno}{#2}
 \setlength{\@PosNotaFinalXdos}{#3}
 \setlength{\@PosNotaFinalY}{#4}
 \IfBooleanTF{#1}{\booltrue{NotaFinalYarriba}}{\boolfalse{NotaFinalYarriba}}
 \IfBeginWith{#4}{-}{\booltrue{NotaFinalYnegativo}}{\boolfalse{NotaFinalYnegativo}}}
%% La nota final se define con un X_inicial, un X_final y un Y_inicial (Xo,Xf,Y)

\NewDocumentCommand{\PosFirmas}{m m m}{
 \setlength{\@PosFirmasXuno}{#1}
 \setlength{\@PosFirmasXdos}{#2}
 \setlength{\@PosFirmasY}{#3}
 \IfBeginWith{#3}{-}{\booltrue{FirmasYnegativo}}{\boolfalse{FirmasYnegativo}}}
%% La firma se define con un X_inicial, un X_final y un Y_inicial (Xo,Xf,Y)

%% Tamaño y grosor de la línea de las firmas.
\def\LineaFirmas#1#2{
 \setlength{\@TamLineaFirmas}{#1}
 \setlength{\@GrosorLineaFirmas}{#2}}

%% Separación mínima horizontal entre los totales en modo de filas y distancia vertical entre esas líneas, fija.
\def\SepFilas#1#2{\setlength{\@SeparaMinTotales}{#1}\setlength{\@SeparaFilas}{#2}}

%% Separación vertical entre los elementos de la factura (entre el encabezado y el cuadro de la 'factura', luego desde dicho cuadro hasta la descripción, o hasta los totales en modo de filas).
\def\SepVertical#1{\setlength{\@SeparaVertical}{#1}}

%% Separación horizontal entre la caja de los datos del cliente y la caja del resumen.
\def\SepDatosResumen#1{\setlength{\@SeparaDatosResumen}{#1}}

%% Separación horizontal interna entre la línea y el texto en los datos del cliente y en el resumen.
\def\SepEncabezado#1{\setlength{\@SeparaInternaEncabezado}{#1}}

%% Separación interna entre la línea y el texto de la nota previa.
\def\SepNotaPrevia#1{\setlength{\@SeparaInternaNotaPrevia}{#1}}

%% Separación extra entre los elementos en la factura.
\def\SepItemsExtra#1{\setlength{\@SeparaItemsExtra}{#1}}

%% Separación interna entre la línea y el texto de la descripción, y de la nota final.
\def\SepDescripcion#1{\setlength{\@SeparaInternaDescripcion}{#1}}
\def\SepNotaFinal#1{\setlength{\@SeparaInternaNotaFinal}{#1}}

%% Para i) encabezado, ii) nota previa, iii) description, iv) nota final: grosor de la línea de las cajas, curvatura de la esquina y sombra.
%% (si pedimos linea de 0pt, todo queda en cero y no se abre el ambiente TikZ).
\NewDocumentCommand{\LineaEncabezado}{m g g}{
 \setlength{\@GrosorLineaEncabezado}{#1}
 \IfValueT{#2}{\setlength{\@EsquinaLineaEncabezado}{#2}}
 \IfValueT{#3}{\setlength{\@SombraEncabezado}{#3}}}

\NewDocumentCommand{\LineaNotaPrevia}{m g g}{
 \setlength{\@GrosorLineaNotaPrevia}{#1}
 \IfValueT{#2}{\setlength{\@EsquinaLineaNotaPrevia}{#2}}
 \IfValueT{#3}{\setlength{\@SombraNotaPrevia}{#3}}}

\NewDocumentCommand{\LineaDescripcion}{m g g}{
 \setlength{\@GrosorLineaDescripcion}{#1}
 \IfValueT{#2}{\setlength{\@EsquinaLineaDescripcion}{#2}}
 \IfValueT{#3}{\setlength{\@SombraDescripcion}{#3}}}

\NewDocumentCommand{\LineaNotaFinal}{m g g}{
 \setlength{\@GrosorLineaNotaFinal}{#1}
 \IfValueT{#2}{\setlength{\@EsquinaLineaNotaFinal}{#2}}
 \IfValueT{#3}{\setlength{\@SombraNotaFinal}{#3}}}

%% El espacio vertical que hay que avanzar sólo en la primera página del reporte antes de empezar a escribir sobre él. Usable cuando la primera página tiene un membrete y las demás no, es decir, cuando se usa \FondoReporte y no \FondoReporte*.
\def\InicioReporte#1{\setlength{\@InicioReporte}{#1}}

%% Tipos de letra para cada elemento posible:
%% Esta es la letra de la descripción de los items; y el espacio \baselineskip de *toda* la tabla de la factura se fija en este comando únicamente (se predeterminó 18pt).
\def\LetraItems#1{\gdef\@LetraItems{#1\selectfont}}

%% Tipo de letra para la nota interna:
\def\LetraNotaInterna#1{\gdef\@LetraNotaInterna{#1\selectfont}}

%% Tipo de letra para la nota externa:
\def\LetraNotaExterna#1{\gdef\@LetraNotaExterna{#1\selectfont}}

%% Con este comando se cambia la etra del título de la tabla, es decir, los textos 'Cantidad, 'Descripción', etc...
\def\LetraTitColumnas#1{\gdef\@LetraTitColumnas{#1\selectfont}}

%% Tipo de letra de los títulos de los totales, por ejemplo los textos: 'B.I. G', 'IVA G'.
\def\LetraTitTotales#1{\gdef\@LetraTitTotales{#1\selectfont}}

%% Letra con la que salen los totales parciales, es decir, los números, exceptuando el total general.
\def\LetraNumTotales#1{\gdef\@LetraNumTotales{#1\selectfont}}

%% Letra con la que sale la palabra 'TOTAL'.
\def\LetraTitTotal#1{\gdef\@LetraTitTotal{#1\selectfont}}

%% Letra para el total general, el monto.
\def\LetraNumTotal#1{\gdef\@LetraNumTotal{#1\selectfont}}

%% Tipo de letra para los títulos de las cajas del encabezado, por ejemplo: 'Datos del cliente'.
\def\LetraTitEnc#1{\gdef\@LetraTitEnc{#1\selectfont}}

%% Tipo de letra para el texto en el encabezado de la factura.
\def\LetraEncFactura#1{\gdef\@LetraEncFactura{#1\selectfont}}

%% Tipo de letra para el texto del membrete de la factura.
\def\LetraMembrete#1{\gdef\@LetraMembrete{#1\selectfont}}

%% Tipo de letra para el texto en el encabezado del reporte.
\def\LetraEncReporte#1{\gdef\@LetraEncReporte{#1\selectfont}}

%% Letra para los montos individuales de la factura y las cantidades.
\def\LetraNumeros#1{\gdef\@LetraNumeros{#1\selectfont}}

%% El tipo de IVA ('G', 'R', 'A' o '(E)') también tiene su tipo de letra.
\def\LetraTipoIVA#1{\gdef\@LetraTipoIVA{#1\selectfont}}

%% Letra para la descripción larga (comando \Descripcion).
\def\LetraDescripcion#1{\gdef\@LetraDescripcion{#1\selectfont}}

%% Tipo de letra para el texto bajo las líneas para firmar.
\def\LetraFirmas#1{\gdef\@LetraFirmas{#1\selectfont}}

%% Tipo de letra para la nota previa.
\def\LetraNotaPrevia#1{\gdef\@LetraNotaPrevia{#1\selectfont}}

%% Tipo de letra para la nota final.
\def\LetraNotaFinal#1{\gdef\@LetraNotaFinal{#1\selectfont}}

%% Letra para la denominación del documento ('FACTURA', 'NOTA DE CRÉDITO', 'NOTA DE DÉBITO', 'COTIZACIÓN',...).
\def\LetraDenominacion#1{\gdef\@LetraDenominacion{#1\selectfont}}
\let\LetraDenom\LetraDenominacion%  TODO: Quitar en el futuro.

%% Letra para el texto 'FORMA LIBRE'
\def\LetraFormalibre#1{\gdef\@LetraFormalibre{#1\selectfont}}

%% Letra para la numeración de la factura.
\def\LetraNumeracion#1{\gdef\@LetraNumeracion{#1\selectfont}}

%% Letra para las fechas (emisión y vencimiento).
\def\LetraFecha#1{\gdef\@LetraFecha{#1\selectfont}}

%% Letra para el título del reporte.
\def\LetraTitReporte#1{\gdef\@LetraTitReporte{#1\selectfont}}

%% Letra para las cabeceras de las páginas en el modo reporte.
\def\LetraInfoPagina#1{\gdef\@LetraInfoPagina{#1\selectfont}}

%% Letra para el reverso de la factura.
\def\LetraReverso#1{\gdef\@LetraReverso{#1\selectfont}}

%% Letra para el reporte.
\def\LetraReporte#1{\gdef\@LetraReporte{#1\selectfont}}

%% Comando para incluir la firma escaneada en el sitio donde va la línea de la firma del emisor.
\NewDocumentCommand{\FirmaFactura}{m O{0pt} O{0pt}}{% \FirmaFactura{imagen}[x-corr][y-corr]
 \AtEndPreamble{
  \if@factura
   \RequirePackage{graphicx}
   \ifx&#2&\else\setlength{\@FirmaFacturaXcorr}{#2}\fi
   \ifx&#3&\else\setlength{\@FirmaFacturaYcorr}{#3}\fi
   \savebox{\@CajaFirmaEmisor}{#1}
   \AtBeginShipoutNext{%
    \begin{textblock*}{\@TamLineaFirmas}%
     (\textwidth+\oddsidemargin+1in-\@TamLineaFirmas/2-\wd\@CajaFirmaEmisor/2-\@PosFirmasXdos+\@FirmaFacturaXcorr,\@PosFirmasY-\ht\@CajaFirmaEmisor-\dp\@CajaFirmaEmisor+\@FirmaFacturaYcorr)%
     \usebox{\@CajaFirmaEmisor}%
    \end{textblock*}}%
  \fi}}

%% Comando para la firma del reporte. No es un comando del preámbulo.
\NewDocumentCommand{\FirmaReporte}{O{} O{0pt} O{0pt} G{\@Proveedor} O{\@FirmaReportePosX} O{\@FirmaReporteExcesoLinea}}{% \Firma[imagen][x-corr][y-corr]{texto}[posición en X desde la derecha][tamaño linea]
 \renewcommand{\baselinestretch}{1}\selectfont
 \newif\if@Firma@Dibujo
 \newbox{\TextoFirma}%
 \newbox{\DibujoFirma}%
 \ifx&#1&\else\savebox{\DibujoFirma}{#1}\@Firma@Dibujotrue\fi
 \setlength{\@FirmaReporteXcorr}{#2}%
 \setlength{\@FirmaReporteYcorr}{#3}%
 \savebox{\TextoFirma}{#4}%
 \setlength{\@FirmaReporteTextPos}{#5}%
 \setlength{\@FirmaReporteTamLinea}{#6}%
 \@LetraFirmas
 \if@Firma@Dibujo
  \newlength{\@FirmaReporteoddeven}%
  \setlength{\@FirmaReporteFirmaPos}{\zposy{Firma@zref@PosY}sp}%
 \fi
 \ifdim\wd\DibujoFirma>\wd\TextoFirma
  \setlength{\@FirmaReporteTamLinea}{\@FirmaReporteTamLinea+\wd\DibujoFirma}%
 \else
  \setlength{\@FirmaReporteTamLinea}{\@FirmaReporteTamLinea+\wd\TextoFirma}%
 \fi
 \par
 \vspace*{\ht\DibujoFirma}%
 \vspace*{\dp\DibujoFirma}%
 \hfill
 \parbox{\@FirmaReporteTamLinea}{%
  \if@Firma@Dibujo\zsaveposy{Firma@zref@PosY}\fi
  \rule{\@FirmaReporteTamLinea}{\@GrosorLineaFirmas}\\
  \centering{\usebox{\TextoFirma}}}%
 \hspace*{\@FirmaReporteTextPos}\par
 \if@Firma@Dibujo
  \mbox{}%
  \par
  \ifodd\c@page
   \setlength{\@FirmaReporteoddeven}{\oddsidemargin}%
  \else
   \setlength{\@FirmaReporteoddeven}{\evensidemargin}%
  \fi
  \begin{textblock*}{\@FirmaReporteTamLinea}
  (\textwidth+\@FirmaReporteoddeven+1in-0.5\@FirmaReporteTamLinea-0.5\wd\DibujoFirma-\@FirmaReporteTextPos+\@FirmaReporteXcorr,
   \paperheight-\@FirmaReporteFirmaPos-\ht\DibujoFirma-\dp\DibujoFirma+\@FirmaReporteYcorr)
   \noindent\usebox{\DibujoFirma}%
  \end{textblock*}
 \fi}

%% Con \FondoFactura le damos el nombre del archivo que contiene el formato de la factura, por ejemplo para compilaciones con 'prefactura', 'cotizacion' o para incluir una imagen de fondo como 'marca de agua'.
\newcommand{\FondoFactura}[1]{
 \AtEndPreamble{
  \if@factura
   \RequirePackage{graphicx}
   \@FondoFacturatrue
   \gdef\@FondoFactura{#1}
  \fi}}

%% Con \FondoReporte le damos el nombre del archivo que contiene el formato del reporte. Existen dos posibilidades: que dicho fondo salga en todas las páginas, o sólo en la primera.
%% Con * sale en todas las páginas; sin * sale sólo en la primera página.
\NewDocumentCommand{\FondoReporte}{s m}{
 \AtEndPreamble{
  \if@reporte
   \@FondoReportetrue
   \RequirePackage{graphicx}
   \gdef\@FondoReporte{#2}
   \IfBooleanT{#1}{\@FondoReporteStartrue}
  \fi}}

%% Comando para establecer desde el preámbulo el estilo de página (\pagestyle) del reporte, tanto para la primera página como para las siguientes.
\NewDocumentCommand{\EstiloPagina}{o m}{
 \gdef\@EstiloPaginaResto{#2}
 \IfValueTF{#1}{\gdef\@EstiloPaginaUno{#1}}{\gdef\@EstiloPaginaUno{\@EstiloPaginaResto}}}
\let\EstiloPagReporte\EstiloPagina

%% El título para el reporte.
%% Con * sale el título en las cabeceras o pies. Sin *, no.
\NewDocumentCommand{\TituloReporte}{s m}{
 \gdef\@TituloReporte{#2}%
 \IfBooleanTF{#1}{\gdef\@InfoPagina{\let\\\relax\@InfoPaginaTitulo}}{\let\@InfoPagina\@InfoPaginaNoTitulo}}

%% Para cada cliente o para cada personalización se puede tener un archivo .def o .tex con su nombre y ciertas macros cargadas. Ese archivo lo ponemos incluir con '\Cliente' en lugar de usar \input, y la extensión deberá ser .def o .tex.
\newcommand{\Cliente}[1]{%
 \IfFileExists{#1.def}{\input{#1.def}}{
  \IfFileExists{#1.tex}{\input{#1.tex}}{
   \CLASSERROR{No existe #1.def ni #1.tex}}}}

\input{factura.def}

%% Comando para escribir el encabezado en la factura.
\newcommand{\@EscribeEncFactura}{%
 \ifsinencabezadofactura
  \ifdefvoid{\@Resumen}{}{\CLASSWARNING{La opcio'n 'sinencabezadofactura' no es compatible con escribir un resumen. No aparecera' el resumen.}}
  \ifdefvoid{\@EncabezadoFactura}{}{{\@LetraEncFactura\@EncabezadoFactura\par}}%
 \else
  \ifdefvoid{\@Resumen}{\@EscribeDatos}{\@EscribeDatosResumen}%
 \fi}

%% Comando para escribir el encabezado en el reporte.
\newcommand{\@EscribeEncReporte}{%
 \vspace*{-\topskip}%
 \if@FondoReporte
  \if@FondoReporteStar
  \else
   \vspace*{\@InicioReporte}%
  \fi
 \fi
 \ifsinencabezadoreporte
  \ifdefvoid{\@EncabezadoReporte}{}{{\setlength{\parindent}{0pt}\@LetraEncReporte\@EncabezadoReporte\vskip\baselineskip}}%
 \else
  \@EscribeDatosReporte\vskip\baselineskip
 \fi
 \@LetraReporte}

%% Comando \@EscribeMembrete para que el emisor pueda agregar su información de membrete de la factura (no usable en Venezuela para facturas fiscales que ya vienen membretadas).
\newcommand{\@EscribeMembrete}{%
 \begin{textblock*}{\paperwidth}(0pt,0pt)
  \begin{minipage}[t][\topmargin+1in]{\paperwidth}
   \@LetraMembrete\@Membrete
  \end{minipage}
 \end{textblock*}}

%% El entorno 'factura', usando el paquete 'environ' para su definición, y el comando auxiliar \@FacturaAuxCmd.
%% Gracias a Heiko Oberdiek y a David Carlisle (Thanks to Heiko Oberdiek and David Carlisle).
%% http://tex.stackexchange.com/questions/108565/know-the-cell-width-with-tabular-or-include-a-paragraph-box-without-specifying
\NewEnviron{factura}{%
 \vspace*{\@SeparaVertical}%
 \ifsinexpandir\vfill\fi
 \@EscribeNotaPrevia
 \ifx\undefined\Total
  \expandafter\@FacturaAuxCmd\expandafter{\BODY}%
  \ifnum\value{page}=1\else\CLASSERROR{La factura ocupa mas que una pagina}\fi
 \else
  \CLASSERROR{Ya se uso' un entorno de factura, ignorando}\fi}

\NewEnviron{reverso}{%
 \if@factura
  \expandafter\newgeometry\expandafter{\@GeometriaReverso}%
  \topskip1sp% ¡¡No puedo poner 0 porque se genera una página en blanco extra!!
  \begin{minipage}[t][\textheight-\pagetotal]{\linewidth}%
   \thispagestyle{empty}%
   \@LetraReverso
   \BODY
  \end{minipage}
  \clearpage
 \fi}

%% Comando auxiliar para agregar un carácter al final de cada línea en la descripción dentro del cuadro de la factura si ocupa ésta más de una línea.
%% Gracias a Gustavo Mezzetti y a David Carlisle (Thanks to Gustavo Mezzetti and David Carlisle).
%% http://tex.stackexchange.com/questions/296035/insert-a-special-character-at-each-end-of-line-in-a-paragraph
%% http://tex.stackexchange.com/questions/248944/how-to-put-before-lines
\newcommand{\@DescripcionAuxCmd}[2]{%
 \immediate\write\@auxout{\gdef\noexpand\@TamDescripcion{\the\linewidth}}% Para poder establecer la línea diagonal hay que saber el tamaño del campo de la descripción.
 \ifivadescripcion\settowidth{\@TempDimen}{\@EscribeTipoDeImpuesto{#2}}\fi
 \savebox{\@CajaPrueba}{%
  \parbox[t]{\linewidth}{%
   \David@XStart
   \ifdescripcioncentrada\centering\arraybackslash\fi
   #1%
   \David@XEnd
   \ifdim\@TempDimen=0pt%
   \else
    \hfill\kern\@SeparaFinLineaDesc\@EscribeTipoDeImpuesto{#2}%
   \fi
   \par\global\count1=\prevgraf}}%
 \ifsinmarcasfactura
  \usebox{\@CajaPrueba}%
 \else
  \ifnum\count1=1%
   \usebox{\@CajaPrueba}%
  \else
   \ifdim\@TempDimen>\wd\@CajaCaracterCR
   \else
    \setlength{\@TempDimen}{\wd\@CajaCaracterCR}%
   \fi
   \parbox[t]{\linewidth-\@TempDimen-\@SeparaFinLineaDesc}{%
    \David@XStart
    \ifdescripcioncentrada\centering\arraybackslash\fi
    #1%
    \David@XEnd
    \par
    \global\count1=\prevgraf% Esto lo necesitamos en otro lado para calcular el espacio extra en los ítems.
    \count0=\prevgraf
    \count2=\prevgraf
    \loop
     \ifnum\count0=\count2
      \ifivadescripcion
       \vskip-\baselineskip
       \mbox{}\hfill
       \rlap{%
        \hspace*{\@TempDimen}%
        \hspace*{\@SeparaFinLineaDesc}%
        \llap{\@EscribeTipoDeImpuesto{#2}}}%
      \fi
     \else
      \mbox{}\hfill
      \rlap{%
       \hspace*{\@TempDimen}%
       \hspace*{\@SeparaFinLineaDesc}%
       \hspace*{-\wd\@CajaCaracterCR}%
       \usebox{\@CajaCaracterCR}}%
     \fi
     \vskip-2\baselineskip
     \advance\count0 -1
     \ifnum\count0 > 0
    \repeat
    \kern\count2\baselineskip\mbox{}%
    \strut}%
  \fi
 \fi}

%% Comandos auxiliares para colocar en \parbox cada celda.
\newcommand{\@NumItemAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamNumItem \global\@TamNumItem=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamNumItem}{#1}}

\newcommand{\@CantidadAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamCantidad \global\@TamCantidad=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamCantidad}{#1}}

\newcommand{\@PrecioUAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamPrecioU \global\@TamPrecioU=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamPrecioU}{#1}}

\newcommand{\@PrecioSAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamPrecioS \global\@TamPrecioS=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamPrecioS}{#1}}

\newcommand{\@DescuentoAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamDescuento \global\@TamDescuento=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamDescuento}{#1}}

\newcommand{\@IVAAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamIVA \global\@TamIVA=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamIVA}{#1}}

\newcommand{\@PrecioTAuxCmd}[1]{%
 \savebox{\@CajaPrueba}{#1}%
 \ifdim\wd\@CajaPrueba > \@TamPrecioT \global\@TamPrecioT=\wd\@CajaPrueba\fi
 \parbox[t]{\@TamPrecioT}{#1}}

%% Presentación de totales en modo de columnas.
\newcommand{\@EscribeTotalCol}[1]{%
 \expandafter\FPifeq\csname Desc#1\endcsname{0}%
  \ifsinivaexpresado\else\@EscribeTotalColBI{#1}\fi
 \else
  \@EscribeTotalColSubt{#1}%
  \@EscribeTotalColDesc{#1}%
  \ifsinivaexpresado\else\@EscribeTotalColBI{#1}\fi
 \fi}

%% Forma agupada para la presentación de totales en modo de columnas.
\newcommand{\@EscribeTotalColAgrupado}{%
 \if@Exento\if@DescE\@EscribeTotalColSubt{E}\fi\fi
 \if@BIR\if@DescR\@EscribeTotalColSubt{R}\fi\fi
 \if@DescG\@EscribeTotalColSubt{G}\fi
 \if@BIA\if@DescA\@EscribeTotalColSubt{A}\fi\fi
 \if@Exento\if@DescE\@EscribeTotalColDesc{E}\fi\fi
 \if@BIR\if@DescR\@EscribeTotalColDesc{R}\fi\fi
 \if@DescG\@EscribeTotalColDesc{G}\fi
 \if@BIA\if@DescA\@EscribeTotalColDesc{A}\fi\fi
 \ifsinivaexpresado
 \else
  \if@Exento\@EscribeTotalColBI{E}\fi
  \if@BIR\@EscribeTotalColBI{R}\fi
  \@EscribeTotalColBI{G}%
  \if@BIA\@EscribeTotalColBI{A}\fi
  \if@BIR\@EscribeTotalColAlicuota{R}\fi
  \@EscribeTotalColAlicuota{G}%
  \if@BIA\@EscribeTotalColAlicuota{A}\fi
 \fi}

\newcommand{\@EscribeTotalColBI}[1]{%
 \@LetraTitTotales \csname @@BI#1\endcsname
  \ifx#1E%
  \else
   \ifG\ \hfill(\csname @Alicuota#1porc\endcsname\%)\else\mbox{}\fi
  \fi
 & \@LetraNumTotales\@SignoMonetarioAux{\csname BI#1\endcsname} \\}

\newcommand{\@EscribeTotalColAlicuota}[1]{%
 {\@LetraTitTotales \csname @@Alicuota#1\endcsname\ \hfill (\csname @Alicuota#1porc\endcsname\%)}
 & \@LetraNumTotales\@SignoMonetarioAux{\csname Alicuota#1\endcsname} \\}

\newcommand{\@EscribeTotalColSubt}[1]{%
 {\@LetraTitTotales \csname @@Subtotal#1\endcsname}
 & \@LetraNumTotales\@SignoMonetarioAux{\csname Subt#1\endcsname} \\}

\newcommand{\@EscribeTotalColDesc}[1]{%
 {\@LetraTitTotales \csname @@Descuento#1\endcsname
 \csname if@Desc#1num\endcsname \else \ \hfill (\csname @Descuento#1porc\endcsname\%)\fi}
 & \@LetraNumTotales\@SignoMonetarioAux{\csname Desc#1\endcsname} \\}

%% Presentación de los totales en modo filas.
\newcommand{\@EscribeTotalFilasBI}[1]{%
 \@EscribeTotalFilasBIizq{#1}: & \@EscribeTotalFilasBIder{#1}}

\newcommand{\@EscribeTotalFilasAlicuota}[1]{%
 \@EscribeTotalFilasAlicuotaizq{#1}: & \@EscribeTotalFilasAlicuotader{#1}}

%% (no implementado)
 % \newcommand{\@EscribeTotalFilasDesc}[1]{%
 %  \@EscribeTotalFilasDescizq{#1}: & \@EscribeTotalFilasDescder{#1}}

\newcommand{\@EscribeTotalFilasSoloBI}[1]{%
 {\@LetraTitTotales\@EscribeTotalFilasBIizq{#1}:} {\@LetraNumTotales\@EscribeTotalFilasBIder{#1}}}

%% (no implementado)
 % \newcommand{\@EscribeTotalFilasSoloDesc}[1]{%
 % {\@LetraTitTotales\@EscribeTotalFilasDescizq{#1}:} {\@LetraNumTotales\@EscribeTotalFilasDescder{#1}}}

\newcommand{\@EscribeTotalFilasSoloAlicuota}[1]{%
 {\@LetraTitTotales\@EscribeTotalFilasAlicuotaizq{#1}:} {\@LetraNumTotales\@EscribeTotalFilasAlicuotader{#1}}}

\newcommand{\@EscribeTotalFilasBIizq}[1]{%
 \@LetraTitTotales\csname @@BI#1\endcsname
 \ifx#1G%
  \ifG \ (\@AlicuotaGporc\%)\fi%  Si hay otra B.I. que no sea general, escribimos el porcentaje explícito en la general.
 \else
  \ifx#1E%
  \else
  \ (\csname @Alicuota#1porc\endcsname\%)%
  \fi
 \fi}

\newcommand{\@EscribeTotalFilasBIder}[1]{%
 \@LetraNumTotales\@SignoMonetarioAux{\csname BI#1\endcsname}}

\newcommand{\@EscribeTotalFilasAlicuotaizq}[1]{%
 \@LetraTitTotales\csname @@Alicuota#1\endcsname \ (\csname @Alicuota#1porc\endcsname\%)}

\newcommand{\@EscribeTotalFilasAlicuotader}[1]{%
 \@LetraNumTotales\@SignoMonetarioAux{\csname Alicuota#1\endcsname}}

%% (no implementado)
 % \newcommand{\@EscribeTotalFilasDescizq}[1]{%
 %  \@LetraTitTotales\csname @@Descuento#1\endcsname \ (\csname @Descuento#1porc\endcsname\%)}

 % \newcommand{\@EscribeTotalFilasDescder}[1]{%
 %  \@LetraNumTotales\@SignoMonetarioAux{\csname Desc#1\endcsname}}

\newcommand{\@EscribeTotalFilasAuxTotal}{\@LetraTitTotal\@@Total: & \@LetraNumTotal\@SignoMonetarioAux{\Total}}

\newcommand{\@EscribeTotalFilas}[2][]{%
 \begin{tabular}[b]{@{}l@{\extracolsep{1ex}}r@{}}% ¡Esta tabla tiene que abrir hacia abajo para que la separación entre las filas se pueda colocar con \@SeparaFilas!
  \csname @EscribeTotalFilasBI\endcsname{#2}%
  \ifx#2E%
   \ifx#1T%
    \\[\@SeparaFilas]%
    \@EscribeTotalFilasAuxTotal
   \fi
  \else
   \\[\@SeparaFilas]%
   \csname @EscribeTotalFilasAlicuota\endcsname{#2}%
  \fi
 \end{tabular}}

%% Comando auxiliar para escribir el signo monetario cuando aplica
\NewDocumentCommand{\@SignoMonetarioAux}{s s m G{\@Moneda}}{%
 \IfBooleanTF{#2}
  {\global\@EscribeMonedatrue}
  {\IfBooleanTF{#1}{\ifmonedaceldas\global\global\@EscribeMonedatrue\fi}{\ifsinmonedatotales\else\global\@EscribeMonedatrue\fi}}%
 \ifmonedadespues
 \else
  \if@EscribeMoneda #4\hspace*{\@EspacioSignoMonetario}\fi
 \fi
 \numprint{#3}%
 \ifmonedadespues
  \if@EscribeMoneda \hspace*{\@EspacioSignoMonetario}#4\fi
 \fi
 \global\@EscribeMonedafalse}

\newcommand{\@GeneraCajasTotalesFilas}{%
 \if@Exento
  \newbox{\@CajaBIE}\newbox{\@CajaBIET}%
  \savebox{\@CajaBIE}{\@EscribeTotalFilasSoloBI{E}}%
  \savebox{\@CajaBIET}{\@EscribeTotalFilas[T]{E}}%
 \fi
 \if@BIR
  \addtocounter{@IVANoGeneral}{1}%
  \newbox{\@CajaBIR}\newbox{\@CajaAliR}\newbox{\@CajaBIAliR}%
  \savebox{\@CajaBIR}{\@EscribeTotalFilasSoloBI{R}}%
  \savebox{\@CajaAliR}{\@EscribeTotalFilasSoloAlicuota{R}}%
  \savebox{\@CajaBIAliR}{\@EscribeTotalFilas{R}}%
 \fi
 \newbox{\@CajaBIG}\newbox{\@CajaAliG}\newbox{\@CajaBIAliG}%
 \savebox{\@CajaBIG}{\@EscribeTotalFilasSoloBI{G}}%
 \savebox{\@CajaAliG}{\@EscribeTotalFilasSoloAlicuota{G}}%
 \savebox{\@CajaBIAliG}{\@EscribeTotalFilas{G}}%
 \if@BIA
  \addtocounter{@IVANoGeneral}{1}%
  \newbox{\@CajaBIA}\newbox{\@CajaAliA}\newbox{\@CajaBIAliA}%
  \savebox{\@CajaBIA}{\@EscribeTotalFilasSoloBI{A}}%
  \savebox{\@CajaAliA}{\@EscribeTotalFilasSoloAlicuota{A}}%
  \savebox{\@CajaBIAliA}{\@EscribeTotalFilas{A}}%
 \fi}

\newcommand{\@EscribeTotalesFilasGET}{%
 \hspace*{\@SepTotales}\usebox{\@CajaBIG}%
 \hspace*{\@SepTotales}\usebox{\@CajaAliG}%
 \if@Exento\hspace*{\@SepTotales}\usebox{\@CajaBIE}\fi
 \hspace*{\@SepTotales}\usebox{\@CajaTotal}%
 \iffilascentradas\hspace*{\@SepTotales}\fi}

\newcommand{\@EscribeTotalesFilasGxET}{%
 \if@BIR\hspace*{\@SepTotales}\usebox{\@CajaBIAliR}\fi
 \hspace*{\@SepTotales}\usebox{\@CajaBIAliG}%
 \if@BIA\hspace*{\@SepTotales}\usebox{\@CajaBIAliA}\fi
 \hspace*{\@SepTotales}\if@Exento\usebox{\@CajaBIET}\else\usebox{\@CajaTotal}\fi
 \iffilascentradas\hspace*{\@SepTotales}\fi}

\newcommand{\@EscribeTotalesFilasRGA}{%
 \hspace*{\@SepTotales}\usebox{\@CajaBIAliR}%
 \hspace*{\@SepTotales}\usebox{\@CajaBIAliG}%
 \hspace*{\@SepTotales}\usebox{\@CajaBIAliA}%
 \hspace*{\@SepTotales}}

\newcommand{\@EscribeTotalesFilasRGAET}{%
 \@EscribeTotalesFilasRGA
 \if@Exento\usebox{\@CajaBIET}\else\usebox{\@CajaTotal}\fi
 \iffilascentradas\hspace*{\@SepTotales}\fi}

%% Escribe la letra que designa al tipo de impuesto que aplica al ítem.
\NewDocumentCommand{\@EscribeTipoDeImpuesto}{m}{%
 % Hay que abrir un grupo de ejecución porque el cambio en la tipografía altera la celda.
 {\ifG
   \@LetraTipoIVA
   \ifx#1G\@SimboloAlicuotaG\fi
   \ifx#1R\@SimboloAlicuotaR\fi
   \ifx#1A\@SimboloAlicuotaA\fi
   \ifx#1E\@SimboloAlicuotaE\fi
  \fi}}

%% Comando para poner en cero los contadores de los totales porque el ambiente de la factura se evalúa tres veces y los totales se sumarían todos tres veces.
\newcommand{\@ZERO}{%
 \FPset\BIG{0}\global\let\BIG\BIG
 \FPset\BIR{0}\global\let\BIR\BIR
 \FPset\BIA{0}\global\let\BIA\BIA
 \FPset\BIE{0}\global\let\BIE\BIE
 \FPset\SubtE{0}\global\let\SubtE\SubtE
 \FPset\SubtG{0}\global\let\SubtG\SubtG
 \FPset\SubtR{0}\global\let\SubtR\SubtR
 \FPset\SubtA{0}\global\let\SubtA\SubtA
 \FPset\SubtX{0}\global\let\SubtX\SubtX
 \FPset\DescE{0}\global\let\DescE\DescE
 \FPset\DescG{0}\global\let\DescG\DescG
 \FPset\DescR{0}\global\let\DescR\DescR
 \FPset\DescA{0}\global\let\DescA\DescA
 \FPset\DescX{0}\global\let\DescX\DescX
 \FPset\AlicuotaG{0}\global\let\AlicuotaG\AlicuotaG
 \FPset\AlicuotaR{0}\global\let\AlicuotaR\AlicuotaR
 \FPset\AlicuotaA{0}\global\let\AlicuotaA\AlicuotaA}

%% Comandos para calcular todos los totales parciales y los totales generales.
\newcommand{\@CalculaTotalesI}{%
 \FPifeq\SubtG{0}\else\@CalculaTotalesII{G}\fi
 \FPifeq\SubtR{0}\else\@CalculaTotalesII{R}\fi
 \FPifeq\SubtA{0}\else\@CalculaTotalesII{A}\fi
 \FPifeq\SubtE{0}\else\@CalculaTotalesII{E}\fi
 \FPupn\Total{\BIE{} \BIR{} + \BIG{} + \BIA{} + \AlicuotaR{} + \AlicuotaG{} + \AlicuotaA{} + \@DigitosMoneda{} round}%
 \FPupn\TotalDivisa{\Total{} \@TasaCambio{} div \@DigitosMoneda{} round}%
 \global\let\Total\Total
 \global\let\TotalDivisa\TotalDivisa}

\newcommand{\@CalculaTotalesII}[1]{%
 % Sumamos al descuento.
 \expandafter\FPupn\csname Desc#1\endcsname{\csname @Descuento#1factor\endcsname{} \csname Subt#1\endcsname{} * \csname @Descuento#1num\endcsname{} \@TasaCambio{} * + \@DigitosMoneda{} round}%
 \global\expandafter\let\csname Desc#1\expandafter\endcsname\csname Desc#1\endcsname
 % Sumamos a la base imponible.
 \expandafter\FPupn\csname BI#1\endcsname{\csname Desc#1\endcsname{} \csname Subt#1\endcsname{} - \@DigitosMoneda{} round}%
 \global\expandafter\let\csname BI#1\expandafter\endcsname\csname BI#1\endcsname
 \ifx#1E%
 \else{%
  % Sumamos a la alícuota.
  \expandafter\FPupn\csname Alicuota#1\endcsname{\csname BI#1\endcsname{} \csname @Impuesto#1\endcsname{} * \@DigitosMoneda{} round}%
  \global\expandafter\let\csname Alicuota#1\expandafter\endcsname\csname Alicuota#1\endcsname}%
 \fi}

%% Comandos auxiliares para poder evaluar la definición de las columnas en la tabla con un comando que se expande completamente.
\def\@FacturaAuxColumnasEval{
 % Primera línea, la más externa.
 \ifbool{SinLineasVertExt}{}{|}
 % Columna para el número del ítem, si aplica.
 \ifbool{NumItem}{c}{r@{\extracolsep{0pt}}}
 % Segunda línea, que sale solamente cuando se usa la opción 'numitem'
 \ifbool{NumItem}{\ifbool{SinLineasVertInt}{}{|}}{}
 % Columna 'X' con DCU, columna fantasma con 'sincantidad' y columna 'c' con CDU.
 \ifbool{PrimeroDescripcion}{X}{
  \ifbool{SinCantidad}{l@{\extracolsep{0pt}}}{c}}
 % Tercera línea.
 \ifbool{SinCantidad}{}{\ifbool{SinLineasVertInt}{}{|}}
 % Columna 'c' con DCU, columna 'r' con DUC, columna 'X' sin espacio para 'sincantidad' y columna 'X' con CDU.
 \ifbool{DCU}{c}{
  \ifbool{DUC}{r}{
   \ifbool{SinCantidad}{X@{\extracolsep{0pt}}}{X}}}
 % Cuarta línea, que sale solamente cuando no se usa 'sincantidad'.
 \ifbool{SinCantidad}{}{\ifbool{SinLineasVertInt}{}{|}}
 % Columna 'c' para DUC y columna 'r' para cualquier otro caso (DCU, CDU y 'sincantidad').
 \ifbool{DUC}{c}{r}
 % Quinta línea.
 \ifbool{SinLineasVertInt}{}{|}
 % Columna 'r' para subtotal antes del descuento, o columna fantasma si no se especifica 'subtotal').
 \ifbool{Subtotal}{r}{l@{\extracolsep{0pt}}}
 % Sexta línea, que sale solamente cuando hay columna de subtotales.
 \ifbool{Subtotal}{\ifbool{SinLineasVertInt}{}{|}}{}
 % Columna 'c' para 'descuentos' y columna 'r' sin espacio si no hay descuentos individuales.
 \ifbool{Descuentos}{c}{r@{\extracolsep{0pt}}}
 % Séptima línea, que sale solamente cuando hay descuentos.
 \ifbool{Descuentos}{\ifbool{SinLineasVertInt}{}{|}}{}
 % Columna 'c' para 'iva' y columna 'r' sin espacio si no hay columna de IVA.
 \ifbool{IVA}{c}{r@{\extracolsep{0pt}}}
 % Octava línea, que sale solamente cuando hay columna de IVA.
 \ifbool{IVA}{\ifbool{SinLineasVertInt}{}{|}}{}
 % Columna 'r' siempre.
 r
 % Novena y última línea.
 \ifbool{SinLineasVertExt}{}{|}}

%% Comando para hacer los cálculos sobre cada ítem y establecer las macros con el contenido de cada ítem introducido.
%% Aquí tenemos que hacer coincidir los parámetros de \@CalculaItem con los de \@ITEM para poder hacer
%% \let\@CalculaItem\@ITEM cuando no hay factura sino solamente reporte.
\NewDocumentCommand{\@CalculaItem}{m m m o m m +o}{%
 \gdef\@PrecioUtemp##1{\FPupn\PrecioUtemp{##1 \@TasaCambio{} * clip}}%
 \addtocounter{NumItem}{1}%
 % Calculamos.
 \@PrecioUtemp{#5}%
 \FPupn\PrecioU{\PrecioUtemp{} \@DigitosMoneda{} round}%
 \FPifeq\PrecioU{\PrecioUtemp}\else\CLASSWARNING{Se esta' introduciendo un precio con ma's de dos decimales: (#3 - \PrecioUtemp. Redondeado a \PrecioU)}{}\fi% Advertimos cuando el precio unitario tiene más de dos decimales.
 \ifbool{Descuentos}
  {\ifx\\#6\\\FPset\Dcto{0}\else\FPupn\Dcto{#6 \@DigitosPorc{} round clip}\fi}% Fijamos en 0 el descuento si no se especifica en \Item***.
  {\FPset\Dcto{#6}%
   \FPifeq\Dcto{0}\else\CLASSWARNING{Se pidio' un descuento individual sin dar la opcio'n de la clase 'descuentos'. No se tomara' en cuenta}\fi
   \FPset\Dcto{0}}% También fijamos en 0 el descuento por si se especifica en \Item*** pero no se pide la opción 'descuentos'.
 \FPupn\PrecioS{#2 \PrecioU{} * \@DigitosMoneda{} round}%
 \FPupn\PrecioT{100 \Dcto{} 100 - / \PrecioS{} * \@DigitosMoneda{} round}%
 \global\let\PrecioU\PrecioU
 \global\let\PrecioS\PrecioS
 \global\let\Dcto\Dcto
 \global\let\PrecioT\PrecioT
 % Suma el elemento actual al subtotal acumulado.
 \expandafter\FPupn\csname Subt#1\endcsname{\PrecioT{} \csname Subt#1\endcsname{} + \@DigitosMoneda{} round}%
 \global\expandafter\let\csname Subt#1\expandafter\endcsname\csname Subt#1\endcsname
 % Guardamos en macros cada elemento agregado a la factura; por ejemplo: \@Item@i@Cantidad contiene la cantidad que se introdujo para el primer ítem; así mismo con ii@, @iii@, y así mismo también con @Descripcion, @PrecioU, @Descuento y @PrecioT.
 \expandafter\gdef\csname @Item@\romannumeral\value{NumItem}@Cantidad\endcsname{\numprint{#2}}%
 \expandafter\gdef\csname @Item@\romannumeral\value{NumItem}@Descripcion\endcsname{#3}%
 \expandafter\global\expandafter\edef\csname @Item@\romannumeral\value{NumItem}@PrecioU\endcsname{\noexpand\numprint{\PrecioU}}%
 \expandafter\global\expandafter\edef\csname @Item@\romannumeral\value{NumItem}@PrecioS\endcsname{\noexpand\numprint{\PrecioS}}%
 \expandafter\global\expandafter\edef\csname @Item@\romannumeral\value{NumItem}@Descuento\endcsname{\noexpand\numprint{\Dcto}}%
 \expandafter\gdef\csname @Item@\romannumeral\value{NumItem}@DescripcionLarga\endcsname{#7}%
 \expandafter\global\expandafter\expandafter\edef\csname @Item@\romannumeral\value{NumItem}@IVA\endcsname{%
  \noexpand\numprint\expandafter{\csname @Alicuota#1porc\endcsname}}%
 \expandafter\global\expandafter\edef\csname @Item@\romannumeral\value{NumItem}@PrecioT\endcsname{\noexpand\numprint{\PrecioT}}}

%% Macro interna para saber si una etiqueta existe o no.
\gdef\@pruebaref#1{%
 \expandafter\ifx\csname @Etiqueta@#1\endcsname\relax
  \CLASSWARNING{La etiqueta `#1' no esta' definida}\ignorespaces
  \@PruebaReffalse
 \else
  \@PruebaReftrue
 \fi}

%% Comandos para las referencias: i) referencia al número de ítem, ii) a la cantidad, iii) a la descripción, iv) al precio unitario, v) al descuento, vi) al precio total.
\gdef\itemref#1{%
 \ifbool{NumItem}{}{\CLASSWARNING{Es recomendable usar la opcio'n 'numitem' para enumerar los i'tems}}%
 \@pruebaref{#1}\if@PruebaRef \csname @Etiqueta@#1\endcsname \fi}
\gdef\cantref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @Cantidad\endcsname \fi}
\gdef\descref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @Descripcion\endcsname \fi}
\gdef\puref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @PrecioU\endcsname \fi}
\gdef\subtref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @PrecioS\endcsname \fi}
\gdef\dctoref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @Descuento\endcsname \fi}
\gdef\ldescref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @DescripcionLarga\endcsname \fi}
\gdef\ivaref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @IVA\endcsname \fi}
\gdef\ptref#1{\@pruebaref{#1}\if@PruebaRef \csname @Item@\expandafter\romannumeral\csname @Etiqueta@#1\endcsname @PrecioT\endcsname \fi}

%% Definimos un comando para la etiqueta, que se define dentro del entorno de la factura para que tenga alcance local; cuando se acaba dicho entorno, el comando \label vuelve a ser lo que está definido en latex.ltx.
\newcommand{\label@factura}[1]{%
 \expandafter\ifx\csname @Etiqueta@#1\endcsname\relax
  \expandafter\global\expandafter\edef\csname @Etiqueta@#1\endcsname{\arabic{NumItem}}\ignorespaces
  \CLASSINFO{Etiqueta `#1' definida para el i'tem \arabic{NumItem}}%
 \else
  \edef\@label@test@uno{\csname @Etiqueta@#1\endcsname}%
  \edef\@label@test@dos{\theNumItem}%
  \ifx\@label@test@uno\@label@test@dos
  \else
   \CLASSWARNING{La etiqueta `#1' se definio' ma's de una vez}\ignorespaces
  \fi
 \fi}

%% Segundo \AtEndPreamble.
%% Todo esto tiene que estar dentro de \AtEndPreamble que es cuando \if@factura, \if@reverso e \if@reporte fueron ya aplicadas, y para que se evalúen adecuadamente en su momento las definiciones hechas con \edef.
\AtEndPreamble{
 % Comando auxiliar para abrir la tabla del cuadro de la factura y expandir completamente las columnas.
 \edef\@FacturaAuxInicioCmd{\noexpand\begin{tabularx}{\textwidth}{\@FacturaAuxColumnasEval}}

 % Comando auxiliar para abrir el '\multicolumn' de la nota interna y evalúe la presencia o no de las barras verticales.
 \edef\@ColumnasMultiColumnNotaIntAuxCmd{%
  \noexpand\multicolumn{8}{\ifbool{SinLineasVertExt}{}{|}l\ifbool{SinLineasVertExt}{}{|}}{%
   \noexpand\parbox[t]{\linewidth-2\tabcolsep-2\arrayrulewidth}{\noexpand\@LetraNotaInterna\noexpand\@NotaInterna\noexpand\strut}}%
   \noexpand\\}

 % Comando auxiliar para abrir el '\multicolumn' para los totales en el modo de columnas y expandir completamente las columnas cuando hay o no barras verticales.
 \edef\@ColumnasMultiColumnTotalesAuxCmd{%
  \noexpand\multicolumn{8}{\ifbool{SinLineasVertExt}{}{|} r}\begingroup
    \noexpand\if@ExpandeCuadro
     \noexpand\iflinea\noexpand\zsaveposx{LineaNodoBCoordX}\noexpand\zsaveposy{LineaNodoBCoordY}\noexpand\fi\noexpand\fi% Fijamos la posición (x,y) final para la línea ya que estaremos justo en el punto donde escribimos el total, y hasta allí llega la línea en el modo de columnas.
     \noexpand\begin{tabular}[b]{@{\noexpand\extracolsep{2\noexpand\tabcolsep}}lr \ifbool{SinLineasVertExt}{}{|}}}

 % Comando auxiliar para la definición del ambiente de la factura; al final de este comando está el texto que va en el enddef del ambiente de la factura.
 \newcommand{\@FacturaAuxCmd}[1]{%
  \ifexpandecuadro
   \setlength{\@EspacioVacioInicial}{\zposy{EspacioVacioInicial}sp}%
   \setlength{\@EspacioVacioFinal}{\zposy{EspacioVacioFinal}sp}%
   \global\@EspacioVacioInicial=\@EspacioVacioInicial% Hay que globalizarlas
   \global\@EspacioVacioFinal=\@EspacioVacioFinal
   \savebox{\@CajaEspacioVacio}{\parbox[b][\@EspacioVacioInicial-\@EspacioVacioFinal]{\@TamDescripcion}{%
    \iflinea
     \if@LineaHastaFinal
      \zsaveposy{LineaNodoBCoordY}%
     \else
      \if@LineaDescripcion
       \zsaveposx{LineaNodoACoordX}\mbox{}\hfill \zsaveposx{LineaNodoBCoordX}\zsaveposy{LineaNodoBCoordY}%
      \fi
     \fi
    \fi}}%
   \ifdim \ht\@CajaEspacioVacio=0pt \global\lineafalse \else \@ExpandeCuadrotrue \fi
  \fi

  %
  % Comandos \David@SavePos, \David@XStart, \David@XEnd, \David@XPad, \David@XLeft y \David@XRight para poder manejar el salto de línea en las columnas adyacentes a la columna 'X' del tabularx (la descripción), cuando esta ocupa más que una línea.
  % Gracias a David Carlisle (Thanks to David Carlisle).
  % http://tex.stackexchange.com/questions/111203/tabularx-bottom-alignment-on-r-or-l-columns-when-x-column-wraps
  \def\David@SavePos##1{\leavevmode\pdfsavepos\write\@auxout{\gdef\noexpand##1{\the\pdflastypos sp}}}%
  \def\David@XStart{\expandafter\David@SavePos\csname save@start@\romannumeral\value{NumItem}\endcsname}%
  \def\David@XEnd{\expandafter\David@SavePos\csname save@end@\romannumeral\value{NumItem}\endcsname}%
  \def\David@XPad##1##2##3{%
   \vtop{%
    \baselineskip\normalbaselineskip
    ##2%
    \expandafter
    \ifx\csname save@start@##1\endcsname
     \relax
    \else
     \dimen@\csname save@start@##1\endcsname\relax
     \loop
      \ifdim\dimen@>\csname save@end@##1\endcsname
      \advance\dimen@-\baselineskip
      \settowidth{\@TempDimen}{##3}%
       \ifdim\@TempDimen=0pt\settowidth{\@TempDimen}{##2}\fi
      \hbox{\parbox{\@TempDimen}{\@CaracterCeldasVacias}}%
     \repeat
    \fi
    ##3}}%
  \def\David@XLeft##1{\David@XPad{\romannumeral\value{NumItem}}{\hbox{##1}}{}}%
  \def\David@XRight##1{\David@XPad{\romannumeral\value{NumItem}}{}{\hbox{##1}}}%
  %
  % Caja auxiliar para el caracter de retorno de carro y poder saber si tamaño en el campo de la descripción.
  \savebox{\@CajaCaracterCR}{\@LetraItems\@CaracterCR}
  %
  % Comando para fijar la separación extra final de cada item, lo cual viene dado por la cantidad de líneas de la descripción,
  % que está alojado en \count1, definido en \@DescripcionAuxCmd.
  \def\@CalculaSeparaItemsExtraFinal{%
   \setlength{\@SeparaItemsExtraFinal}{\numexpr\the\count1\normalbaselineskip-\normalbaselineskip+\@SeparaItemsExtra}%
   \global\@SeparaItemsExtraFinal=\@SeparaItemsExtraFinal}
  %
  % Comando interno general para agregar cualquier ítem.
  \NewDocumentCommand{\@ITEM}{m m m o m m +o}{%
   % 1. [R|G|A|E|X]; 2. cantidad; 3. descripción; 4. descripción para el csv (entre corchetes); 5. p/u; 6. dcto; 7. la descripción para el reporte.
   \@CalculaItem{##1}{##2}{##3}{##5}{##6}[##7]%
   % Si no es el primer ítem, entonces hace falta \\ para terminar el ítem anterior.
   \ifnum\value{NumItem}=1% Aquí, \@CalculaItem aumenta en 1 el contador NumItem, que si vale 1 significa que aún no hemos procesado la línea 1, es decir, no hay que hacer el salto de línea. La última línea se termina en otro lado.
   \else
    \@CalculaSeparaItemsExtraFinal
    \\[\@SeparaItemsExtraFinal]
    \ifconlineasha\hline\fi% Líneas para separar cada ítem, si hiciera falta.
   \fi
   % Primer -opcional- campo: El número del ítem.
   \ifbool{NumItem}{\David@XLeft{\@NumItemAuxCmd{\mbox{}\hfill \@LetraNumeros \arabic{NumItem}\hfill\mbox{}}}}{}%
   &
   % Segundo campo: Acá puede ir la cantidad (cdu) o la descripción (dcu y duc).
   \ifbool{SinCantidad}{}{%
    \ifbool{PrimeroDescripcion}
    {\@DescripcionAuxCmd{##3}{##1}}% dcu y duc.
    {\David@XLeft{\@CantidadAuxCmd{\mbox{}\hfill \@LetraNumeros \numprint{##2}\hfill\mbox{}}}}}% cdu.
   &
   % Tercer campo: Acá puede ir la descripción (cdu), la cantidad (dcu), o el precio unitario (duc).
   \ifbool{PrimeroDescripcion}{%
    \ifdcu
     \David@XRight{\@CantidadAuxCmd{\mbox{}\hfill \@LetraNumeros \numprint{##2}\hfill\mbox{}}}% dcu.
    \else
     \David@XRight{\@PrecioUAuxCmd{%
      \ifx##1X \hfill \@CaracterItemXVacio \hfill\mbox{}%
      \else
       \ifivadescripcion\else\@EscribeTipoDeImpuesto{##1}\fi \hfill \@LetraNumeros \@SignoMonetarioAux*{\PrecioU}%
      \fi}}% duc.
    \fi}
   {\@DescripcionAuxCmd{##3}{##1}}% cdu.
   &
   % Cuarto campo: Acá puede ir el precio unitario (cdu y dcu) o la cantidad (duc).
   \ifbool{SinCantidad}{}{%
    \ifduc
     \David@XRight{\@CantidadAuxCmd{\mbox{}\hfill \@LetraNumeros \numprint{##2}\hfill\mbox{}}}% duc.
    \else
     \David@XRight{\@PrecioUAuxCmd{%
      \ifx##1X \hfill \@CaracterItemXVacio \hfill\mbox{}%
      \else
       \ifivadescripcion\else\@EscribeTipoDeImpuesto{##1}\fi \hfill \@LetraNumeros \@SignoMonetarioAux*{\PrecioU}%
      \fi}}% dcu y cdu.
    \fi}%
   & % Quinto -opcional- campo: Subtotal (para luego descuentos).
   \ifbool{Subtotal}{%
    \David@XRight{\@PrecioSAuxCmd{%
     \ifx##1X \hfill \@CaracterItemXVacio \hfill\mbox{}%
     \else
      \ifivadescripcion\else\@EscribeTipoDeImpuesto{##1}\fi \hfill \@LetraNumeros \@SignoMonetarioAux*{\PrecioS}%
     \fi}}}{}
   &
   % Sexto -opcional- campo: Descuento.
   \ifbool{Descuentos}{%
    \David@XRight{\@DescuentoAuxCmd{%
     \ifx##1X \hfill \@CaracterItemXVacio \hfill\mbox{}%
     \else
      \mbox{}\hfill \@LetraNumeros \numprint{\Dcto}\%\hfill\mbox{}%
     \fi}}}{}% Tenemos que usar un condicional booleano porque si no da problemas con el condicional \FPifeq.
   &
   % Séptimo -opcional- campo: IVA.
   \ifbool{IVA}{%
    \David@XRight{\@IVAAuxCmd{%
     \ifx##1X \hfill \@CaracterItemXVacio \hfill\mbox{}%
     \else
      \mbox{}\hfill \@LetraNumeros \numprint{\csname @Alicuota##1porc\endcsname}\%\hfill\mbox{}%
     \fi}}}{}% Tenemos que usar un condicional booleano porque si no da problemas con el condicional \FPifeq.
   &
   % Octavo campo: El total.
   \David@XRight{\@PrecioTAuxCmd{%
    \ifx##1X \hfill \@CaracterItemXVacio \hfill\mbox{}%
    \else
     \ifivadescripcion\else\@EscribeTipoDeImpuesto{##1}\fi \hfill \@LetraNumeros \@SignoMonetarioAux*{\PrecioT}%
    \fi}}%
   % Escribimos al csv.
   \ifcsv
    \IfValueTF{##4}{\@EscribeItemsEnCSV{##1}{##2}{##4}}{\@EscribeItemsEnCSV{##1}{##2}{##3}}%
   \fi}%
  %
  % Comando para escribir en el .csv.
  \newcommand{\@EscribeItemsEnCSV}[3]{%
   \ifbool{SinCantidad}
   {\ifdescuentos
     \write\csv{"\unexpanded{##3}","\Dcto","\PrecioT","##1"}%
    \else
     \write\csv{"\unexpanded{##3}","\PrecioT","##1"}%
    \fi}
   {\if@cdu
     \ifdescuentos
      \write\csv{"##2","\unexpanded{##3}","\PrecioU","\Dcto","\PrecioT","##1"}%
     \else
      \write\csv{"##2","\unexpanded{##3}","\PrecioU","\PrecioT","##1"}%
     \fi
    \fi
    \ifdcu
     \ifdescuentos
      \write\csv{"\unexpanded{##3}","##2","\PrecioU","\Dcto","\PrecioT","##1"}%
     \else
      \write\csv{"\unexpanded{##3}","##2","\PrecioU","\PrecioT","##1"}%
     \fi
    \fi
    \ifduc
     \ifdescuentos
      \write\csv{"\unexpanded{##3}","\PrecioU","##2","\Dcto","\PrecioT","##1"}%
     \else
      \write\csv{"\unexpanded{##3}","\PrecioU","##2","\PrecioT","##1"}%
     \fi
    \fi}}%
  %
  % Usamos la definición de \label@factura dentro del entorno de la factura para que sea local aquí nada más.
  \let\label\label@factura
  \@LetraItems% Este es el tipo de letra que tendrán los ítems, y en este tipo de letra se define el \baselineskip de toda la factura.
  \setlength{\baselineskip@@}{\baselineskip}%
  \global\baselineskip@@=\baselineskip@@
  \@FacturaAuxInicioCmd
  \ifbool{SinLineasHoriExt}{}{\hline}%
  \@ZERO
  \setlength{\tabcolsep@@}{\tabcolsep}%
  \global\tabcolsep@@=\tabcolsep@@
  % Estamos en el número del ítem, si aplicara.
  \if@LineaDesdeInicio \zsaveposx{LineaNodoACoordX}\fi
  \ifbool{NumItem}{\@NumItemAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@NumItem \hfill\mbox{}}}{}%
  &
  % Avanzamos a la cantidad, o la descripción.
  \ifbool{SinCantidad}{}{\ifbool{PrimeroDescripcion}{\@DescripcionAuxCmd{\@LetraTitColumnas \@@Descripcion}{}}{\@CantidadAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@Cantidad \hfill\mbox{}}}}%
  &% Avanzamos hasta la descripción, la cantidad o el precio unitario.
  \ifbool{SinCantidad}{\@DescripcionAuxCmd{\@LetraTitColumnas \@@Descripcion}{}}
   {\if@cdu \@DescripcionAuxCmd{\@LetraTitColumnas \@@Descripcion}{}\fi
    \ifdcu \@CantidadAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@Cantidad \hfill\mbox{}}\fi
    \ifduc \@PrecioUAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@PrecioU \ifmonedaceldas\else\space (\Moneda)\fi \hfill\mbox{}}\fi}%
  &% Avanzamos hasta el precio unitario, o la cantidad, o columna fantasma cuando es 'sincantidad'.
  \ifbool{SinCantidad}{}
   {%
    \mbox{}\hfill
    \ifduc
     \@CantidadAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@Cantidad \hfill\mbox{}}%
    \else
     \@PrecioUAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@PrecioU \ifmonedaceldas\else\space (\Moneda)\fi \hfill\mbox{}}%
    \fi}%
  &% Avanzamos hasta el subtotal, que puede o no existir,
  \ifbool{Subtotal}{\@PrecioSAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@PrecioS \ifmonedaceldas\else\space (\Moneda)\fi \hfill\mbox{}}}{}%
  &% Avanzamos hasta el descuento, que puede o no existir.
  \ifdescuentos \@DescuentoAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@Descuento \hfill\mbox{}}\fi
  &% Avanzamos hasta el IVA, que puede o no existir.
  \ifbool{IVA}{\@IVAAuxCmd{\mbox{}\hfill \@LetraTitColumnas \@@IVA \hfill\mbox{}}}{}
  &% Avanzamos hasta el precio total.
  \@PrecioTAuxCmd{\mbox{}\hfill \@LetraTitColumnas \ifbool{SinCantidad}{\@@Precio}{\@@PrecioT}\ifmonedaceldas\else\space (\Moneda)\fi \hfill\mbox{}}%
  \if@LineaHastaFinal \zsaveposx{LineaNodoBCoordX}\fi
  \\
  \ifbool{SinLineaHoriTit}{}{\hline}%
  %
  #1% Aquí entran todos los items que el usuario declara dentro del ambiente.
  \@CalculaTotalesI
  \@CalculaSeparaItemsExtraFinal
  \\[\@SeparaItemsExtraFinal]% El último fin de línea se hace aquí.
  \ifconlineasha
   \ifdefvoid{\@NotaInterna}{%
    \ifbool{SinLineasHoriExt}{\if@ExpandeCuadro\hline\fi}{\hline}}{\hline}%
  \fi% Se verifica si hace falta una línea horizontal o no.
  \iffilas
   % Esto en lugar de \ifexpandecuadro para que no se haga una linea vacía en la tabla cuando la caja está vacía.
   \if@ExpandeCuadro
    \ifbool{PrimeroDescripcion}{&\usebox{\@CajaEspacioVacio}&&&&&&\\}{&&\usebox{\@CajaEspacioVacio}&&&&&\\}%
    \ifdefvoid{\@NotaInterna}{}
    {\ifbool{SinLineaHoriNI}{}{\hline}%
     \@ColumnasMultiColumnNotaIntAuxCmd}%
    \ifbool{SinLineasHoriExt}{}{\hline}% Siempre que hay relleno se pone la línea acá.
   \else
    \ifdefvoid{\@NotaInterna}{%
     \ifbool{SinLineasHoriExt}{}{%
      \ifconlineasha\else\hline\fi}}% Verificamos si hay que poner la línea horizontal. Si está 'conlineasha' entonces ya salió la línea.
     {\ifbool{SinLineaHoriNI}{}{\ifconlineasha\else\hline\fi}%
      \@ColumnasMultiColumnNotaIntAuxCmd
      \ifbool{SinLineasHoriExt}{}{\hline}}%
   \fi
  \else
   \ifsintotales
   \else
    \ifbool{SinLineaHoriTot}{}{\ifconlineasha\else\hline\fi}% Línea que cierra los ítems en la tabla.
   \fi
   % Agregamos el espacio espúreo.
   \if@ExpandeCuadro
    % Rellenamos la tabla con espacio espúreo, y le agregamos las líneas externas, si aplica.
    \ifbool{SinLineasVertExt}{\multicolumn{8}{c}{\usebox{\@CajaEspacioVacio}}}{\multicolumn{8}{|c|}{\usebox{\@CajaEspacioVacio}}}\\
   \fi
   % Si pedimos sin totalizaciones, entonces cerramos la tabla ya, si no, calculamos los totales y los escribimos.
   \ifsintotales
    \ifdefvoid{\@NotaInterna}{}{\ifbool{SinLineaHoriNI}{}{\hline}\@ColumnasMultiColumnNotaIntAuxCmd}%
    \ifbool{SinLineasHoriExt}{}{\hline}%
   \else
    % Modo de columnas: Abrimos la tabla para escribir los totales y le agregamos las líneas verticales externas, si aplica.
    \@ColumnasMultiColumnTotalesAuxCmd
    \ifagrupatotales
     \@EscribeTotalColAgrupado
    \else
     \if@Exento \@EscribeTotalCol{E}\fi
     \if@BIR\@EscribeTotalCol{R}\ifsinivaexpresado\else\@EscribeTotalColAlicuota{R}\fi\fi
     \@EscribeTotalCol{G}\ifsinivaexpresado\else\@EscribeTotalColAlicuota{G}\fi
     \if@BIA\@EscribeTotalCol{A}\ifsinivaexpresado\else\@EscribeTotalColAlicuota{A}\fi\fi
    \fi
    \ifsinivaexpresado\else\cline{2-2}\fi
    \hfill \@LetraTitTotal\@@Total & \@LetraNumTotal\@SignoMonetarioAux{\Total}\\
    \end{tabular}\endgroup
    \\
    \ifdefvoid{\@NotaInterna}{}{\ifbool{SinLineaHoriNI}{}{\hline}\@ColumnasMultiColumnNotaIntAuxCmd}%
    \ifbool{SinLineasHoriExt}{}{\hline}%
   \fi
  \fi
  \end{tabularx}%
  %
  % Generamos la macro \Total vacía para que no dé error en algún posible uso dentro del documento.
  \ifsintotales\gdef\Total{}\fi
  % Si pedimos no totalizar (sintotales), la opción filas queda desactivada.
  \iffilas
   \@LetraNumTotales
   \vspace*{\@SeparaVertical}\par
   \ifsinexpandir\vfill\fi
   \@GeneraCajasTotalesFilas
   \newbox{\@CajaTotal}%
   \savebox{\@CajaTotal}{{\@LetraTitTotal\@@Total:} \@LetraNumTotal\@SignoMonetarioAux{\Total}}%
   %
   \ifnum \value{@IVANoGeneral}=0%
    \newbox{\@CajaGET}%
    \savebox{\@CajaGET}{\@EscribeTotalesFilasGET}%
    \ifdim \the\wd\@CajaGET < \textwidth
     \parbox{\textwidth}{\@EscribeTotalesFilasGET}%
    \else
     \hspace*{\@SepTotales}%
     \usebox{\@CajaBIAliG}\hspace*{\@SepTotales}%
     \if@Exento\usebox{\@CajaBIET}\else\usebox{\@CajaTotal}\fi
     \iffilascentradas\hspace*{\@SepTotales}\fi
    \fi
   \fi
   \ifnum \value{@IVANoGeneral}=1%
    \newbox{\@CajaGxET}%
    \savebox{\@CajaGxET}{\@EscribeTotalesFilasGxET}%
    \ifdim \the\wd\@CajaGxET < \textwidth
     \@EscribeTotalesFilasGxET
    \else
     \hspace*{\@SepTotales}%
     \if@BIR\usebox{\@CajaBIAliR}\hspace*{\@SepTotales}\fi
     \usebox{\@CajaBIAliG}\hspace*{\@SepTotales}%
     \if@BIA\usebox{\@CajaBIAliA}\hspace*{\@SepTotales}\fi
     \\[\@SeparaFilas]\mbox{}%
     \iffilascentradas\hspace*{\@SepTotales}\else\hfill\fi
     \if@Exento\usebox{\@CajaBIE}\hspace*{\@SeparaMinTotales}\fi\usebox{\@CajaTotal}%
     \iffilascentradas\hspace*{\@SepTotales}\fi
    \fi
   \fi
   \ifnum \value{@IVANoGeneral}=2%
   \newbox{\@CajaRGAET}%
   \savebox{\@CajaRGAET}{\@EscribeTotalesFilasRGAET}%
    \ifdim \the\wd\@CajaRGAET < \textwidth
     \@EscribeTotalesFilasRGAET
    \else
     \newbox{\@CajaRGA}%
     \savebox{\@CajaRGA}{\@EscribeTotalesFilasRGA}%
     \ifdim \the\wd\@CajaRGA < \textwidth
      \@EscribeTotalesFilasRGA
      \\[\@SeparaFilas]\mbox{}%
      \iffilascentradas\hspace*{\@SepTotales}\else\hfill\fi
      \if@Exento\usebox{\@CajaBIE}\hspace*{\@SeparaMinTotales}\fi\usebox{\@CajaTotal}%
      \iffilascentradas\hspace*{\@SepTotales}\fi
     \else% Aquí casi cualquier cosa tiene aspecto feo.
      \CLASSWARNING{Es mejor no usar la opcio'n de totalizacio'n en filas en este caso, o disminuir los tama~nos de los tipos de letra para la totalizacio'n}%
      \centering{%
       \begin{tabular}{r@{\hspace*{\@SeparaMinTotales}}l}
        \usebox{\@CajaBIAliR} & \usebox{\@CajaBIAliA} \\[\@SeparaFilas]
        \usebox{\@CajaBIAliG} & \if@Exento\usebox{\@CajaBIET}\else\usebox{\@CajaTotal}\fi
       \end{tabular}}%
     \fi
    \fi
   \fi
  \fi
  \par
  \ifexpandecuadro
   \vspace*{-\@EspacioVacioInicial}%
   \vspace*{\@EspacioVacioFinal}%
   \zsaveposy{EspacioVacioInicial}%
  \fi
  \vfill
  \ifexpandecuadro\zsaveposy{EspacioVacioFinal}\fi
  \vspace*{\@SeparaVertical}\par
  \ifdefvoid{\@NotaExterna}{}{%
   \parbox[t]{\linewidth}{\@LetraNotaExterna\@NotaExterna}\vspace*{\@SeparaVertical}\ifsinexpandir\vfill\fi}\par}

  \ifbool{SinCantidad}
  % Definamos todos los comandos \Item***. El descuento es opcional; por eso usamos G{0} en \NewDocumentCommand.
  {%
   \NewDocumentCommand{\Item}{m o m G{0} +o}{\@ITEM{G}{1}{#1}[#2]{#3}{#4}[#5]}% Ítem normal.
   \NewDocumentCommand{\ItemR}{m o m G{0} +o}{\global\@BIRtrue\global\Gtrue\@ITEM{R}{1}{#1}[#2]{#3}{#4}[#5]}% Ítem con IVA reducido.
   \NewDocumentCommand{\ItemA}{m o m G{0} +o}{\global\@BIAtrue\global\Gtrue\@ITEM{A}{1}{#1}[#2]{#3}{#4}[#5]}% Ítem con IVA adicional.
   \NewDocumentCommand{\ItemE}{m o m G{0} +o}{\global\@Exentotrue\global\Gtrue\@ITEM{E}{1}{#1}[#2]{#3}{#4}[#5]}% Ítem exento de IVA.
   \NewDocumentCommand{\ItemX}{m o +o}{\@ITEM{X}{1}{#1}[#2]{0}{0}[#3]}% Ítem sin precio.
   \let\ItemG\Item
   \ifcsv
    \ifdescuentos
     \write\csv{"\@@Descripcion","\@@Descuento","\@@Precio \space (\Moneda)","\@@IVA"}%
    \else
     \write\csv{"\@@Descripcion","\@@Precio \space (\Moneda)","\@@IVA"}%
    \fi
   \fi}
  {%
   \NewDocumentCommand{\Item}{m m o m G{0} +o}{\@ITEM{G}{#1}{#2}[#3]{#4}{#5}[#6]}% Ítem normal.
   \NewDocumentCommand{\ItemR}{m m o m G{0} +o}{\global\@BIRtrue\global\Gtrue\@ITEM{R}{#1}{#2}[#3]{#4}{#5}[#6]}% Ítem con IVA reducido.
   \NewDocumentCommand{\ItemA}{m m o m G{0} +o}{\global\@BIAtrue\global\Gtrue\@ITEM{A}{#1}{#2}[#3]{#4}{#5}[#6]}% Ítem con IVA adicional.
   \NewDocumentCommand{\ItemE}{m m o m G{0} +o}{\global\@Exentotrue\global\Gtrue\@ITEM{E}{#1}{#2}[#3]{#4}{#5}[#6]}% Ítem exento de IVA.
   \NewDocumentCommand{\ItemX}{m m o +o}{\@ITEM{X}{#1}{#2}[#3]{0}{0}[#4]}% Ítem sin precio.
   \let\ItemG\Item
   \ifcsv
    \if@cdu
     \ifdescuentos
      \write\csv{"\@@Cantidad","\@@Descripcion","\@@PrecioU \space (\Moneda)","\@@Descuento","\@@PrecioT \space (\Moneda)","\@@IVA"}%
     \else
      \write\csv{"\@@Cantidad","\@@Descripcion","\@@PrecioU \space (\Moneda)","\@@PrecioT \space (\Moneda)","\@@IVA"}%
     \fi
    \fi
    \ifdcu
     \ifdescuentos
      \write\csv{"\@@Descripcion","\@@Cantidad","\@@PrecioU \space (\Moneda)","\@@Descuento","\@@PrecioT \space (\Moneda)","\@@IVA"}%
     \else
      \write\csv{"\@@Descripcion","\@@Cantidad","\@@PrecioU \space (\Moneda)","\@@PrecioT \space (\Moneda)","\@@IVA"}%
     \fi
    \fi
    \ifduc
     \ifdescuentos
      \write\csv{"\@@Descripcion","\@@PrecioU \space (\Moneda)","\@@Cantidad","\@@Descuento","\@@PrecioT \space (\Moneda)","\@@IVA"}%
     \else
      \write\csv{"\@@Descripcion","\@@PrecioU \space (\Moneda)","\@@Cantidad","\@@PrecioT \space (\Moneda)","\@@IVA"}%
     \fi
    \fi
   \fi}

 \if@factura
  % Los descuentos totales no son compatibles -y no creo que lo vayan a ser- con el modo de totalización en filas.
  \iffilas
   \if@DescuentoTotal
    \CLASSWARNING{La opcio'n 'filas' no es compatible con los descuentos totales; sin efecto opcio'n 'filas'}
    \filasfalse
   \fi
  \fi
  \if@reverso
  \else
    \RenewEnviron{reverso}{}
  \fi
  \expandafter\geometry\expandafter{\@GeometriaFactura}%  La geometría debe aplicarse aquí.
  \AfterEndPreamble{%
   \addtolength{\@PosFechaX}{\oddsidemargin+1in}%  Le sumamos el margen izquierdo a las posiciones de las cosas; es importante que se haga en un \AfterEndPreamble antes de que empiecen a escribirse otras cosas en la página.
   \addtolength{\@PosDenominacionX}{\oddsidemargin+1in}%
   \addtolength{\@PosFormalibreX}{\oddsidemargin+1in}%
   \addtolength{\@PosControlX}{\oddsidemargin+1in}%
   \addtolength{\@PosNotaFinalXuno}{\oddsidemargin+1in}%
   \addtolength{\@PosFirmasXuno}{\oddsidemargin+1in}%
   \setlength{\parskip}{0pt plus 1pt}%
   \expandafter\setlength{\@SepTotales}{\the\@SeparaMinTotales plus 1fill}% \@SeparaMinTotales es el mínimo espacio entre los totales en el modo 'filas', y SepTotales es una dimensión interna, estirable, con ese como su mínimo.
   \thispagestyle{empty}%
   \pagenumbering{roman}%
   \@EscribeEncFactura}
   \AtBeginShipoutNext{% Antes abría aquí un \AtBeginShipoutNext cuando había reporte y un \AtEndDocument cuando no. No es necesario eso. También lo modifiqué en \FirmaFactura.
    \@CargaFondoFactura
    \@PosicionaFechas
    \ifsindenominacion\else\@PosicionaDenominacion\fi
    \ifprefactura\@PosicionaNumControl\@PosicionaFormalibre\fi
    \ifnum\value{@Firmas}=0\else\@PosicionaFirmas\fi
    \ifdefvoid{\@NotaFinal}{}{\@PosicionaNotaFinal}
    \ifdefvoid{\@Membrete}{}{\@EscribeMembrete}}
  \iflinea
   % Para determinar las coordenadas de la línea hay que usar \AtBeginShipoutNext porque si no se hace en el 'shipout' de la página se genera un espacio en blanco extra.
   \AtBeginShipoutNext{\iflinea\@DibujaLinea\fi}
    \iffilas
     \ifbool{SinLineasVertInt}{\@LineaDesdeIniciotrue\@LineaHastaFinaltrue}{\@LineaDescripciontrue}%
    \else
     \ifsintotales
      \@LineaDesdeIniciotrue\@LineaHastaFinaltrue
     \else
      \@LineaDesdeIniciotrue\@LineaHastaTotaltrue
     \fi
    \fi
  \fi
  %% El comando para la descripción del servicio prestado.
  \NewDocumentCommand{\Descripcion}{+m}{%
   {% Abrimos un grupo adicional para que la redefinición del entorno 'tikzpicture' sea local.
    \@LetraDescripcion
    % Cuando la línea tiene grosor cero, hacemos que el entorno 'tikzpicture' sea "fake", y redefinimos \node para que obvie los parámetros que le dimos como argumento opcional.
    \ifdim\@GrosorLineaDescripcion=0pt%
     \setlength{\@SeparaInternaDescripcion}{0pt}\setlength{\@EsquinaLineaDescripcion}{0pt}\setlength{\@SombraDescripcion}{0pt}%
     \renewenvironment{tikzpicture}{\NewDocumentCommand{\node}{o +m}{####2}}{}%
    \fi
    \@DibujaDescripcion{#1}%
    \par\vspace*{\@SombraDescripcion}}}%
 \else
  \RenewEnviron{factura}{%
   \@ZERO
   \let\label\label@factura
   \let\@ITEM\@CalculaItem
   \BODY
   \@CalculaTotalesI}
  \RenewEnviron{reverso}{}%
  \gdef\@EncabezadoFactura{}%
  \NewDocumentCommand{\Descripcion}{+m}{}%
 \fi

 \if@reporte
  \ifdefvoid{\@InfoPagina}{\let\@InfoPagina\@InfoPaginaNoTitulo}{}%
  \if@factura
  \else
   \expandafter\geometry\expandafter{\@GeometriaReporte}%  La geometría del reporte debe aplicarse aquí cuando sólo hay reporte, así se puede establecer el tamaño del papel.
  \fi
  \NewEnviron{reporte}{%
   \if@factura
    \expandafter\newgeometry\expandafter{\@GeometriaReporte}\cleardoublepage%  La geometría debe aplicarse aquí cuando también hay factura, pero no se puede cambiar el tamaño del papel.
   \fi
   \let\headwidth\textwidth
   \@CargaFondoReporte
   \@EscribeEncReporte
   \ifdefvoid{\@EstiloPaginaResto}{%
    \if@FondoReporteStar%  Si no usamos \EstiloPagina entonces se fijará 'soloabajo' cuando se use \FondoReporte* para que sólo use marcas de pie de página, y si no se usó \FondoReporte* entonces se fijará 'plain' que usa cabeceras y pies de página.
     \pagestyle{soloabajo}%
    \else
     \pagestyle{plain}%
    \fi}
    {\pagestyle{\@EstiloPaginaResto}}%  Si usamos \EstiloPagina en su argumento obligatorio entonces fijamos ese estilo de página.
   \ifdefvoid{\@EstiloPaginaUno}{%
    \if@FondoReporte%  Si no le damos a \EstiloPagina su argumento opcional, entonces se fijará 'solonumpag' como el estilo de página para la primera página, pero solamente si usamos \FondoReporte, ya que el estilo de página predeterminado al usar \FondoReporte* ya se acaba de fijar y no necesita el caso especial de la primera hoja (\thispagestyle).
     \if@FondoReporteStar
     \else
      \thispagestyle{solonumpag}%
     \fi
    \fi}
    {\thispagestyle{\@EstiloPaginaUno}}%  Si usamoe el argumento opcional de \EstiloPagina establecemos ese estilo de página.
   \pagenumbering{arabic}%
   \@EstiloParrafoReporte
   \BODY\clearpage}% espacio antes de empezar con el reporte, después del título -si lo hubiera-.
 \else
  \NewEnviron{reporte}{}
 \fi}

%% Comando para el diseño de la forma libre.
\newcommand{\@CargaFondoFactura}{%
 \if@FondoFactura
  \begin{textblock*}{\paperwidth}(0pt,0pt)%
   \includegraphics{\@FondoFactura}%
  \end{textblock*}%
 \fi}

%% Comando para el fondo del reporte.
\newcommand{\@CargaFondoReporte}{%
 \begin{textblock*}{\paperwidth}(0pt,0pt)% Tuve que abrir el textblock* aquí para que aplique siempre; de esta manera se corrige un defecto que se produce cuando se usa \vspace* al inicio de la página (dentro de \@EscribeEncReporte).
  \if@FondoReporte
   \if@FondoReporteStar
    \AddToShipoutPictureBG{\includegraphics{\@FondoReporte}}%
   \else
     \noindent\includegraphics{\@FondoReporte}%
   \fi
  \fi
 \end{textblock*}}

%% Comando que coloca los espacios para firmar.
\newcommand{\@PosicionaFirmas}{%
 \savebox{\@CajaFirmas}{%
  \parbox{\textwidth+\oddsidemargin+1in-\@PosFirmasXuno-\@PosFirmasXdos}{\@EstiloFirmas}}%
 \ifbool{FirmasYnegativo}{\addtolength{\@PosFirmasY}{\paperheight-\ht\@CajaFirmas-\dp\@CajaFirmas}}{}%
 \begin{textblock*}{\wd\@CajaFirmas}(\@PosFirmasXuno,\@PosFirmasY)%
  \usebox{\@CajaFirmas}%
 \end{textblock*}}

%% Comando que coloca la nota final.
\newcommand{\@PosicionaNotaFinal}{%
 \savebox{\@CajaNotaFinal}{%
  \parbox{\textwidth+\oddsidemargin+1in-\@PosNotaFinalXuno-\@PosNotaFinalXdos}{\@EscribeNotaFinal}}%
 \ifbool{NotaFinalYnegativo}{\addtolength{\@PosNotaFinalY}{\paperheight}}{}%
 \ifbool{NotaFinalYarriba}{\addtolength{\@PosNotaFinalY}{-\ht\@CajaNotaFinal-\dp\@CajaNotaFinal}}{}% Aquí la caja abre hacia abajo, a menos de que usemos \PosNotaFinal*
 \begin{textblock*}{\wd\@CajaNotaFinal}(\@PosNotaFinalXuno,\@PosNotaFinalY)%
  \usebox{\@CajaNotaFinal}%
 \end{textblock*}}

%% Comando que coloca el texto 'FORMA LIBRE'.
\newcommand{\@PosicionaFormalibre}{%
 \savebox{\@CajaFormalibre}{\@EstiloFormalibre}%
 \ifbool{FormalibreXnegativo}{\addtolength{\@PosFormalibreX}{\textwidth-\wd\@CajaFormalibre}}{}%
 \ifbool{FormalibreYnegativo}{\addtolength{\@PosFormalibreY}{\paperheight}}{}%
 \ifbool{FormalibreYarriba}{\addtolength{\@PosFormalibreY}{-\ht\@CajaFormalibre-\dp\@CajaFormalibre}}{}%
 \begin{textblock*}{\wd\@CajaFormalibre}(\@PosFormalibreX,\@PosFormalibreY)%
  \usebox{\@CajaFormalibre}%
 \end{textblock*}}

%% Comando que coloca el número de control.
\newcommand{\@PosicionaNumControl}{%
 \savebox{\@CajaControl}{\@EstiloNumControl}%
 \ifbool{ControlXnegativo}{\addtolength{\@PosControlX}{\textwidth-\wd\@CajaControl}}{}%
 \ifbool{ControlYnegativo}{\addtolength{\@PosControlY}{\paperheight}}{}%
 \ifbool{ControlYarriba}{\addtolength{\@PosControlY}{-\ht\@CajaControl-\dp\@CajaControl}}{}%
 \begin{textblock*}{\wd\@CajaControl}(\@PosControlX,\@PosControlY)%
  \usebox{\@CajaControl}%
 \end{textblock*}}

%% Comando que coloca la denominación del documento.
\newcommand{\@PosicionaDenominacion}{%
 \savebox{\@CajaDenominacion}{\@EstiloDenominacion}%
 \ifbool{DenominacionXnegativo}{\addtolength{\@PosDenominacionX}{\textwidth-\wd\@CajaDenominacion}}{}%
 \ifbool{DenominacionYnegativo}{\addtolength{\@PosDenominacionY}{\paperheight}}{}%
 \ifbool{DenominacionYarriba}{\addtolength{\@PosDenominacionY}{-\ht\@CajaDenominacion-\dp\@CajaDenominacion}}{}%
 \begin{textblock*}{\wd\@CajaDenominacion}(\@PosDenominacionX,\@PosDenominacionY)%
  \usebox{\@CajaDenominacion}%
 \end{textblock*}}

%% Comando que coloca la(s) fecha(s).
\newcommand{\@PosicionaFechas}{%
 \savebox{\@CajaFecha}{\@EstiloFechas}%
 \ifbool{FechaXnegativo}{\addtolength{\@PosFechaX}{\textwidth-\wd\@CajaFecha}}{}%
 \ifbool{FechaYnegativo}{\addtolength{\@PosFechaY}{\paperheight}}{}%
 \ifbool{FechaYarriba}{\addtolength{\@PosFechaY}{-\ht\@CajaFecha-\dp\@CajaFecha}}{}%
 \begin{textblock*}{\wd\@CajaFecha}(\@PosFechaX,\@PosFechaY)%
  \usebox{\@CajaFecha}%
 \end{textblock*}}

%% Comando que coloca la identificación del reporte al inicio.
\newcommand{\@EscribeDatosReporte}{%
 {\@LetraEncReporte
  \setlength{\parindent}{0pt}%
  {\bfseries \@@Proveedor} \@Proveedor \par
  {\bfseries \@@Cliente} \@RazonSocial \par
  \ifdefvoid{\@Contacto}{}{{\bfseries \@@Contacto} \@Contacto \par}%
  \ifdefvoid{\@TituloReporte}{}{\vspace*{\baselineskip}{\@LetraTitReporte \centering \@TituloReporte \par}}}}

%% Comando que coloca las dos cajas del encabezado: la de los datos del cliente y la del -opcional- resumen.
\newcommand{\@EscribeDatos}{%
 {\@LetraEncFactura% Abrimos un nuevo grupo para que el cambio de tipografía y la redefinición del entorno 'tikzpicture' sean locales.
  \ifdim\@GrosorLineaEncabezado=0pt%
   \setlength{\@SeparaInternaEncabezado}{0pt}\setlength{\@EsquinaLineaEncabezado}{0pt}\setlength{\@SombraEncabezado}{0pt}%
   \renewenvironment{tikzpicture}{\NewDocumentCommand{\node}{o +m}{####2}}{}%
  \fi
  \@DibujaDatos
  \par\vspace*{\@SombraEncabezado}}}%  Para que textblock* esté en modo vertical.

\newcommand{\@EscribeDatosResumen}{%
 {\@LetraEncFactura% Abrimos un nuevo grupo para que el cambio de tipografía y la redefinición del entorno 'tikzpicture' sean locales.
  \ifdim\@GrosorLineaEncabezado=0pt%
   \setlength{\@SeparaInternaEncabezado}{0pt}\setlength{\@EsquinaLineaEncabezado}{0pt}\setlength{\@SombraEncabezado}{0pt}%
   \renewenvironment{tikzpicture}{\NewDocumentCommand{\node}{o +m}{####2}}{}%
  \fi
  \savebox{\@CajaDatos}{%
   \parbox[t]{\textwidth/2-\@SeparaDatosResumen/2-2\@SeparaInternaEncabezado-\@GrosorLineaEncabezado-\@SombraEncabezado}{\@DatosAux*}}%
  \savebox{\@CajaResumen}{%
   \parbox[t]{\textwidth/2-\@SeparaDatosResumen/2-2\@SeparaInternaEncabezado-\@GrosorLineaEncabezado-\@SombraEncabezado}{\@ResumenAux}}%
  \setlength{\@TamDatos}{\ht\@CajaDatos+\dp\@CajaDatos}%
  \setlength{\@TamResumen}{\ht\@CajaResumen+\dp\@CajaResumen}%
  \ifdim\@TamDatos>\@TamResumen
   \setlength{\@TamFinalEncabezado}{\@TamDatos}%
  \else
   \setlength{\@TamFinalEncabezado}{\@TamResumen}%
  \fi
  \@DibujaDatosResumen
  \par\vspace*{\@SombraEncabezado}}}%  El \par es para que textblock* esté en modo vertical.

%% Comando que coloca la caja para la nota previa, con la posibilidad de TikZ.
\newcommand{\@EscribeNotaPrevia}{%
 {% Abrimos un nuevo grupo para que la redefinición del entorno 'tikzpicture' sea local.
  \ifdefvoid{\@NotaPrevia}{}{%
   \baselineskip0pt
   \ifdim\@GrosorLineaNotaPrevia=0pt%
    \setlength{\@SeparaInternaNotaPrevia}{0pt}\setlength{\@EsquinaLineaNotaPrevia}{0pt}\setlength{\@SombraNotaPrevia}{0pt}%
    \renewenvironment{tikzpicture}{\NewDocumentCommand{\node}{o +m}{####2}}{}%
   \fi
   \@DibujaNotaPrevia
   \par\vspace*{\@SombraNotaPrevia}\vspace*{\@SeparaVertical}%
   \ifsinexpandir\vfill\fi}}}

%% Comando que coloca la caja para la nota final, con la posibilidad de TikZ.
\newcommand{\@EscribeNotaFinal}{%
 {% Abrimos un nuevo grupo para que la redefinición del entorno 'tikzpicture' sea local.
  \ifdim\@GrosorLineaNotaFinal=0pt%
   \setlength{\@SeparaInternaNotaFinal}{0pt}\setlength{\@EsquinaLineaNotaFinal}{0pt}\setlength{\@SombraNotaFinal}{0pt}%
   \renewenvironment{tikzpicture}{\NewDocumentCommand{\node}{o +m}{####2}}{}%
  \fi
  \@DibujaNotaFinal
  \par\vspace*{\@SombraNotaFinal}}}

%% Comandos auxiliares para los datos y el resumen.
%% En el caso de los datos, la versión \@DatosAux se ejecuta cuando no hay resumen, y la versión \@DatosAux* se ejecuta cuando hay resumen.
\NewDocumentCommand{\@DatosAux}{s}{%
 \hfill {\@LetraTitEnc \@@Datos}\hfill \mbox{}\par
 \IfBooleanT{#1}{\vfill}%
 {\bfseries \if@Nombre \@@Nombre \else \@@RazonSocial \fi} \@RazonSocial
 \IfBooleanTF{#1}{\par}{\dotfill}%
 {\bfseries \@@RIF} {\ttfamily \@RIF}\par
 \ifdefvoid{\@Contacto}{}{{\bfseries \@@Contacto} \@Contacto \par}%
 {\bfseries \@@Direccion} \@Direccion \par
 \ifdefvoid{\@Telefono}{}{{\bfseries \@@Telefono} {\ttfamily \@Telefono}}%
 \ifdefvoid{\@Email}
  {\par}
  {\IfBooleanTF{#1}
   {\par}
   {\ifdefvoid{\@Telefono}{}{\hspace*{\@SeparaTelefonoEmail}\@CaracterSeparaTelefonoEmail\hspace*{\@SeparaTelefonoEmail}}}%
  {\bfseries \@@Email} {\ttfamily \@Email}}%
 \IfBooleanT{#1}{\vfill}}

\newcommand{\@ResumenAux}{\hfill {\@LetraTitEnc \@@Resumen}\hfill \mbox{}\vfill\@Resumen\vfill}

%% Comando que coloca la línea diagonal.
\newcommand{\@DibujaLinea}{%
 \setlength{\@LineaNodoXo}{\zposx{LineaNodoACoordX} sp}%
 \setlength{\@LineaNodoYo}{\zposy{LineaNodoBCoordY} sp}%
 \setlength{\@LineaNodoXf}{\zposx{LineaNodoBCoordX} sp}%
 \setlength{\@LineaNodoYf}{\zposy{LineaNodoBCoordY} sp}%
 \addtolength{\@LineaNodoYo}{\@EspacioVacioInicial-\@EspacioVacioFinal}%
 \if@LineaDesdeInicio
  \addtolength{\@LineaNodoXo}{-\tabcolsep@@}%
 \fi
 \if@LineaHastaFinal
  \addtolength{\@LineaNodoXf}{\tabcolsep@@}%
 \fi
 \iffilas
  \addtolength{\@LineaNodoYf}{-.3\baselineskip@@}%
  \if@LineaDescripcion
   \addtolength{\@LineaNodoXo}{-\tabcolsep@@}%
   \addtolength{\@LineaNodoXf}{\tabcolsep@@}%
  \fi
 \else
  \ifsintotales
  \addtolength{\@LineaNodoYf}{-.3\baselineskip@@}%
  \else
   \if@DescG \addtolength{\@LineaNodoYo}{2\baselineskip@@}\fi
   \if@DescR \if@BIR \addtolength{\@LineaNodoYo}{2\baselineskip@@}\fi\fi
   \if@DescA \if@BIA \addtolength{\@LineaNodoYo}{2\baselineskip@@}\fi\fi
   \if@DescE \if@Exento \addtolength{\@LineaNodoYo}{2\baselineskip@@}\fi\fi
   \addtolength{\@LineaNodoYo}{\baselineskip@@}%
   \addtolength{\@LineaNodoYf}{-.3\baselineskip@@}%
   \ifsinivaexpresado
   \else
    \addtolength{\@LineaNodoYo}{2\baselineskip@@}%
    \if@BIR\addtolength{\@LineaNodoYo}{2\baselineskip@@}\fi
    \if@BIA\addtolength{\@LineaNodoYo}{2\baselineskip@@}\fi
    \if@Exento\addtolength{\@LineaNodoYo}{\baselineskip@@}\fi
   \fi
  \fi
 \fi
 \iflinea
  \begin{textblock*}{\paperwidth-\@LineaNodoXo}(\@LineaNodoXo,\paperheight-\@LineaNodoYo)%
   \begin{tikzpicture}%
    \draw (\@LineaNodoXo,\@LineaNodoYo) -- (\@LineaNodoXf,\@LineaNodoYf);%
   \end{tikzpicture}%
  \end{textblock*}%
 \fi}

%% Escribimos los totales al archivo csv.
\newcommand{\@EscribeTotalesEnCSV}{%
 \ifcsv
  \if@Exento
   \if@DescE
    \immediate\write\csv{Totales: \@@SubtotalE: \Moneda \SubtE^^JTotales: \@@DescuentoE: \Moneda \DescE}%
   \fi
   \immediate\write\csv{Totales: \@@BIE: \Moneda \BIE}%
  \fi
  \if@BIR
   \if@DescE
    \immediate\write\csv{Totales: \@@SubtotalR: \Moneda \SubtR^^JTotales: \@@DescuentoR: \Moneda \DescR}%
   \fi
   \immediate\write\csv{Totales: \@@BIR: \Moneda \BIR^^JTotales: \@@AlicuotaR: \Moneda \AlicuotaR}%
  \fi
  \if@DescG
   \immediate\write\csv{Totales: \@@SubtotalG: \Moneda \SubtG^^JTotales: \@@DescuentoG: \Moneda \DescG}%
  \fi
  \immediate\write\csv{Totales: \@@BIG: \Moneda \BIG^^JTotales: \@@AlicuotaG: \Moneda \AlicuotaG}%
  \if@BIA
   \if@DescA
    \immediate\write\csv{Totales: \@@SubtotalA: \Moneda \SubtA^^JTotales: \@@DescuentoA: \Moneda \DescA}%
   \fi
   \immediate\write\csv{Totales: \@@BIA: \Moneda \BIA^^JTotales: \@@AlicuotaA: \Moneda \AlicuotaA}%
  \fi
  \immediate\write\csv{Totales: \@@Total: \Moneda \Total}%
  \immediate\closeout\csv
 \fi}

%% Hubo que redefinir \cleardoublepage agregándole \thispagestyle{empty} porque si no queda una página en blanco con cabeceras de página usando twoside.
\def\cleardoublepage{%
 \clearpage
 \if@twoside
  \ifodd\c@page
   \else
    \hbox{}\thispagestyle{empty}\newpage
    \if@twocolumn
     \hbox{}\newpage
    \fi
   \fi
 \fi}

\endinput
%%
%% End of file `factura.cls'.

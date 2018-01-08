# Practica 2, Tipología y ciclo de vida de los datos

**Punto 1**

**Motivación**

Al llegar a su fin el año 2018, se pueden leer una gran cantidad de artículos que analizan lo ocurrido a través del año. Una de las noticias ha sido el asalto definitivo de las tecnológicas al convertirse en los 5 valores de bolsa mas cotizados del mundo, siendo ellos Apple, Alphabet (Google), Microdoft, Amazon y Facebook. En el 2016 en los primeros 5 podíamos encontrar a la petrolera Exxon Mobil, que en 2017 fue desplazada al séptimo lugar.

Podemos encontrar a estas 5 grandes empresas en el índice bursátil Standard & Poor's 500, uno de los índices mas importantes de EEUU y del mundo entero. Este índice lo componen empresas que cotizan en el NYSE y el NASDAQ, las dos bolsas mas importantes de EEUU, siendo NYSE mas tradicional, y el NASDAQ una bolsa totalmente electrónica en la actualidad donde cotizan gran parte de las tecnológicas.

El estudio de estas 5 empresas es sumamente importante, no solo para la bolsa, sino para la economía mundial, ya que muchos economistas hablan ya de una posible burbuja tecnológica. Recordemos que a principios de la década del 2000 estallo la burbuja de las .com, y aunque su impacto en la economía mundial no fue tan grave, todo tipo de burbujas que afecten a EE. UU. debe ser monitorizada de cerca.
Datos

Utilizaremos el dataset S&P 500 stock data “Historical stock data for all current S&P 500 companies” publicado por el usuario Cam Nugent en el repositorio Kaggle.com, el cual ha sido revisado por varios usuarios. El mismo esta publicado en formato .csv

**¿Porque este repositorio?**

El mismo es muy completo, tiene datos desde 2012 a 2017.Podemos encontrar los datos en formato .csv tanto de cada valor individualmente como de todos en su conjunto, en el ultimo caso tanto para 1 año como también para 5.

**Objetivo**

Por lo que el objetivo será analizar dichos valores, y sacar como conclusión si pueden generar una burbuja o no.

Punto 2. Limpieza de los datos

**Punto 2.1 Seleccionar los datos de interés. **

En primer lugar, trabajaremos con 6 archivos .csv, los valores de cada empresa, y el csv que contiene las 500 empresas.
Todos estos archivos tienen en común sus cabecera, el primer paso será ver que nos sirve de estos archivos
```
> head(all_stocks_1yr)
        Date   Open   High    Low  Close  Volume Name
1 2016-08-12 181.47 181.47 179.90 180.27 1232856  MMM
2 2016-08-15 181.00 181.39 180.46 180.56 1268247  MMM
3 2016-08-16 180.12 180.33 179.21 179.25 1363554  MMM
4 2016-08-17 178.67 180.09 178.32 179.87 1358528  MMM
5 2016-08-18 179.70 179.70 178.58 179.18 1088677  MMM
6 2016-08-19 178.66 179.78 178.08 179.61 1305289  MMM
```
Nos interesa solamente la fecha (Date), el valor de Cierre (Close) y el Nombre (Name). Aunque no guardaremos una columna con el nombre sino que llamaremos así la tabla que contenga esos valores o a las columnas de un nuevo data.frame. 

**¿Porque se usar el valor de cierre y no otro?**

•	No todos los mercados a nivel mundial tienen subastas de apertura y esa es una de las razones que internacionalmente se use el de cierre.

•	El precio de la subasta de apertura puede estar influido por lo que haya sucedió en el mercado mientras la bolsa estuviera cerrada.

•	La apertura es más volátil.

•	El precio de cierre esta mas justado a la realidad.

Crearemos 5 nuevas tablas con los valores transformados
```
table01<- AAPL_data
table1 <- table0[,-c(2,3,4,6)]

table02<- GOOGL_data
table2 <- table02[,-c(2,3,4,6)]

table03<- MSFT_data
table3 <- table03[,-c(2,3,4,6)]

table04<- AMZN_data
table4 <- table04[,-c(2,3,4,6)]

table05<- FB_data
table5 <- table05[,-c(2,3,4,6)]
```
Si observamos el código de R, podemos ver que hemos quitado las columnas 2, 3, 4, y 6 dejando solo así dos columnas la 1 y la 5 que son las correspondientes a la fecha y el valor de cierre.
```
> head(table1)
# A tibble: 6 x 3
        Date Close  Name
      <date> <dbl> <chr>
1 2012-08-13 90.00  AAPL
2 2012-08-14 90.24  AAPL
3 2012-08-15 90.12  AAPL
4 2012-08-16 90.91  AAPL
5 2012-08-17 92.59  AAPL
6 2012-08-20 95.02  AAPL
> head(table2)
# A tibble: 6 x 3
        Date  Close  Name
      <date>  <dbl> <chr>
1 2012-08-13 330.34 GOOGL
2 2012-08-14 334.66 GOOGL
3 2012-08-15 334.10 GOOGL
4 2012-08-16 336.77 GOOGL
5 2012-08-17 338.91 GOOGL
6 2012-08-20 338.11 GOOGL
> head(table3)
# A tibble: 6 x 3
        Date Close  Name
      <date> <dbl> <chr>
1 2012-08-13 30.39  MSFT
2 2012-08-14 30.13  MSFT
3 2012-08-15 30.20  MSFT
4 2012-08-16 30.78  MSFT
5 2012-08-17 30.90  MSFT
6 2012-08-20 30.74  MSFT
> head(table4)
# A tibble: 6 x 3
        Date  Close  Name
      <date>  <dbl> <chr>
1 2012-08-13 232.44  AMZN
2 2012-08-14 233.19  AMZN
3 2012-08-15 237.42  AMZN
4 2012-08-16 241.55  AMZN
5 2012-08-17 241.17  AMZN
6 2012-08-20 240.35  AMZN
> head(table5)
# A tibble: 6 x 3
        Date Close  Name
      <date> <dbl> <chr>
1 2012-08-13 21.60    FB
2 2012-08-14 20.38    FB
3 2012-08-15 21.20    FB
4 2012-08-16 19.87    FB
5 2012-08-17 19.05    FB
6 2012-08-20 20.01    FB
```

Creacion de “table0” que es una tabla con todos los valores juntos.
```
>Table0<- data.frame(DATE = table1$Date, AAPL = table1$Close, GOOGL = table2$Close, MSFT = table3$Close, AMZN = table4$Close, FB = table5$Close)

> head(table0)
        Date  AAPL  GOOGL  MSFT   AMZN    FB
1 2012-08-13 90.00 330.34 30.39 232.44 21.60
2 2012-08-14 90.24 334.66 30.13 233.19 20.38
3 2012-08-15 90.12 334.10 30.20 237.42 21.20
4 2012-08-16 90.91 336.77 30.78 241.55 19.87
5 2012-08-17 92.59 338.91 30.90 241.17 19.05
6 2012-08-20 95.02 338.11 30.74 240.35 20.01
```
**Primera vista de los datos:**

Utilizando la función summary de R podemos ver los datos básicos de cada valor de bolsa. Ademas usaremos la función plot para graficar dichos valores.
![Imagen](https://github.com/MCerros/practica2/blob/master/8.png)
```
> summary(table1)
      Date                Close            Name          
 Min.   :2012-08-13   Min.   : 55.79   Length:1258       
 1st Qu.:2013-11-12   1st Qu.: 77.70   Class :character  
 Median :2015-02-12   Median :100.75   Mode  :character  
 Mean   :2015-02-12   Mean   :101.04                     
 3rd Qu.:2016-05-12   3rd Qu.:117.15                     
 Max.   :2017-08-11   Max.   :161.06 
 ```
 ![Imagen](https://github.com/MCerros/practica2/blob/master/9.png)
 ```
> summary(table2)
      Date                Close            Name          
 Min.   :2012-08-13   Min.   : 323.9   Length:1258       
 1st Qu.:2013-11-12   1st Qu.: 508.2   Class :character  
 Median :2015-02-12   Median : 579.2   Mode  :character  
 Mean   :2015-02-12   Mean   : 616.6                     
 3rd Qu.:2016-05-12   3rd Qu.: 759.8                     
 Max.   :2017-08-11   Max.   :1004.3 
 ```
  
 ```
> summary(table3)
      Date                Close           Name          
 Min.   :2012-08-13   Min.   :26.37   Length:1258       
 1st Qu.:2013-11-12   1st Qu.:36.05   Class :character  
 Median :2015-02-12   Median :45.34   Mode  :character  
 Mean   :2015-02-12   Mean   :45.91                     
 3rd Qu.:2016-05-12   3rd Qu.:54.34                     
 Max.   :2017-08-11   Max.   :74.22  
 ```
 
 ```
> summary(table4)
      Date                Close            Name          
 Min.   :2012-08-13   Min.   : 220.6   Length:1258       
 1st Qu.:2013-11-12   1st Qu.: 305.0   Class :character  
 Median :2015-02-12   Median : 384.6   Mode  :character  
 Mean   :2015-02-12   Mean   : 492.9                     
 3rd Qu.:2016-05-12   3rd Qu.: 697.3                     
 Max.   :2017-08-11   Max.   :1052.8     
 ```
 
 ```
> summary(table5)
      Date                Close            Name          
 Min.   :2012-08-13   Min.   : 17.73   Length:1258       
 1st Qu.:2013-11-12   1st Qu.: 49.57   Class :character  
 Median :2015-02-12   Median : 78.61   Mode  :character  
 Mean   :2015-02-12   Mean   : 81.61                     
 3rd Qu.:2016-05-12   3rd Qu.:114.88                     
 Max.   :2017-08-11   Max.   :172.45 
```
**Punto 2.2**

Los datos no contiene valores vacíos, ya que están publicados en kaggle con una calidad excepcional, tampoco hay errores, por lo que no hay valores extremos que debamos modificar.

Esto lo podemos saber analizando los datos de todo el índice para 5 años, ya que los datos individuales que usaremos se encuentran ahí tamvien

Aun así, si los hubiera habido las soluciones son la siguientes:

•	Valores extremos: Eliminarlos, ya que hay tantos valores y son diarios, eliminar algunos valores no afectaría a los datos.

•	Valores perdidos o 0: eliminarlos, en especial los 0 porque en el caso de nuestros datos esos 0 se convertirían en valores 
extremos, ya que estamos analizando las 5 empresas mas valiosas del mundo donde cada cotización es de 300 a 1200 dólares.

•	Valores vacíos: Se pueden arreglar al introducir los datos en r, siendo la mejor opción en nuestro caso dejar la opción por defecto.
```
> str(all_stocks_5yr)
Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	606801 obs. of  7 variables:
 $ Date  : Date, format: "2012-08-13" ...
 $ Open  : num  92.3 92.4 92 92.8 93.9 ...
 $ High  : num  92.6 92.5 92.7 93.9 94.3 ...
 $ Low   : num  91.7 92 91.9 92.2 93.6 ...
 $ Close : num  92.4 92.3 92.5 93.7 94.2 ...
 $ Volume: num  2075391 1843476 1983395 3395145 3069513 ...
 $ Name  : chr  "MMM" "MMM" "MMM" "MMM" ...
 - attr(*, "spec")=List of 2
  ..$ cols   :List of 7
  .. ..$ Date  :List of 1
  .. .. ..$ format: chr ""
  .. .. ..- attr(*, "class")= chr  "collector_date" "collector"
  .. ..$ Open  : list()
  .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
  .. ..$ High  : list()
  .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
  .. ..$ Low   : list()
  .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
  .. ..$ Close : list()
  .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
  .. ..$ Volume: list()
  .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
  .. ..$ Name  : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  ..$ default: list()
  .. ..- attr(*, "class")= chr  "collector_guess" "collector"
  ..- attr(*, "class")= chr "col_spec"
```
En la siguiente table solo vemos 0 como mínimos en el valor de volumen pero como no utilizaremos dicho valor y eliminaremos dicha columna no haremos ninguna modificación.
```
> summary(all_stocks_5yr)
      Date                 Open              High        
 Min.   :2012-08-13   Min.   :   1.62   Min.   :   1.69  
 1st Qu.:2013-11-29   1st Qu.:  38.07   1st Qu.:  38.46  
 Median :2015-03-10   Median :  59.24   Median :  59.79  
 Mean   :2015-02-27   Mean   :  79.53   Mean   :  80.26  
 3rd Qu.:2016-05-31   3rd Qu.:  89.39   3rd Qu.:  90.15  
 Max.   :2017-08-11   Max.   :2044.00   Max.   :2067.99  
                      NA's   :384       NA's   :208      
      Low              Close             Volume         
 Min.   :   1.50   Min.   :   1.59   Min.   :        0  
 1st Qu.:  37.70   1st Qu.:  38.09   1st Qu.:  1077091  
 Median :  58.69   Median :  59.27   Median :  2131913  
 Mean   :  78.80   Mean   :  79.56   Mean   :  4500925  
 3rd Qu.:  88.62   3rd Qu.:  89.43   3rd Qu.:  4442768  
 Max.   :2035.11   Max.   :2049.00   Max.   :618237630  
 NA's   :227                         NA's   :406        
     Name          
 Length:606801     
 Class :character  
 Mode  :character  
```
**Punto 3 Análisis de datos**

![Imagen](https://github.com/MCerros/practica2/blob/master/1.png)

**Normalidad:** la distribución no es una normal, los valores de bolsa no suelen seguir esta distribución y menos en el largo plazo, queda evidenciado en la gráfica de los valores de Apple por ejemplo:
 
Aun así podemos comprar esto estadísticamente en R con la prueba de normalidad de Shapiro
```
> shapiro.test(table1$Close)$p.value
[1] 2.282738e-14
> shapiro.test(table2$Close)$p.value
[1] 3.931053e-17
> shapiro.test(table3$Close)$p.value
[1] 5.097793e-16
> shapiro.test(table4$Close)$p.value
[1] 7.364145e-31
> shapiro.test(table5$Close)$p.value
[1] 1.239775e-17
```
Según el test de shapiro:

Ho: la muestra proviene de una población normal
Hi: la muestra no proviene de una población normal

Ademas si usamos $p.value en R obtenemos el valor p de dicho test, tal como vemos en los 5 test que corresponden a los 5 valores, el valor p es sumamente pequeño, por lo que se rechaza la Ho. De esta manera comprobamos que no es una distribución normal.
Homogeneidad de la varianza: 
Utilizaremos esta prueba para saber si la variabilidad de estos cinco valores es similar o no. 

Para esto usaremos la prueba de Bartlett donde:

Ho: La varinza es similar en los 5 valores
Hi: La varianza es diferente
```
> bartlett.test(tableH$Close, tableH$Name)

	Bartlett test of homogeneity of variances

data:  tableH$Close and tableH$Name
Bartlett's K-squared = 10883, df = 4, p-value < 2.2e-16
Estadístico: K-squared = 10883
Grados de libertad: df = 4
Valor P: p-value < 2.2e-16
```
EL valor p es sumamente pequeño por lo que se acepta la Ho y sabemos que los 5 valores son homogéneos en varianza

**Puntos 3.3, Punto 4 y Punto 5**

Ahora procederemos a aplicar varias pruebas estadísticas que nos servirán luego junto a los gráficos para sacar conclusiones.
La primera prueba que nos interesa realizar es la de correlación. Para los valores de bolsa es muy importante esta prueba. Cuando dos valores están correlacionados de forma positiva, significa que cuando uno suba subirá el otro y viceversa. Esto nos interesa mucho ya que significa que, si todos los valores están correlacionados positivamente, cuando uno caiga caerán todos, y eso es parte esencial en el estallido de una burbuja.

Para saber esto usaremos la librería de r psych
```
> library(psych)
> pairs.panels(table0[c(2,3,4,5,6)])
```
Dándonos como resultado el siguiente gráfico:

![Imagen](https://github.com/MCerros/practica2/blob/master/2.png)

Recordemos que los valores de correlación van desde el -1 al 1, siendo 1 correlación positiva, -1 correlación negativa y 0 ausencia total de correlación.

Como podemos ver todas las empresas están fuertemente correlacionadas. Aun así, podemos estudiar algo más a fondo el caso de Apple, ya que, aunque la correlación es muy alta, no es tan fuerte como en el resto de las empresas. Siendo la menor de las correlaciones la que tiene con Amazon

Esto podría corresponderse a que Apple tiene una marca profundamente diferenciada y un público sumamente fiel en algunos mercados. Es la única de las 5 empresas que tiene gran parte de su mercado en la venta de productos tecnológicos tangibles al por menor, móviles, Tablet, etc. de su propia marca. Mientras que las otras tienen gran parte de su negocio enfocados en servicio y algunas como Google y Facebook en la publicidad también. Aunque es cierto que Google y Microsoft venden, móviles, tabletas, etc., su cuota de mercado es ínfima.

Esta nos lleva a querer estudiar más profundamente la relación que Apple guarda con el resto de las compañías. Para eso usaremos la regresión lineal simple
Para eso estudiaremos por el método de regresión lineal y de la ANOVA la relación de APPLE como variable dependiente con el resto de las empresas.

La ANOVA comprueba que las medias poblacionales son similares.

**Regresión Lineal**
```
> modelo1<-lm(table0$AAPL~table0$GOOGL+table0$MSFT+table0$AMZN+table0$FB)
> summary(modelo1)

Call:
lm(formula = table0$AAPL ~ table0$GOOGL + table0$MSFT + table0$AMZN + 
    table0$FB)

Residuals:
    Min      1Q  Median      3Q     Max 
-26.844  -8.631  -1.980   8.399  33.411 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  63.062054   3.167983  19.906   <2e-16 ***
table0$GOOGL -0.188868   0.010152 -18.603   <2e-16 ***
table0$MSFT   2.258462   0.122414  18.449   <2e-16 ***
table0$AMZN  -0.010225   0.004855  -2.106   0.0354 *  
table0$FB     0.683713   0.042341  16.148   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 11.89 on 1253 degrees of freedom
Multiple R-squared:  0.7739,	Adjusted R-squared:  0.7732 
F-statistic:  1072 on 4 and 1253 DF,  p-value: < 2.2e-16
```
**ANOVA**
```
> modelo1<-lm(table0$AAPL~table0$GOOGL+table0$MSFT+table0$AMZN+table0$FB)
> ANOVA<-aov(modelo1)
> summary(ANOVA)
               Df Sum Sq Mean Sq  F value Pr(>F)    
table0$GOOGL    1 430505  430505 3047.670 <2e-16 ***
table0$MSFT     1 138561  138561  980.915 <2e-16 ***
table0$AMZN     1      0       0    0.001   0.98    
table0$FB       1  36833   36833  260.750 <2e-16 ***
Residuals    1253 176995     141                    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
Tal como vemos en ambos analices, Apple si está relacionado con Google, Microsoft y Facebook, pero no con Amazon. Recordemos que el mayor negocio de Amazon es la venta retail por internet, además en una escala mucho menor se dedica al análisis de datos, venta de datos, y de ciertos servicios de streming o tabletas con marca propia. Es la empresa tecnológica con un nicho de mercado más diferenciado a las otras.

Por lo que sacamos como conclusiones tanto de la regresión, la ANOVA, y la correlación, que todos están relacionados, aunque en el caso de Amazon en menor manera en relación con Apple. Por lo que en primer lugar vemos que la caída de un gigante como Apple no arrastraría a todos, a Amazon no, por ejemplo.

**ARIMA**

Una Buena herramienta para utilizar en el caso de las series temporales como la de la bolsa, puede ser el proceso ARIMA, aunque es cierto que funciona mejor cuando las series son estacionarias, en este caso aun así podemos sacar ciertos resultados gracias a R.
Para tal fin usaremos el paquete FORECAST de R, dentro del cual usaremos la función auto.arima, dejando al sistema elegir automática q ARIMA analizaremos.

```
library(forecast)

fm1=auto.arima(table0$AAPL)
p1=forecast(fm1, 260)
plot(p1, type ='l', ylab="Close AAPL", xlab="DATE")

fm2=auto.arima(table0$GOOGL)
p2=forecast(fm2, 260)
plot(p2, type ='l', ylab="Close GOOGL", xlab="DATE")

fm3=auto.arima(table0$MSFT)
p3=forecast(fm3, 260)
plot(p3, type ='l', ylab="Close MSFT", xlab="DATE")

fm4=auto.arima(table0$AMZN)
p4=forecast(fm4, 260)
plot(p4, type ='l', ylab="Close AMZN", xlab="DATE")

fm5=auto.arima(table0$FB)
p5=forecast(fm5, 260)
plot(p5, type ='l', ylab="Close FB", xlab="DATE")
```
**Análisis Grafico del ARIMA**

Usamos ARIMA 0,1,0 porque es lo que nos entrega automáticamente la función auto.arima del paquete R
La línea azul es la línea de predicción, los colores azul y gris son los intervalos de confianza. Siendo el interior (azul) el de 95% de confianza.

Todos los estudios han sido hechos a 260 días que es un año, esto debido a que la bolsa de valores cierra los fines de semana, por lo que la bolsa abre alrededor de 260 días al año.

![Imagen](https://github.com/MCerros/practica2/blob/master/3.png)

![Imagen](https://github.com/MCerros/practica2/blob/master/4.png)

![Imagen](https://github.com/MCerros/practica2/blob/master/5.png)

![Imagen](https://github.com/MCerros/practica2/blob/master/6.png)

![Imagen](https://github.com/MCerros/practica2/blob/master/7.png)

**Atención:** en los siguientes tres párrafos cuando nos referimos a tendencia, no nos referimos a la tendencia estadística que se puede calcular y graficar, sino al comportamiento de los datos.

Recordemos que la superficie azul que está dentro de una superficie rodea la es el intervalo de confianza de un 95%(la superficie azul) y nos muestra que podría hacer el valor tanto si sube como si baja. Si la tendencia es alcista, aunque el valor baje no bajara de forma peligrosa.

Como vemos todos tiene una tendencia alcista menos Apple. Por lo que a un año no tenemos peligros de una gran caída en estos valores ya que, aunque entraran en constante bajadas no mostraría grandes pérdidas. Sin embargo, el caso de Apple es diferente, en el cual la probabilidad de que suba y baje es muy similar ya que su tendencia es plana. Si nos hacemos eco de los medios en los últimos tiempos, su producto estrella, el iPhone, podría estar perdiendo cuota de mercado, por lo que no debería sorprendernos este resultado.
Entonces ¿Apple podría arrastrar al resto de valores? En principio no tanto como imaginamos, podría perder su posición, y aunque arrastraría un poco a los demás, como veíamos en el gráfico de correlación, al ser el menos correlacionado, es el valor que menos afecta.

**CONCLUSIÓN GLOBAL:**

Siempre se puede intentar predecir lo ocurrirá con los valores de bolsa, pero casi nunca se puede predecir al 100% un suceso de estas características. La bolsa puede llegar a ser muy volátil, y suele verse afectada por el panorama sociopolítico mundial. 
Aun así, sí que podemos sacar ciertas conclusiones:

•	No habrá burbuja de las tecnológicas en el 2018

•	Hay una gran probabilidad de que Apple puede desacelerarse y para fines de 2018 comenzar a perder su primer puesto, en post de Google.

•	La desaceleración de Apple no afectaría del todo al resto de valores ya que, a pesar de tener una correlación alta con el resto, no es tan alta en comparación con la que el resto tienen en tres sí.

•	Una supuesta desaceleración de Apple no afectara casi a Amazon

**Punto 6**

Todo el código de R esta ya expuesto en este documento.



          
http://economipedia.com/ranking/empresas-mas-grandes-del-mundo-2017.html 
https://es.wikipedia.org/wiki/S%26P_500
http://www.expansion.com/empresas/tecnologia/2017/07/21/5970f1a7ca47411f0b8b4599.html
https://support.minitab.com/es-mx/minitab/18/help-and-how-to/modeling-statistics/anova/supporting-topics/basics/what-is-anova/

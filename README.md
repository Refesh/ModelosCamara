# Datos
Autor: Fernando Marcelo Alonso

Asignatura: Creando Interfaces de Usuario(CIU)

## Introducción
Esta práctica es una extensión de la práctica anterior donde se intenta añadir una nave al sistema solar, dicha nave se debe de poder mover por el sistema solar y también se debe de poder cambiar la vista panorámica a una vista que se encuentre encima de la nave.

## Implementación y argumentación

Para la implementación he usado Processing 3.5.4.

<img src="readmeImages/Menu.png"
     alt="Menu"
     width="40%" />

**Camara general:** En la camra principal lo que vemos es el sistema planetario y la nave desde lejos, en la izquierda abajo tenemos algunos controles para controlar la posición de esta camara además de otras funcionalidades.

**Modelo nave:** Para el modelo de la nave cogí uno online que encontre https://www.cgtrader.com/items/869754/download-page.

**Movilidad nave:** La nave se puede mover en el eje donde se encuentran los planetas de forma libre, es decir se puede mover a la derecha izquierda y hacia a delante y atras en la dirección que este apuntando la nave. Se mueve con las flechas, esto es fácil de recordar pare el usuario además de que le será familiar, también implemente las teclas de forma que se pudiera clicar dos a la vez con lo que se puede mover mientras se gira lo que permite un movimiento circular.

**Físicas del movimiento** Para que quede un movimiento "realista" la nave al pulsar la flecha up se mueve en la dirección que este apuntando, cada vez se moverá más rápido, en cada iteración la nave también pierde un porcentaje de su velocidad por lo que cuando dejemos de acelerar se parará de forma gradual y no brusca. Esto es la inercia de la nave.

<img src="readmeImages/Figure.png"
     alt="Figure"
     width="40%" />

**Cámara 3d nave:** La cámara se ve desde encima de la nave con lo que en esta vista también se pude observar la nave, decidí por esta vista y no la vista first person por que en este caso me parece que da sensación de control, por que al ser el fondo practicamente recto con la vista first person parece que no te estas moviendo.

**Zoom in/out:** En la vista general se puede usar esta funcionalidad que nos permite acercar o alejar el sistema planetario con la rueda del ratón, esto nos permite ver en detalle el sistema o poder alejarnos para ver donde se encuentra la nave si la perdemos, aunque para eso también podríamos clicar el botón de reset de la nave. Opte por usar la rueda por que al usario le será familiar este control además de ser más sencillo de recordar.

**Cambio ángulo de visión:** En la vista general se puede girar el sistema clicando y arrastrando también se puede subir o bajar el sistema en el eje z, esto permite poder mirar el sistema desde ángulos distintos. 

**Reset:** En las dos cámaras disponibles podemos resetear la posición de la nave si por ejemplo la hemos perdido de vista o si simplemente queremos recolocarla. El reset se realiza con la tecla r.

**Cambio de cámara:** Para el cambio de cámara se usa la tecla c de change, esto cambia de una cámara a la otra.

**Anotación:** Todas las funcionalidades que se pueden usar en cada cámara se encuentra indicadas abajo a la izquierda, en el caso de la cámara de la nave al tener menos funcionalidades solo se ponen aquellas que se pueden usar cuando nos encontramos en ella.

**Salir:** Como se usa la pantalla completa se ayuda al usuario para salir de la pantalla, arriba a al izquierda se encuentra la informaciónd de como salir, sería pulsando la tecla esc.

**Adaptación resoluciones:** Para el cálculo de tamaños y distancias uso una unidad que depende del ancho de la pantalla del usuario por lo que al usar full screen, se verá igual los objetos en las distintas resoluciones, en vez de usar pixeles uso una unidad que en este caso opte por que fuera el ancho entre 150. Con lo que todos los tamaños que se usan terminan dependiendo del ancho de la pantalla con lo que distintos usuarios con distintas resoluciones verán los objetos igual.

## GIF
![Alt Text](SuperficieRevolucion.gif)

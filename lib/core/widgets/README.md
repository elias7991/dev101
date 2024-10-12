# Widgets
> Aquí encontrarás un conjunto de widgets comunes para distintos features de la aplicación que estarán organizados en función a un concepto conocido como **Atomic Design**.

## ¿Qué es Atomic Design?
Es un enfoque para diseñar componentes en donde buscamos fomentar la modularidad y la reutilziación de los mismos.

### Niveles de composición en Atomic Design

#### Átomos
Un átomo es la unidad más básica que puede existir y deben de tener **una única** función. En ella podemos encontrar componentes como botones, divisores, textos, íconos o cualquier componente elemental.

#### Moléculas
Una molécula es la unión de dos o más átomos que tabajan en conjunto para realizar una función específica. Aquí podríamos hablar de listas de textos, cards, componentes de paginación, inputs con labels, etc.

#### Organismos
Un organismo es una combinación de moléculas y/o átomos que conforman una estructura mucho más compleja como quizá formularios con campos de textos, selectores y un botón para enviar el formulario.

#### Plantillas
Una plantilla es una estructura mucho más compleja donde podemos incluir varios organismos y cualquier conjunto de componentes para formar el **esqueleto** o **wireframe** de una pantalla. Hay que tener en cuenta que un wireframe **no debe** contener datos específicos, sino que deben de ser un modelo para distintas situaciones.

#### Páginas
Éstas ya son instancias concretas de las plantillas que contienen datos reales y representan a una página completa de la aplicación.

---
**En general, con llegar al nivel de organismos o plantillas tendremos una estructuración de los componentes muy robusta y capaz de escalar.**
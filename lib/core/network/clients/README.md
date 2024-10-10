# Clients
> Aquí definimos todas las configuraciones de los clientes HTTP que vamos a utilizar en la aplicación.

El archivo *clients.dart* es sólo de exportación y el directorio *dio* contendrá todos los archivos que se requieren para la creación de un cliente Dio. Si se quiere se puede tener dentro del directorio dio tantas sub carpetas como API's tengamos para consumir (por ejemplo, si tenemos reglas distintas para consultar una API1 y otra API2 seria simplemente crearlos en este directorio como *api1_client.dart*, *api2_client.dart*, etc.).
# MercadoLibre - Examen Mobile Developers
Es importante que las respuestas las escribas con tus palabras. Si consultás alguna fuente de información porque desconoces un tema, te pedimos que por favor nos indiques cuáles son. Cualquier tipo de dudas sobre el examen, consultalas a … (mail)

Conceptos generales de programación
1. Definir que es una Clase y que es una instancia de una clase
```
Una clase es un conjunto de propiedades y funciones que representa la mayoría de las veces un objeto del mundo real. una instancia de clase es un espacio que el sistema asigna a su software para tener acceso a la información.
```
2. Explique los siguientes conceptos:
a. Herencia
```
	Es posible crear clases base que tengan comportamientos comunes a otras clases. Al crear una super clase, permite que las otras clases hereden las propiedades y comportamientos de la super clase.
```
b. Polimorfismo
```
	El polimorfismo es la capacidad de una clase de tener características comunes a otras clases, pero se comportan de forma diferente. Una clase de canguro que herede de una clase animal, puede tener un comportamiento diferente al ejecutar el método "salto", por ejemplo.
```	
c. Encapsulamiento
```
Todas las clases pueden tener sus niveles de acceso modificados de acuerdo con el encapsulado. Un método privado por ejemplo no se puede ver en otra clase que instale esta primera.
```
3. ¿Qué es un patrón de diseño?. Ejemplificar con patrones usados en la plataforma
```
El patrón de diseño representa la estructura, la arquitectura y la organización de su aplicación. El MVC es el patrón de diseño más utilizado y su origen sugiere que todos los comportamientos de su proyecto pueden ser separados de acuerdo con sus responsabilidades Modelo (Conjunto de clases que representan o no un objeto real), View (elementos visuales que los usuarios interactúan ) y Controller (medios que combinan los modelos y vistas). Existen diversos estándares y todos exigen un enfoque similar al del MVC con algunas diferencias.
```
4. ¿Qué es una interfaz?. Compare la misma con una clase abstracta
```
Una interfaz crea una firma que puede extenderse por otras clases, sus métodos no se pueden implementar en la propia interfaz sólo en las clases que implementan la interfaz. Una clase abstracta funciona como una interfaz pero puede contener métodos con cuerpos definidos, una clase abstracta se define cuando queremos mantener una estructura estándar en nuestro proyecto.
```
5. ¿Qué es un Thread? Describa brevemente qué consideraciones hay que tener cuando 2 threads acceden a un mismo recurso
```
Un subproceso es un espacio y memoria que se puede utilizar para ejecutar recursos pesados ​​o no. Muchas veces se utiliza para evitar la congelación de la interfaz. Debemos preocuparnos por la competencia cuando utilizamos o accedemos al mismo recurso en subprocesos diferentes.
```
6. ¿Qué es una Exception?, ¿cómo se puede manejar? 
```
Una excepción es un error recibido después de una ejecución dentro del programa que se ejecuta. Una forma de tratar errores es agregar las arenas seguras en el código potencialmente ofensivo conocido como try / catch.
```


Programación y Java (puede haber más de una rta correcta)
1. equals() y hashCode()
[x] a. Son equivalentes 
[ ] b. No tienen relación
[ ] c. Dos objetos iguales para equals deben tener el mismo hashcode
[ ] d. Dos objetos distintos pueden tener el mismo hashcode
[ ] e. Son fundamentales para meter objetos en un hashSet
2. Synchronized...
[x] a. Es para evitar que más de un hilo ejecute una sección del código al mismo tiempo
[ ] b. Es una palabra reservada en Java
[ ] c. Se puede usar como modificador de una variable de instancia
[ ] d. Se puede usar como modificador de un método de instancia
[ ] e. Se puede usar como modificador de una clase
[ ] f. Se puede usar para sincronizar sólo algunas líneas dentro de un método.
3. HTTP (HyperText Transfer Protocol)
[ ] a. Es un programa para navegar internet
[x] b. Es un protocolo stateless
[ ] c. Para un request solo corresponde un response
[ ] d. Permite transferir únicamente Hipertexto.
[ ] e. GET y POST Son equivalentes
[ ] f. HTTP siempre viaja encriptado para evitar que alguien pueda ver el contenido.
4. Explique qué entiende por REST y de un ejemplo
```
Una API es una forma de exponer servicios a la WEB. REST es un protocolo de transferencia que utiliza verbos para la comunicación con servidores.
```
5. Enumere tres headers de HTTP y su funcionalidad
```
Content-Type: es el formato que se utiliza para enviar la solicitud.
Accept: es el formato esperado de respuesta.
Autenticación: es un hash que permite autenticar las peticiones efectuadas al servidor.
````
6. ¿Qué son y qué diferencias hay entre un Thread (Hilo) y un Proceso ? 

[ ] a. Son sinónimos
[ ] b. Un proceso puede tener múltiples threads
[x] c. Un thread puede tener múltiples procesos
[ ] d. Los procesos no comparten espacio de memoria
[ ] e. Los threads no comparten espacio de memoria

7. ¿Cómo se logra la ejecución de más de 1 hilo en un procesador con un solo core (núcleo)?
[ ] a. No es posible
[ ] b. Se particiona el core en partes para cada hilo
[x] c. Se turnan los hilos para correr en el mismo core en espacios de tiempo pequeños. 
[ ] d. Se turnan entrando uno al terminar el trabajo del anterior.
[ ] e. Se generan nuevos cores a demanda, para cada hilo.

### Conocimientos de iOS
1. Explique detalladamente como funciona el manejo de memoria en Objective-C/iOS
```
La mora de iOS es administrada por el contador de referencias. Cada objeto asignado en memoria recibe un contactor y dependiendo de su asignación debe ser liberado de la memoria manualmente.
```
2. ¿En qué casos utilizarías objetos autoreleseados?
```
En casos donde el proceso / objeto no se reutilizará.
```
3. ¿Qué sucede cuando se envía el mensaje release a un objeto autoreleseado?
```
Nada, el ARC se encargará de llamar al autorelease.
```
4. ¿Qué sucede al acceder o llamar a un método de un objeto que fué releaseado?
```
Error de acceso a memoria, el objeto ya no está asignado
```
5. ¿Existe una forma de declarar métodos privados en una clase?
```
Sí, en Objc si el método no se declara en el encabezado .h que importar esta clase no verá los métodos. En Swift hay operadores privados.
```
6. ¿Qué es una property y que atributos puede tener en su definición?		
```
Una propiedad es un dado de una clase, puede ser del tipo primitivo como enteros y textos y también puede ser clases complejas.
````
7. ¿Qué es un protocolo (@protocol)?
```
Los protocolos son contratos que las clases que implementan deben respetar, los protocolos normalmente sólo tienen la firma de los métodos.
```
8. ¿Qué es un selector (@selector)?
```
El @selector permite referir un método como una classe. Es el concepto inicial de una estructura de programación funcional.
```
10. ¿Qué es ARC y cómo funciona?
```
ARC es un contador de referencias, siempre que una clase es instanciada su cuenta de referencia se incrementa en 1. Todos los objetos que se ejecutan sus métodos de release reducen en 1 ese mismo contador. Al alcanzar 0 el sistema libera el espacio asignado en la memoria.
```
11. Qué diferencias hay entre un xib, storyboard y un ViewController que agrega subviews con sus respectivos frames. ¿En qué casos utilizarías cada uno?
```
Una xib es un archivo que contiene la interfaz con el usuario, generalmente utilizado cuando debemos compartir la misma interfaz en diferentes pantallas. El storyboard contiene un conjunto de pantallas e interfaces que pueden auxiliar en la construcción y visualización del flujo de pantallas. Una ViewController que utiliza la creación de sus subviews vía código sería utilizada por ejemplo en componentes.
```
12. Describí e indicá el orden en el que se ejecutan los siguientes métodos:
a. viewWillDissapear 3
b. viewWillAppear 2
c. viewDidDissappear 4
d. viewDidLoad 1

### Ejercicios de código

Ejercicio A
Dada las siguientes clases (MyClass.h y MyClass.m):
 
### MyClass.h
```
#import <Foundation/Foundation.h>

@interface MyClass : NSObject {
    NSMutableArray *myArray;
}

@property(nonatomic,retain) NSMutableArray *myArray;

- (void)deleteElementVer0:(NSString *)anElement;
- (void)deleteElementVer1:(NSString *)anElement;
- (void)deleteElementVer2:(NSString *)anElement;
- (void)deleteElementVer3:(NSString *)anElement;

@end
```
### MyClass.m
```
#import "MyClass.h"
@implementation MyClass 

@synthesize myArray;

- (id)init {
    if ((self = [super init])) {
        self.myArray = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", nil];
    }
    
    return self;
}

- (void)dealloc {
    [myArray release];
    [super dealloc];
}
- (void)deleteElementVer0:(NSString *)anElement {
    
    int count = [myArray count] - 1;
    for (int i = count; i >= 0; i--) {
        NSString *myArrayElem = [myArray objectAtIndex:i];
        if (anElement == myArrayElem) {
            [myArray removeObject:myArrayElem];
        }
    }
}

- (void)deleteElementVer1:(NSString *)anElement {
    for (NSString *myArrayElem in myArray) {
        if ([anElement isEqualToString:myArrayElem]) {
            [myArray removeObject:myArrayElem];
        }
    }
}

- (void)deleteElementVer2:(NSString *)anElement {
    int count = [myArray count];
    for (int i = 0; i < count; i++) {
        NSString *myArrayElem = [myArray objectAtIndex:i];
        if ([anElement isEqualToString:myArrayElem]) {
            [myArray removeObject:myArrayElem];
        }
    }
}

- (void)deleteElementVer3:(NSString *)anElement {
    NSArray *auxArray = [myArray copy];
    for (NSString *myArrayElem in auxArray) {
        if ([anElement isEqualToString:myArrayElem]) {
            [myArray removeObject:myArrayElem];
        }
    }
}

@end
```



#### Indique que sucede luego de ejecutar los siguientes bloques de código:

1.
MyClass *myInstance = [[[MyClass alloc] init] autorelease];
[myInstance deleteElementVer0:@"B"];        
NSLog(@"%@", [myInstance.myArray description]);
``` 
testeObjective[2055:3546649] (
    A,
    C,
    D,
    E,
    F
)
```
2.
MyClass *myInstance = [[[MyClass alloc] init] autorelease];
[myInstance deleteElementVer1:@"B"];
NSLog(@"%@", [myInstance.myArray description]);
```
Terminating app due to uncaught exception 'NSGenericException', reason: '*** Collection <__NSArrayM: 0x604000254dc0> was mutated while being enumerated.'
```
3.
MyClass *myInstance = [[[MyClass alloc] init] autorelease];
[myInstance deleteElementVer2:@"B"];
NSLog(@"%@", [myInstance.myArray description]);
```
 Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayM objectAtIndex:]: index 5 beyond bounds [0 .. 4]'
````
4.
MyClass *myInstance = [[[MyClass alloc] init] autorelease];
[myInstance deleteElementVer3:@"B"];
NSLog(@"%@", [myInstance.myArray description]);
```
testeObjective[2265:3552877] (
    A,
    C,
    D,
    E,
    F
)
```
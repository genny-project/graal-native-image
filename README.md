# graal-native-image
Docker Graal native image

A big big thank you to Roy van Rijn for his excellent blog. royvanrijn.com



This docker image allows a user to compile a Java executable into Linux native code called 'app'

Example (Thanks to https://royvanrijn.com/blog/2018/09/part-1-java-to-native-using-graalvm/)

A Java example: below:

public class HelloWorld {
   public static void main(String... args) {
      System.out.println("Hello World");
   }
}

compile and run....

javac HelloWorld.java

This produces a Java executable called HelloWorld

Now normally you can generate a local native image by running the command (if you have grallvm native-image installed)
native-image -cp . HelloWorld

Now this Dockerfile allows us to create a docker image...

docker build -t genny-project/graal-native-image:latest .

Then you can create the native linux app using this command

In the example directory you can see this example

running ./build-app.sh   will build the executable linux app, then 
the Dockerfile in the example directory can be used...

docker build -t genny-project/graal-helloworld:latest .


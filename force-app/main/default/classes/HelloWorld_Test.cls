@isTest
public class HelloWorld_Test {
    @isTest
    static void testSayHello() {
        // Test with a name
        String result1 = HelloWorld.sayHello('Vyshnavi');
        System.assertEquals('Hello, Vyshnavi!', result1);

        // Test with blank
        String result2 = HelloWorld.sayHello('');
        System.assertEquals('Hello, Guest!', result2);
    }
}

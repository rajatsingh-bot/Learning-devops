public with sharing class DemoController {
    /**
     * An empty constructor for testing
     */
    public DemoController() {}

    /**
     * Set the contact for the page using the lastName parameter, if there is one
     */
    public DemoController(ApexPages.StandardController controller) {
        // Get the last name from the URL
        String lastName = ApexPages.currentPage().getParameters().get('lastName');

        if (lastName != null) {
            // Query the object
            Contact theContact = [
                SELECT Id
                FROM Contact
                WHERE LastName = :lastName
                LIMIT 1
            ];

            // This sets the Id so now you can use the standard controller
            ApexPages.currentPage().getParameters().put('id', theContact.Id);
        }
    }

    /**
     * Get the version of the SFDX demo app
     */
    public String getAppVersion() {
        return '1.0.0';
    }

    /**
     * Say hello (default version)
     */
    public String sayHello() {
        return 'Hello from DemoController!';
    }

    /**
     * Say hello with a custom message
     */
    public String sayHello(String name) {
        return 'Hello, ' + name + '! Welcome from DemoController.';
    }

    /**
     * Example inner class
     */
    public class Calculator {
        // Existing function
        public Integer add(Integer a, Integer b) {
            return a + b;
        }

        // ✅ New function to practice Git
        public Integer square(Integer number) {
            return number * number;
        }
    }
}

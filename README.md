# cuke-test
Small repo to play around with:

* cucumber-java8: https://cucumber.io/docs/installation/java/
* TestNG: https://testng.org/doc/index.html
* Google Guice: https://cucumber.io/docs/cucumber/state/#dependency-injection


# To run
* Install java 13: <code>brew cask install java</code>
* Install Maven: <code>brew install maven</code>

In a terminal run:
<code>mvn install</code>

To execute tests only, run:
<code>mvn verify</code>

Each cucumber scenario is run by the TestNG runner in a separate thread.

package parallel;

import com.google.inject.Inject;
import io.cucumber.guice.ScenarioScoped;


@ScenarioScoped
class Dependency1 {

    private Dependency2 dependency2;

    @Inject
    Dependency1(Dependency2 dependency2) {
        this.dependency2 = dependency2;
    }

    void method1() {
        dependency2.someMethod2("Hi \n");
        dependency2.someMethod2("Hello \n");
    }
}
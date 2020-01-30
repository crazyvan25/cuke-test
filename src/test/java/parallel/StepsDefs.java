package parallel;

import com.google.inject.Inject;
import io.cucumber.guice.ScenarioScoped;
import io.cucumber.java8.En;

@ScenarioScoped
public class StepsDefs implements En {

    @Inject
    private Dependency1 dep1;

    @Inject
    private IConfiguration configuration;

    public StepsDefs() {

        Given("^a step from \"([^\"]*)\" in \"([^\"]*)\" feature file$", (String scenario, String file) -> {
            System.out.format("Thread ID - %2d - from %s in file %s \n",
                    Thread.currentThread().getId(), scenario, file);
            System.out.format("%s \n", this.dep1.toString());
            System.out.println(configuration.read()[0]);
        });

    }

}

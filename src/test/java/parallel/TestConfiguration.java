package parallel;

import io.cucumber.guice.ScenarioScoped;

@ScenarioScoped
public class TestConfiguration implements IConfiguration {
    @Override
    public byte[] read() {
        return new byte[] {1, 2, 3, 4, 5};
    }

    @Override
    public void write(byte[] bytes) {

    }
}

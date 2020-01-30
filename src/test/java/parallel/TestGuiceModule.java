package parallel;

import com.google.inject.AbstractModule;

public class TestGuiceModule extends AbstractModule {
    @Override
    protected void configure() {
        bind(IConfiguration.class).to(TestConfiguration.class);
    }
}

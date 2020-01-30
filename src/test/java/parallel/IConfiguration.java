package parallel;

public interface IConfiguration {
    byte[] read();
    void write(byte[] bytes);
}

package src.dominio;

public class AproximarPi {
    public static float aproximarPi (int iteraciones, int circulos, int total) {
        double x = Math.random();
        double y = Math.random();
        if (iteraciones >= total) {
            if (Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)) < 1)
                return (aproximarPi(iteraciones, ++circulos, ++total));
            else
                return (aproximarPi(iteraciones, circulos, ++total));
        }
        else
            return (4*(float)circulos/(float)total);
    }
}

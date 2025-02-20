package GenerarTokens;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class TokenManager {
    private static Map<String, String> tokens = new HashMap<>();
    
    public static String generarToken(String email) {
        String token = String.valueOf(new Random().nextInt(900000) + 100000); // Genera un código de 6 dígitos
        tokens.put(email, token);
        return token;
    }

    public static boolean validarToken(String email, String token) {
        return tokens.containsKey(email) && tokens.get(email).equals(token);
    }

    public static void eliminarToken(String email) {
        tokens.remove(email);
    }
}

package Config;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class MailSender {
    
    public static boolean enviarCorreo(String destinatario, String asunto, String mensaje) {
        final String remitente = "tucorreo@gmail.com";  // Tu correo de Gmail
        final String clave = "xxxx xxxx xxxx xxxx";   // Tu clave de aplicación de Gmail

        Properties propiedades = new Properties();
        propiedades.put("mail.smtp.auth", "true");
        propiedades.put("mail.smtp.starttls.enable", "true");
        propiedades.put("mail.smtp.host", "smtp.gmail.com");
        propiedades.put("mail.smtp.port", "587");

        Session sesion = Session.getInstance(propiedades, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(remitente, clave);
            }
        });

        try {
            Message message = new MimeMessage(sesion);
            message.setFrom(new InternetAddress(remitente));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            message.setSubject(asunto);
            message.setContent(mensaje, "text/html; charset=utf-8");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}


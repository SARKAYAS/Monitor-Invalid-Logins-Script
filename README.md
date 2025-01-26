
# Monitor Invalid Logins Script

Bu bash scripti, sistemdeki geçersiz kullanıcı girişimlerini izlemek için tasarlanmıştır. `/var/log/auth.log` dosyasındaki "Failed password for invalid user" ifadesini arar ve ilgili girişimler hakkında detayları belirtilen e-posta adresine gönderir.

## Özellikler

- **Günlük İzleme:** `/var/log/auth.log` dosyasında belirli bir deseni arar.
- **Bildirim:** Tanımlanan desene uyan satırlar bulunduğunda, olayın ayrıntılarını içeren bir e-posta gönderir.

## Kurulum

Scripti kullanmadan önce, aşağıdaki adımları takip ederek kurulumunuzu yapılandırmanız gerekmektedir:

1. Script dosyasını istediğiniz bir dizine kopyalayın.
2. E-posta gönderimi için sistemde `mail` komutunun yapılandırılmış ve kullanıma hazır olduğundan emin olun.
3. Scripte çalıştırma izni verin:
   ```bash
   chmod +x monitor_invalid_logins.sh
   ```

## Kullanım

Scripti manuel olarak çalıştırmak için aşağıdaki komutu kullanabilirsiniz:

```bash
./monitor_invalid_logins.sh
```

Ayrıca, scripti bir cron job olarak da ayarlayabilirsiniz ki bu, belirli aralıklarla otomatik olarak çalıştırılmasını sağlar. Örneğin, her saat başı çalışması için crontab dosyanıza şu satırı ekleyebilirsiniz:

```cron
0 * * * * /path/to/monitor_invalid_logins.sh
```

## Yapılandırma

Script içerisindeki bazı değişkenleri kendi ihtiyaçlarınıza göre düzenleyebilirsiniz:

- `LOGFILE`: Log dosyasının yolu.
- `PATTERN`: Aranacak desen.
- `RECIPIENT`: Bildirim e-postasının gönderileceği adres.
- `SUBJECT`: E-posta konu satırı.

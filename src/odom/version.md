# NOTES

## todo

- RPM ve ticksi array olarak tanımla
- transform rad-deg, terimsel yaz
- yaw fix yaz 34 deg = -606 deg??

---

### v1
- Pose, rpm ve ticks callbackleri eklendi

---

### v2 
- Teker hızı, teker açısal hızı ve ticks'ten gelen RPM hesabı eklendi
- Veri eksiği var, hocanın yanıtına göre düzenlenecek

---

### v3 
- RPM hesabı cmd_velden alınacak şekilde düzeltildi, sonuçlar yakın, TPR değeri unknown (approx 120)
- RPM mesajı oluşturuldu, wheels_rpm ve cmd_vel publisherları eklendi
- TF Broadcaster hem gerçek hem de hesaplanan odometri için
eklendi
- Kodlar ayrıldı, launch dosyası eklendi, rviz config eklendi
- Euler ve RK odometrileri diff.drive'a göre yazıldı, kaynak kitaba göre tekrar incelenecek!!!
- Odometride sonuçlar yakın ama baglerde donma var, veri akışı
incelenecek!!!

---

### v4
- Reset service eklendi

---

### v5
- Omnidirectional kinematiği eklendi
- Ticks datadan hız hesabı düzeltildi
- Verilerin init değerleri eklendi
- Wheel radius 0.075e ayarlandı
- Printler silinip sadece error bilgisi basıldı

---

### v6
- RPM kullanan hız hesabı eklendi (rad/min)
- Odometri ve rpm/ticks methodları için dynamic reconfiguration eklendi
- parameters.cfg eklendi
- Rviz configürasyonu değiştirildi
- Dynamic reconfiguration otomatik açılması için launch dosyasına eklendi

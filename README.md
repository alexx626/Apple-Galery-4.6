# AleXx626 (Flutter)
Splash animat 2s + home mock. Gata pentru Codemagic → `.ipa` → instalare cu Sideloadly.

## Pași
1. Pune imaginea ta în `assets/splash.jpg`.  
2. `pubspec.yaml` are deja assets configurat.  
3. Fă un repo pe GitHub și urcă toate fișierele.  
4. În Codemagic: Connect → selectezi repo → **Use codemagic.yaml from repository** → workflow `iOS IPA (no codesign)` → Start build.  
5. Descarci `.ipa` din Artifacts.  
6. Deschizi **Sideloadly** pe Windows → tragi `.ipa` → introduci Apple ID → *Trust* profilul în iPhone (Settings → General → VPN & Device Management).

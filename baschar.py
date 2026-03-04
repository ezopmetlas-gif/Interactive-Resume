"""
================================================================================
Kurzanleitung für HR- und Recruiting-Experten / Quick Guide for HR:

🇬🇧 EN: Download this file, change the extension to .py, and run it in your terminal.
🇩🇪 DE: Laden Sie diese Datei herunter, ändern Sie die Endung in .py und führen Sie 
       sie im Terminal aus, um das interaktive Profil zu starten.
================================================================================
FILE: baschar_songoer_cv.py
FORMAT: ENCRYPTED DASHBOARD
AUTHOR: Başar Songör
================================================================================
"""

import time
import sys
import webbrowser
import os

# Windows terminallerinde renklerin çalışması için
os.system("")

class CandidateProfile:
    def __init__(self):
        self.identity = "Başar Songör"
        self.role = "System Architect & Mobile Developer"
        self.background = "Telecommunications (Fiber Optics) & App Development"
        self.technical_stack = ["Kotlin", "Java", "Dart (Flutter)", "Python", "Rust"]
        self.specialties = ["Stress Testing", "Logic Evaluation", "Technical SEO", "Deep Linking"]
        self.mission = "Bridging the gap between fiber-optic precision and high-level software logic."
        self.linkedin_url = "https://www.linkedin.com/in/başar-songör-3b582524b"

    def type_text(self, text, delay=0.02, color="\033[92m"):
        for char in text:
            sys.stdout.write(f"{color}{char}\033[0m")
            sys.stdout.flush()
            time.sleep(delay)
        print()

    def trigger_dashboard(self):
        os.system('cls' if os.name == 'nt' else 'clear')
        
        cyan, green, yellow, reset, bold = "\033[96m", "\033[92m", "\033[93m", "\033[0m", "\033[1m"
        
        ascii_art = f"""{cyan}{bold}
  ____                           _____                            
 |  _ \                         / ____|                           
 | |_) | __ _ ___  __ _ _ __   | (___   ___  _ __   __ _  ___  _ __ 
 |  _ < / _` / __|/ _` | '__|   \___ \ / _ \| '_ \ / _` |/ _ \| '__|
 | |_) | (_| \__ \ (_| | |      ____) | (_) | | | | (_| | (_) | |   
 |____/ \__,_|___/\__,_|_|     |_____/ \___/|_| |_|\__, |\___/|_|   
                                                    __/ |         
                                                   |___/          
>> {self.role.upper()} <<
{reset}"""
        print(ascii_art)
        
        self.type_text("[*] Initiating secure boot sequence...", 0.04, yellow)
        time.sleep(0.3)
        self.type_text("[*] Decrypting profile data...", 0.04, yellow)
        time.sleep(0.5)

        print(f"\n{cyan}╔════════════════════════ CANDIDATE DASHBOARD ════════════════════════╗{reset}")
        self.type_text(f"║ IDENTITY     : {self.identity}", color=green)
        self.type_text(f"║ INDUSTRY     : {self.background}", color=green)
        self.type_text(f"║ TECH STACK   : {' | '.join(self.technical_stack)}", color=green)
        self.type_text(f"║ EXPERTISE    : {' | '.join(self.specialties)}", color=green)
        self.type_text(f"║ MISSION      : {self.mission}", color=green)
        print(f"{cyan}╚═════════════════════════════════════════════════════════════════════╝{reset}\n")
        time.sleep(0.5)

    def interact(self):
        self.trigger_dashboard()
        yellow, reset = "\033[93m", "\033[0m"
        
        try:
            user_input = input(f"{yellow}>> Would you like to connect on LinkedIn? (Y/N): {reset}").strip().lower()
            if user_input == 'y':
                self.type_text("\n[*] Portlar açılıyor / Opening ports...", 0.03, "\033[96m")
                self.type_text("[*] Güvenli ağa yönlendiriliyorsunuz / Redirecting to secure network...", 0.03, "\033[92m")
                time.sleep(1)
                webbrowser.open(self.linkedin_url)
            else:
                self.type_text("\n[SYSTEM] Connection aborted. Thank you for reviewing the source code. Have a great day!", 0.03, "\033[91m")
        except KeyboardInterrupt:
            print("\n\033[91m[!] Process terminated by user.\033[0m")

if __name__ == "__main__":
    profile = CandidateProfile()
    profile.interact()

# ==============================================================================
# INSTRUCTIONS: 
# 1. Rename this file from '.txt' to '.py'
# 2. Run it using: python basar_songor_cv.py
# ==============================================================================

import webbrowser
import time
import sys

class CandidateProfile:
    """
    Candidate Profile for Alignerr - AI Training & Code Evaluation
    """
    def __init__(self):
        self.name = "Başar Songör"
        self.role = "Software Developer & Technical Specialist"
        self.location = "Germany"
        self.background = "Telecommunications (Fiber Optics) & App Development"
        self.linkedin_url = "https://www.linkedin.com/in/başar-songör-3b582524b?utm_source=share_via&utm_content=profile&utm_medium=member_android"

    def get_technical_stack(self):
        return {
            "Languages": ["Kotlin", "Java", "Dart (Flutter)", "Python (Basic/Scripting)"],
            "Specialties": ["Stress Testing", "Debugging", "Error Handling", "App Planning"],
            "Modern Web/Growth": ["Technical SEO", "Deep Linking", "Content Architecture"]
        }

    def print_animated_summary(self):
        header = f"--- {self.name.upper()} | {self.role} ---"
        print("\n" + "=" * len(header))
        print(header)
        print("=" * len(header) + "\n")
        
        print(f"[Location]: {self.location}")
        print(f"[Industry]: {self.background}")
        print("\n[CORE COMPETENCIES]")
        
        for category, skills in self.get_technical_stack().items():
            print(f"  > {category:18}: {', '.join(skills)}")
            time.sleep(0.2)
            
        print("\n[MISSION STATEMENT]")
        print("  'Bridging the gap between fiber-optic precision and high-level software logic.'")
        print("-" * 60)

    def open_portfolio(self):
        print("\n[SYSTEM]: Connection to professional profile initiated...")
        time.sleep(1)
        print("[SYSTEM]: Redirecting to LinkedIn...")
        webbrowser.open(self.linkedin_url)

def main():
    candidate = CandidateProfile()
    
    # Terminal çıktısını göster
    candidate.print_animated_summary()
    
    # Etkileşim kısmı
    try:
        user_input = input("\nWould you like to view the full CV on LinkedIn? (Y/N): ").strip().lower()
        if user_input == 'y':
            candidate.open_portfolio()
        else:
            print("\nThank you for reviewing the source code. Have a great day!")
    except KeyboardInterrupt:
        print("\nProcess terminated.")

if __name__ == "__main__":
    main()

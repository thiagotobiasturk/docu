import pyautogui
import time


time.sleep(2)


screenshot = pyautogui.screenshot()
screenshot.save("captura.png")

print("Captura de pantalla sobrescrita como captura.png")


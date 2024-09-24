CODE INITLF1
    import RPi.GPIO as GPIO     
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)
    capteur1 = 16 # jaune
    GPIO.setup(capteur1, GPIO.IN)
    etat1 = GPIO.input(capteur1)
    dpush(etat1)
END-CODE


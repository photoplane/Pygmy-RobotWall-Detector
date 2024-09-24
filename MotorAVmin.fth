CODE MOTORAVMIN    
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)

    GPIO.setup(11, GPIO.OUT)
    GPIO.setup(13, GPIO.OUT)
    GPIO.setup(7, GPIO.OUT)
    GPIO.setup(8, GPIO.OUT)
    GPIO.setup(10, GPIO.OUT)
    GPIO.setup(12, GPIO.OUT)

    pw0=GPIO.PWM(7,100)
    pw1=GPIO.PWM(12,100)
    pw0.start(0)
    pw1.start(0)

    GPIO.output(11, True)
    GPIO.output(13, False)
    pw0.ChangeDutyCycle(21)
    GPIO.output(7, True)
    GPIO.output(8, True)
    GPIO.output(10, False)
    pw1.ChangeDutyCycle(25)
    GPIO.output(12, True)
    sleep(.1)

    

    GPIO.output(7, False)
    GPIO.output(12, False)
    pw0.stop()
    pw1.stop()

    GPIO.cleanup()
END-CODE

CODE TURNG90
    import RPi.GPIO as GPIO
    from time import sleep
    GPIO.setmode(GPIO.BOARD)

    GPIO.setup(11, GPIO.OUT)
    GPIO.setup(13, GPIO.OUT)
    GPIO.setup(7, GPIO.OUT)
    GPIO.setup(8, GPIO.OUT)
    GPIO.setup(10, GPIO.OUT)
    GPIO.setup(12, GPIO.OUT)

    p=GPIO.PWM(7,100)
    p1=GPIO.PWM(12,100)
    p.start(0)
    p1.start(0)

    GPIO.output(7, False)
    GPIO.output(11, False)
    GPIO.output(13, True)
    p.ChangeDutyCycle(50)
    GPIO.output(7, True)
    GPIO.output(12, False)
    GPIO.output(8, True)
    GPIO.output(10, False)
    p1.ChangeDutyCycle(50)
    GPIO.output(12, True)
    sleep(.03)

    GPIO.output(7, False)
    GPIO.output(12, False)
    p.stop()
    p1.stop()

    GPIO.cleanup()
END-CODE

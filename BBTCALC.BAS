
DO
CLS
PRINT "BROADBAND RF IMPENDANCE MATCHING TRANSFORMER CALCULATOR"
PRINT ""
PRINT "                   Z IN ---3 || E---Z OUT"
PRINT "                           3 || E"
PRINT "                           3 || E"
PRINT "                           |    |"
PRINT "                           G    G"
PRINT ""
PRINT ""
INPUT "ENTER Z-IN (OHMS):", ZIN
INPUT "ENTER Z-OUT (OHMS):", ZOUT
INPUT "ENTER FREQUENCY OF OPERATION (KHZ):", FOP

CLS
PRINT "1. FT23-43       2. FT37-43       3. FT43-2401   4. FT50-43"
PRINT "5. FT82-43       6. FT37-61       7. FT50-61     8. FT82-61"

INPUT "PLEASE SELECT TORIODAL CORE (1-8) OR ENTER 0 TO INPUT CUSTOM AL VALUE:", CORE
SELECT CASE CORE
        CASE 0
                INPUT "ENTER AL VALUE:", AL
        CASE 1
                AL = 158
        CASE 2
                AL = 350
        CASE 3
                AL = 400
        CASE 4
                AL = 440
        CASE 5
                AL = 470
        CASE 6
                AL = 55
        CASE 7
                AL = 69
        CASE 8
                AL = 79
END SELECT

IF ZIN > ZOUT THEN                 'DETERMINE IF MATCHING FROM LOW TO HIGH
        ZNUM = ZIN
        ZDEN = ZOUT                'OR HIGH TO LOW. SETS VARIABLES FOR DIVISION
                    
ELSE
        ZDEN = ZIN
        ZNUM = ZOUT
END IF

TURNSRATIO = SQR(ZNUM / ZDEN)

CLS
PRINT ""
PRINT "             "; ZIN; "OHMS              "; ZOUT; "OHMS"
PRINT "                   Z IN ---3 || E---Z OUT"
PRINT "                           3 || E"
PRINT "                           3 || E"
PRINT "                           |    |"
PRINT "                           G    G"
PRINT ""
PRINT ""
PRINT "TURNS RATIOS"

FOR I = 1 TO 20
        RATIOMULTIPLE = (TURNSRATIO * I)
        L = ((AL * I ^ 2) / 1000000000)
        XL = 2 * 3.14159 * (FOP * 1000) * L
        IF XL >= (4 * ZDEN) THEN
                COLOR 10, 0
                PRINT RATIOMULTIPLE; "/"; I
        ELSE
                COLOR 7, 0
                PRINT RATIOMULTIPLE; "/"; I
       END IF

NEXT I
COLOR 7, 0
INPUT "WOULD YOU LIKE TO REPEAT? (Y/N)", REPEAT$
LOOP UNTIL UCASE$(REPEAT$) = "N"
END


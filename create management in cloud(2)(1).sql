--connected as ADMIN on your TPS database, create the user called management
--DROP USER management cascade;
CREATE USER management
    IDENTIFIED BY Mustbe12bytes; -- the password must satisfy specific requirements

GRANT UNLIMITED TABLESPACE TO management; -- allocate as much space that is needed!

GRANT CONNECT, RESOURCE TO management;
/*UNLIMITED TABLESPACE allocates as much space as needed. 
This is a system privilege. */
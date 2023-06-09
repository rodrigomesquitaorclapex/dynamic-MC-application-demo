  CREATE TABLE "MEMBERSHIP_CARD" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"EXPIRATION_DATE" DATE, 
	"COUNTRY" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"MIMETYPE" VARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"FILENAME" VARCHAR2(500) COLLATE "USING_NLS_COMP", 
	"IMAGE_FILE" BLOB, 
	"QR_CODE" CLOB COLLATE "USING_NLS_COMP", 
	 CONSTRAINT "MEMBERSHIP_CARD_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "BI_MEMBERSHIP_CARD" 
  before insert on "MEMBERSHIP_CARD"               
  for each row  
begin   
  if :NEW."ID" is null then 
    select "MEMBERSHIP_CARD_SEQ".nextval into :NEW."ID" from sys.dual; 
  end if; 
end;

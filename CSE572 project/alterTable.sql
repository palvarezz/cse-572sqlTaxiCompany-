-- CALIFORNIA STATE UNIVERSITY, SAN BERNARDINO
-- DEPARTMENT OF COMPUTER SCIENCE
-- Course: CSE572
-- Student Names: Phillip Nahhas, Paul Alvarez
--
-- FASTCABS DATABASE PROJECT
-- ALTERING TABLE ADDING CONSTRAINTS

SET CONSTRAINTS ALL DEFERRED;

ALTER TABLE Staff
    ADD CONSTRAINTS Staff_sex_check  CHECK(sex IN('F','M'));

ALTER TABLE Staffdetails
	ADD CONSTRAINTS Staffdetails_staffID_FK FOREIGN KEY (staffID) REFERENCES Staff(staffID)
	ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Staffdetails
	ADD CONSTRAINTS Staffdetails_officeNo_FK FOREIGN KEY (officeNo) REFERENCES Office(officeNo)
	ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ClientPrivate
	ADD CONSTRAINTS ClientPrivate_officeNo_FK FOREIGN KEY(officeNo) REFERENCES Office(officeNo)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;
 
ALTER TABLE ClientBusiness
	ADD CONSTRAINTS ClientBusiness_officeNo_FK FOREIGN KEY(officeNo) REFERENCES Office(officeNo)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;
       
ALTER TABLE Staff
    ADD CONSTRAINTS Staff_officeNo_FK FOREIGN KEY(officeNo) REFERENCES Office(officeNo)
        ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Job
	ADD CONSTRAINTS Job_TaxiID_FK FOREIGN KEY(taxiID) REFERENCES Taxi(TaxiID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;
    
ALTER TABLE Job
	ADD CONSTRAINTS Job_clientID_FK FOREIGN KEY(ClientID) REFERENCES ClientPrivate(ClientID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;  

ALTER TABLE Job
	ADD CONSTRAINTS Job_contractNo_FK FOREIGN KEY(contractNo) REFERENCES Contract(contractNo)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 
    
ALTER TABLE Job
	ADD CONSTRAINTS Job_StaffID_FK FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 
    
ALTER TABLE Contract
	ADD CONSTRAINTS Contract_OfficeNo_FK FOREIGN KEY(officeNo) REFERENCES Office(officeNo)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 
 
 ALTER TABLE Contract
	ADD CONSTRAINTS Contract_ClientID_FK FOREIGN KEY(ClientID) REFERENCES ClientBusiness(ClientID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 
    
ALTER TABLE Allocated
	ADD CONSTRAINTS Allocated_TaxiID_FK FOREIGN KEY(TaxiID) REFERENCES Taxi(TaxiID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 
    
ALTER TABLE Allocated
	ADD CONSTRAINTS Allocated_StaffID_FK FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 
    
ALTER TABLE Taxi
	ADD CONSTRAINTS Taxi_StaffID_FK FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 


SET CONSTRAINTS ALL IMMEDIATE;

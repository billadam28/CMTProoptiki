package CMTPersistence;
// Generated Apr 29, 2017 4:03:27 PM by Hibernate Tools 4.3.1



/**
 * UserType generated by hbm2java
 */
public class UserType  implements java.io.Serializable {


     private Integer id;
     private String usrType;

    public UserType() {
    }

    public UserType(String usrType) {
       this.usrType = usrType;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getUsrType() {
        return this.usrType;
    }
    
    public void setUsrType(String usrType) {
        this.usrType = usrType;
    }




}




public class LoadOracleScript {
    public static void main(String[] args) {

        RunSQLScript createUserScript = new RunSQLScript("resources/create-user-scott_oracle.sql", "resources/oracle-system.properties");

        if (!createUserScript.run()) System.out.println("ERROR: Oracle user scott problems");
        else {
            RunSQLScript myScript = new RunSQLScript("resources/tables-dept-emp_oracle.sql", "resources/oracle-scott.properties");
            if (!myScript.run()) System.out.println("ERROR");
        }
    }
}

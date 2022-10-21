package PasswordPack;

import Tables.Author.ConnectorDB;

import java.sql.* ;
import java.sql.Statement;
import java.util.ArrayList;

public class PasswordDAO {

    private ArrayList<Password> passwords = new ArrayList<>();

    public void getPassWord () throws SQLException {
        ConnectorDB connect = new ConnectorDB();
        Statement stm = connect.connectDB().createStatement();
        ResultSet resultSet = stm.executeQuery("select * from password");

        while (resultSet.next()){
            Password password = new Password();
            password.setPasswordID(resultSet.getInt(1));
            password.setPassword(resultSet.getString(2));
            passwords.add(password);
        }
        connect.connectDB().close();
        stm.close();

    }

    public void updatePassword(Password password)throws SQLException{
        ConnectorDB connect = new ConnectorDB();
        Statement stm = connect.connectDB().createStatement();

        String newPassword = password.getPassword();
        String query = "update password set password = " + "'" + newPassword + "'";
        stm.executeUpdate(query);


    }
    public ArrayList<Password> getPasswords() {
        return passwords;
    }
}

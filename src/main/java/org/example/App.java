package org.example;

import java.sql.*;

/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args )
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_ordering","root","pass@word1");

            Statement s = c.createStatement();

            ResultSet res= s.executeQuery("select * from restaurant r join menu m on r.menu_id = m.menu_id join food i on m.food_id= i.food_id ");
            //ResultSet res = s.executeQuery("select * from restaurant");
            while (res.next()){
                System.out.println(res.getString(4) +" "+ res.getString(3)+" "+res.getInt(2));
            }

            ResultSet orderData =  s.executeQuery("select * from food_ordering.order where customer_id=2");
            while(orderData.next()){
                System.out.println(orderData.getInt(1) + " "+ orderData.getDate(2));
            }

            ResultSet nearbyRest = s.executeQuery(" select * from restaurant r join customers c on c.location = r.location where  c.customer_name='Don Sagar' ");
            while(nearbyRest.next()) {
                System.out.println(nearbyRest.getString(4) + " " + nearbyRest.getString(3) + " " + nearbyRest.getInt(2));
            }


        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
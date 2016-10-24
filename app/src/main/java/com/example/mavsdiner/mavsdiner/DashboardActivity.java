package com.example.mavsdiner.mavsdiner;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.graphics.Paint;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class DashboardActivity extends AppCompatActivity {

    TextView textViewMsg;
    RequestQueue requestQueue;
    NotificationManager manager;
    Notification myNotification;
    String order_id, status, restaurant_id, restaurant_name, customer_id, food_item_name, quantity ;
    public String contentText,subText, m_order_id;
    int mStatus ;

    UserLocalStore userLocalStore;
    private String url ="http://omega.uta.edu/~sxr5833/getUserName.php";
    private String url1 ="http://omega.uta.edu/~mxf6133/isComplete.php";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);

        TextView textViewMsg= (TextView)findViewById(R.id.textViewMsg);
        requestQueue = Volley.newRequestQueue(getApplicationContext());
        manager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);

        textViewMsg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                JsonArrayRequest request= new JsonArrayRequest(url, new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {

                        for (int i = 0; i < response.length(); i++) {

                            try {
                                JSONObject jsonObject = response.getJSONObject(i);
                                order_id = jsonObject.getString("order_id");
                                status = jsonObject.getString("status");
                                restaurant_id = jsonObject.getString("restaurant_id");
                                restaurant_name = jsonObject.getString("restaurant_name");
                                customer_id = jsonObject.getString("customer_id");
                                food_item_name = jsonObject.getString("food_item_name");
                                quantity = jsonObject.getString("quantity");
                                contentText= order_id+"| "+ restaurant_name;
                                mStatus= Integer.parseInt(status);
                                m_order_id= order_id;

                                if(i>1) {
                                    subText = subText + " "+food_item_name + "(" + quantity + ") ";
                                }
                                else{
                                    subText = food_item_name + "(" + quantity + ") ";
                                }

                                Toast.makeText(getApplicationContext(), "status:"+status+"Order id:"+order_id, Toast.LENGTH_LONG).show();

                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                },new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        VolleyLog.d("ModifyRestaurantStatus",error.getMessage());
                    }
                });
                AppController.getmInstance().addToRequestQueue(request);

                if(mStatus == 0) {

                    //for(int ii=0;ii<2;ii++) {
                    Intent i = new Intent(getApplicationContext(), DashboardActivity.class);

                    PendingIntent pendingIntent = PendingIntent.getActivity(DashboardActivity.this, 1, i, 0);

                    Notification.Builder builder = new Notification.Builder(DashboardActivity.this);

                    builder.setAutoCancel(false);
                    builder.setTicker("MavsDiner Order");
                    builder.setContentTitle("Your Order is ready!");

                    builder.setContentText("Order Id: 1000");
                    //builder.setContentText(contentText);
                    builder.setSmallIcon(R.drawable.mavsdinericon);
                    builder.setContentIntent(pendingIntent);
                    builder.setOngoing(true);
                    //builder.setSubText("Cheese Burger(2), Fries(1)");
                    builder.setSubText("Texadelphia");
                    //builder.setSubText(subText);
                    //builder.setNumber(3);
                    builder.build();
                    builder.setAutoCancel(true);
                    myNotification = builder.getNotification();
                    manager.notify(11, myNotification);

                }
                else{
                    //Toast.makeText(getApplicationContext(), "No Order completed yet", Toast.LENGTH_LONG).show();
                }

            }
        });

        TextView listRestaurant = (TextView) findViewById(R.id.textViewListRestaurant);
        listRestaurant.setPaintFlags(listRestaurant.getPaintFlags() | Paint.UNDERLINE_TEXT_FLAG);
        listRestaurant.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(DashboardActivity.this, RestaurantList.class));
            }
        });

        TextView mapRestaurnt = (TextView) findViewById(R.id.textViewMapRestaurant);
        mapRestaurnt.setPaintFlags(mapRestaurnt.getPaintFlags() |   Paint.UNDERLINE_TEXT_FLAG);
        mapRestaurnt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(DashboardActivity.this, MapsActivity2.class));
            }
        });

        userLocalStore = new UserLocalStore(this);

        User logUser = new User();
        logUser = userLocalStore.getLoggedInUser();
        final int userID = logUser.customer_id;

        StringRequest strReq = new StringRequest(Request.Method.POST,
                url, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonObject = new JSONObject(response.substring(response.indexOf('{'), response.lastIndexOf('}') + 1));
                    String firstName = jsonObject.getString("first_name");

                    TextView txtViewName = (TextView)findViewById(R.id.textViewMsg);
                    txtViewName.setText("Welcome "+firstName);
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d("Error: " + error.getMessage());
            }
        })
        {
            @Override
            protected Map<String,String> getParams() throws AuthFailureError {
                Map<String,String> parameters =new HashMap<String, String>();
                parameters.put("customer_id", Integer.toString(userID));
                return parameters;
            }
        };
        // Adding request to request queue
        AppController.getmInstance().addToRequestQueue(strReq);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main, menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            // action with ID Logout was selected
            case R.id.Logout:
                userLocalStore.clearUserData();
                userLocalStore.setUserLoggedIn(false);
                startActivity(new Intent(DashboardActivity.this, MainActivity.class));
                break;
            case R.id.ViewCart:
                startActivity(new Intent(DashboardActivity.this, CartActivity.class));
                break;
            default:
                break;
        }

        return true;
    }
}

package com.example.driver_distraction_detecting_system;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class Add_emergency extends AppCompatActivity implements JsonResponse{

    ListView l1;


    String[]  emergencies_id,emerstatus,date_time;

    SharedPreferences sh;





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_emergency);


        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

        l1=(ListView) findViewById(R.id.viewstatus);

        JsonReq JR = new JsonReq();
        JR.json_response = (JsonResponse) Add_emergency.this;
        String q = "/viewstatus?loginid=" + sh.getString("log_id","");
        q = q.replace(" ", "%20");
        JR.execute(q);


    }


    @Override
    public void response(JSONObject jo) {
        try {


            String status= jo.getString("status");
            String method= jo.getString("method");
            if (method.equalsIgnoreCase("viewstatus"))
            {

                if (status.equalsIgnoreCase("success")){

                    JSONArray ja=(JSONArray)jo.getJSONArray("data");
                    emergencies_id=new String[ja.length()];
                    emerstatus = new String[ja.length()];
                    date_time= new String[ja.length()];

                    for (int i=0;i<ja.length();i++){
                        emergencies_id[i]=ja.getJSONObject(i).getString("emergencies_id");
                        emerstatus[i]=ja.getJSONObject(i).getString("status");
                        date_time[i]=ja.getJSONObject(i).getString("date_time");

                        date_time[i]="Status:" + emerstatus[i] + "\nDate and Time:" + date_time[i];

                    }

                    ArrayAdapter<String> ar = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1,date_time);
                    l1.setAdapter(ar);

                }

            }
            else {
                Toast.makeText(this, "NO MESSAGES", Toast.LENGTH_SHORT).show();
            }


        } catch (Exception e) {
            Toast.makeText(getApplicationContext(),e.toString(), Toast.LENGTH_SHORT).show();

        }


    }
}

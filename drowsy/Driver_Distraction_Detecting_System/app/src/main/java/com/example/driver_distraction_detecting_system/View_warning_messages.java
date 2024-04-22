package com.example.driver_distraction_detecting_system;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

public class View_warning_messages extends AppCompatActivity implements JsonResponse {

    ListView l1;

    SharedPreferences sh;

    String[] mid,des,datetime,stat;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_warning_messages);

        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        l1=(ListView) findViewById(R.id.listview);

        JsonReq JR = new JsonReq();
        JR.json_response = (JsonResponse) View_warning_messages.this;
        String q = "/viewmessg?logid="+ sh.getString("log_id","");
        q = q.replace(" ", "%20");
        JR.execute(q);

    }

    @Override
    public void response(JSONObject jo) {
        // TODO Auto-generated method stub
        try{
            String status=jo.getString("status");
            String method=jo.getString("method");
            if(method.equalsIgnoreCase("viewmessages"))
            {
                if(status.equalsIgnoreCase("success"))
                {
                    JSONArray ja=(JSONArray)jo.getJSONArray("data");
                    mid=new String[ja.length()];
                    des= new String[ja.length()];
                    datetime=new String[ja.length()];
                    stat = new String[ja.length()];
                    for(int i=0;i<ja.length();i++)
                    {
                        mid[i]=ja.getJSONObject(i).getString("message_id");
                        des[i]=ja.getJSONObject(i).getString("description");
                        datetime[i]=ja.getJSONObject(i).getString("datetime");

                        stat[i]="\nDATE&TIME:"+datetime[i]+"\nDESCRIPTION:"+des[i];
                    }
                    ArrayAdapter<String> ar = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1,stat);
                    l1.setAdapter(ar);
                }
                else
                {
                    Toast.makeText(getApplicationContext(), "No messages", Toast.LENGTH_LONG).show();
                }
            }

        }
        catch(Exception e){
            e.printStackTrace();
            Toast.makeText(getApplicationContext(), "exp : "+e, Toast.LENGTH_LONG).show();
        }
    }



}

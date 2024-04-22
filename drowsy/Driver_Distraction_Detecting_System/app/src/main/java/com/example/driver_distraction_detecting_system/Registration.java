package com.example.driver_distraction_detecting_system;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONObject;


public class Registration extends AppCompatActivity implements JsonResponse {
    EditText e1,e2,e3,e4,e5,e6,e7;

    Button regbtn;

    String fname,lname,vno,phone,mail,uname,pass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);


        Drawable errorIcon = getResources().getDrawable(R.drawable.drivinglogo);

        e1=(EditText) findViewById(R.id.regfname);
        e2=(EditText) findViewById(R.id.reglname);
        e3=(EditText) findViewById(R.id.regvnumber);
        e4=(EditText) findViewById(R.id.regphone);
        e5=(EditText) findViewById(R.id.regemail);
        e6=(EditText) findViewById(R.id.reguname);
        e7=(EditText) findViewById(R.id.regpwd);
        regbtn=(Button) findViewById(R.id.regbutton);
        regbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                fname=e1.getText().toString();
                lname=e2.getText().toString();
                vno=e3.getText().toString();
                phone=e4.getText().toString();
                mail=e5.getText().toString();
                uname=e6.getText().toString();
                pass=e7.getText().toString();

                if (fname.equalsIgnoreCase("")){
                    e1.setError("enter the first name",errorIcon);
                    e1.setFocusable(true);
                    
                } else if (lname.equalsIgnoreCase("")) {
                    e2.setError("enter the last name");
                    e2.setFocusable(true);
                    
                } else if (vno.equalsIgnoreCase("")) {
                    e3.setError("enter the vechicle number");
                    e3.setFocusable(true);
                    
                } else if (phone.equalsIgnoreCase("")) {
                    e4.setError("enter the phone number");
                    e4.setFocusable(true);

                } else if (mail.equalsIgnoreCase("")) {
                    e5.setError("enter the email");
                    e5.setFocusable(true);

                } else if (uname.equalsIgnoreCase("")) {
                    e6.setError("enter the user name");
                    e6.setFocusable(true);

                } else if (pass.equalsIgnoreCase("")) {
                    e7.setError("enter the password");
                    e7.setFocusable(true);

                }else {
                    JsonReq JR = new JsonReq();
                    JR.json_response = (JsonResponse) Registration.this;
                    String q = "/userreg?fname=" + fname + "&lname=" + lname + "&vno=" + vno + "&phone=" + phone + "&mail=" + mail  + "&latitude=" + LocationService.lati + "&longitude=" + LocationService.logi  + "&uname=" + uname + "&pwd=" + pass;
                    q = q.replace(" ", "%20");
                    JR.execute(q);
                }
            }
        });
    }

    @Override
    public void response(JSONObject jo) {
        try {

            String status = jo.getString("status");
            Log.d("pearl", status);

            if (status.equalsIgnoreCase("success")) {

                Toast.makeText(getApplicationContext(), "Registration Succesfull", Toast.LENGTH_LONG).show();
                startActivity(new Intent(getApplicationContext(),Login.class));

            }

        }

        catch (Exception e) {
            // TODO: handle exception

            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
        }

    }

    public void onBackPressed()
    {
        // TODO Auto-generated method stub
        super.onBackPressed();
        Intent b=new Intent(getApplicationContext(),Login.class);
        startActivity(b);
    }


}
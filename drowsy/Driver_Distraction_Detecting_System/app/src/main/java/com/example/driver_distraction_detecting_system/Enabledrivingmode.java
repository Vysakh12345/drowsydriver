package com.example.driver_distraction_detecting_system;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.sqlite.SQLiteDatabase;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.telephony.SmsManager;
import android.view.Menu;
import android.view.View;
import android.widget.Toast;
import android.widget.ToggleButton;

import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class Enabledrivingmode extends AppCompatActivity implements JsonResponse {


    ToggleButton toggleButton1;

    String val;

    SharedPreferences sh;

    private SensorManager mSensorManager;

    private Sensor mAccelerometer;

    private ShakeDetector mShakeDetector;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_enabledrivingmode);

        mSensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        mAccelerometer = mSensorManager
                .getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        mShakeDetector = new ShakeDetector();

        mShakeDetector.setOnShakeListener(new ShakeDetector.OnShakeListener() {
            @Override
            public void onShake(int count) {

                if(count>2)

                {
                    if(sh.getString("drivemode", "").equalsIgnoreCase("ON"))
                    {
//                        SmsManager sms = SmsManager.getDefault();
//                        sms.sendTextMessage("9400772704", null, "An accident Occured at the location, http://www.google.com/maps?q=" + LocationService.lati + "," + LocationService.logi, null, null);
//                        sms.sendTextMessage("8594081643", null, "An accident Occured at the location, http://www.google.com/maps?q=" + LocationService.lati + "," + LocationService.logi, null, null);
                        Toast.makeText(getApplicationContext(), "Accident Detected and  Message is sent", Toast.LENGTH_LONG).show();

//                        try {
//                            SQLiteDatabase sqd=openOrCreateDatabase("drowsy", SQLiteDatabase.CREATE_IF_NECESSARY,null);
//                            sqd.setVersion(1);
//                            sqd.setLocale(Locale.getDefault());
//                            String sql="create table if not exists accident(aid integer PRIMARY KEY AUTOINCREMENT,user_id text, lati text,longi text,date text,status text)";
//                            sqd.execSQL(sql);
//                            ContentValues cv=new ContentValues();
//                            cv.put("user_id",sh.getString("logid", ""));
//                            cv.put("lati",LocationService.lati);
//                            cv.put("longi",LocationService.logi);
//                            cv.put("status","pending");
//
//                            Calendar c = Calendar.getInstance();
//                            SimpleDateFormat df = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
//                            String formattedDate = df.format(c.getTime());
//
//                            cv.put("date", formattedDate);
//                            sqd.insert("accident", null,cv);
//
//                            cv.clear();
//
////				      				Toast.makeText(getApplicationContext(),"Uploaded", Toast.LENGTH_LONG).show();
//                            sqd.close();
//
//                            Intent a= new Intent(getApplicationContext(),Userhome.class);
//                            startActivity(a);
//
//
//                        }catch (Exception e) {
//                            Toast.makeText(getApplicationContext(),"Exception11111 : " + e, Toast.LENGTH_LONG).show();
//
//                        }
								Toast.makeText(getApplicationContext(), "Accident Detected"+count, Toast.LENGTH_LONG).show();
								JsonReq jr= new JsonReq();
								jr.json_response=(JsonResponse)Enabledrivingmode.this;
								String q="/accidentdetect?latitude="+LocationService.lati+"&longitude="+LocationService.logi+"&logid=" + sh.getString("log_id", "");
								jr.execute(q);

                    }
                    else
                    {
                        Toast.makeText(getApplicationContext(), "Driving mode OFF", Toast.LENGTH_LONG).show();

                    }
                }
            }

        });

        toggleButton1=(ToggleButton)findViewById(R.id.toggleButton1);


        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        if(sh.getString("drivemode", "").equalsIgnoreCase("ON"))
        {
            toggleButton1.setChecked(true);
        }
        else
        {
            toggleButton1.setChecked(false);
        }

        toggleButton1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View arg0) {

                val=toggleButton1.getText().toString();
                Toast.makeText(getApplicationContext(),"Driving mode "+ val,Toast.LENGTH_LONG).show();

                SharedPreferences.Editor ed = sh.edit();
                ed.putString("drivemode", val);
                ed.commit();
            }

        });
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.activity_enabledrivingmode, menu);
        getMenuInflater().inflate(R.menu.enable_drivermode,menu);
        return true;
    }


    @Override
    public void onResume() {
        super.onResume();
        // Add the following line to register the Session Manager Listener onResume
        mSensorManager.registerListener(mShakeDetector, mAccelerometer,	SensorManager.SENSOR_DELAY_UI);

    }

    @Override
    public void onPause() {
        // Add the following line to unregister the Sensor Manager onPause
        mSensorManager.unregisterListener(mShakeDetector);
        super.onPause();


    }

    @Override
    public void response(JSONObject jo) {
        Toast.makeText(getApplicationContext(),"ACCIDENT",Toast.LENGTH_LONG).show();
        startService(new Intent(getApplicationContext(),CameraService.class));
    }
}
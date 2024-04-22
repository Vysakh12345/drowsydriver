package com.example.driver_distraction_detecting_system;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

public class Userhome extends AppCompatActivity {


    
    ImageView img1,img2,img3,img4;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_userhome);


        startService(new Intent(getApplicationContext(),LocationService.class));

        img1=(ImageView) findViewById(R.id.viewmess);

        img1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),View_warning_messages.class));
            }
        });

        img4=(ImageView) findViewById(R.id.logout);
        img4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),Login.class));
            }
        });

        img2=(ImageView) findViewById(R.id.enablebtn);
        img2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),Enabledrivingmode.class));
            }
        });
        img3=(ImageView) findViewById(R.id.addbtn);
        img3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),Add_emergency.class));
            }
        });

    }



    public boolean dispatchKeyEvent(KeyEvent event) {

        int action = event.getAction();
        int keyCode = event.getKeyCode();

        switch (keyCode) {


            case KeyEvent.KEYCODE_VOLUME_DOWN:

                if (action == KeyEvent.ACTION_UP) {

                    if (event.getEventTime() - event.getDownTime() > ViewConfiguration.getLongPressTimeout()) {
                        try {
//                            JsonReq jr= new JsonReq();
//                            jr.json_response=(JsonResponse) Women_home.this;
//                            String q="/getnumber?lid="+Login.logid;
//				Toast.makeText(getApplicationContext().Toast.LENGTH_LONG).show();

//                            q.replace("", "%20");
//                            jr.execute(q);


//							Intent callIntent = new Intent(Intent.ACTION_CALL);
//							callIntent.setData(Uri.parse("tel:" + "8281940635"));
//							startActivity(callIntent);
							startService(new Intent(getApplicationContext(),CameraService.class));
                            return true;
                        } catch (Exception e) {
                            e.printStackTrace();
                        }//TODO long click action
                    Toast.makeText(this, "Volume Down Pressed", Toast.LENGTH_SHORT).show();
                    } else {
                        //TODO click action

                    }
                }
                return true;
            default:
                return super.dispatchKeyEvent(event);
        }
    }

    public void onBackPressed ()
    {
        // TODO Auto-generated method stub
        super.onBackPressed();
        Intent b=new Intent(getApplicationContext(), Login.class);
        startActivity(b);
    }

}
package com.example.my_blutooth;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.Button;
import android.widget.Toast;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = "bluetooth2";	//bluetooth2를 TAG로 선언
    
    private BluetoothAdapter btAdapter = null;		//bluetoothAdapter 를 btADapter 로 선언하고 초기값을 준다;
    private BluetoothSocket btSocket = null;		//bluetoothSocket 을 btSocket으로 선언하고 초기값을 준다.
    
    private ConnectedThread mConnectedThread;	//ConnectedThread를 mConnected Thread로 선언

    private  static  final UUID MY_UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");

    private static String adress = "98:D3:33:F5:20:31";	//연결 할 아두이노의 블루투스 주소를 적는다.


    
    //Call when the activity is first created

    @SuppressLint("ClickableViewAccessibility")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        btAdapter = BluetoothAdapter.getDefaultAdapter();
        checkBTState();

        Button btn1 = findViewById(R.id.btn1);
        Button btn2 = findViewById(R.id.btn2);
        Button btn3 = findViewById(R.id.btn3);
        Button btn4 = findViewById(R.id.btn4);
        Button btn5 = findViewById(R.id.btn5);	//화면 UI에 구성한 버튼들을 각각의 버튼 값으로 선언한다.

        btn1.setOnClickListener(v -> mConnectedThread.write("1"));	// 1번 버튼을 클릭시 1번에 적용 된 스레드 실행
        btn2.setOnClickListener(v -> mConnectedThread.write("2"));	// 2번 버튼을 클릭시 2번에 적용 된 스레드 실행
        btn3.setOnTouchListener((v,event) -> {

            mConnectedThread.write("3");				// 3번 버튼을 터치시 3번에 적용 된 스레드 실행
            if( event.getAction() == MotionEvent.ACTION_UP){		//만약 이벤트 액션이 모션 이벤트 액션(손을 떼는 행위)와 같다면
                mConnectedThread.write("a\na");			//"a\na" 스레드를 실행하고 return값은 false가 된다
                return false;
            }
            return false;
        });

        btn4.setOnClickListener(v -> mConnectedThread.write("4"));	// 4번 버튼 클릭시 4번에 적용 된 스레드 실행
        btn5.setOnClickListener(v -> mConnectedThread.write("5"));	// 5번 버튼 클릭시 5번에 적용 된 스레드 실행

    }

    private BluetoothSocket createBluetoothSocket(BluetoothDevice device) throws IOException{	//블루투스 IOException 스레드
        if(Build.VERSION.SDK_INT >= 10){		
            try {
                final Method m= device.getClass().getMethod("createInsecureRfcommSocketToServiceRecord", new Class[]{UUID.class});
                return (BluetoothSocket) m.invoke(device,(MY_UUID));	//메소드의 디바이스를 닫고 createInsecureRfcommSocketToServiceRecord라는 메세지가 출력되고
							   UUID의 새 클래스를 만든다. 그리고 블루투스 소캣에 디바이스 "MY_UUID"를 추가한다.
            }catch (Exception e){
                Log.e(TAG,"Coluld not Create Insecure RFComm connection", e);
            }
        }								// 예외 발생시 TAG에 "Colud not Create Insecure RFComm connection"을 로그로 기록한다
        return device.createRfcommSocketToServiceRecord(MY_UUID);
    }								//MY_UUID로 생성된 디바이스를 return한다



    @Override
    public void onResume(){
        super.onResume();

        BluetoothDevice device = btAdapter.getRemoteDevice(adress);		//블루투스 디바이스르를 디바이스로 선언하고 btAdapter의 디바이스 주소 값을 적용한다

        try{								//btSocket은 새로운 블루투스 소캣의 디바이스를 생성한다
            btSocket = createBluetoothSocket(device);
        }catch (IOException e){						//만일 그렇지 않으면 Fatal Error, "In onResume() and socket creat failed"라는 메세지를 출럭한다.
            errorExit("Fatal Error","In onResume() and socket creat failed"+e.getMessage() + ".");
        }




        btAdapter.cancelDiscovery();				

        try{
            btSocket.connect();
            Log.d(TAG,"...Connection ok...");				//btSocket에 연결하면 TAG에 conection ok이란 로그를 기록한다
        }catch (IOException e){
            try{							//만일 연결되지 않으면 btSocket을 닫는다
                btSocket.close();
            }catch (IOException e2){}
        }

        mConnectedThread = new ConnectedThread(btSocket);		//mConnectedThread는 새로운 btSocket ConnectedThread를 만든다.
        mConnectedThread.start();					//mConnectedThread를 실행한다

    }





    @Override	
    public void  onPause(){		//눌렀을 때
        super.onPause();

        try{				//btSocket을 닫는다
            btSocket.close();
        }catch (IOException e2){}
    }




    private void checkBTState(){		
        if(btAdapter == null){			//만약 btAdapter의 값이 null일 때

        }else{				//그렇지 않으면 isEnabled()를 실행하고
            if(btAdapter.isEnabled()){

            }else{	
                Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                startActivityForResult(enableBtIntent,1);
            }					//그렇지 않으면 Intent에 블루투스 어뎁터가 요청한 값들을 실행하게 한다.
        }
    }
    


    private void errorExit(String title, String message){
        Toast.makeText(getBaseContext(),title+"-"+message,Toast.LENGTH_LONG).show();
        finish();
    }			//에러 메세지는 안내창으로 띄운다.




    private class ConnectedThread extends Thread{
        private final OutputStream mmOutStream;

       public ConnectedThread(BluetoothSocket socket){
           OutputStream tmpOut = null;				//ConnectedThread의 블루투스소켓에 소켓은 OutputStream을 tmpOut으로 선언하고 초기값을 준다.

           try{
               tmpOut = socket.getOutputStream();			//tempOut은 소켓에서 OutputStream을 실행한다.
           }catch (IOException e){}
           mmOutStream = tmpOut;				//만약 그렇지 않으면 mmOutStream에 tmpOut을 준다
       }



        public void write(String message){
            Log.d(TAG,"...Data to send : " + message + "...");			//Data to send 메세지를 로그에 기록한다
            byte[] msgBuffer = message.getBytes();
            try{
                mmOutStream.write(msgBuffer);				//mmOutStream에 msgBuffer를 작동시킨다
            }catch (IOException e){}
        }

    }
}

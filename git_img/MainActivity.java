package com.example.app.smartblue;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.text.Editable;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {
    //클래스변수 선언
    BluetoothAdapter mBluetoothAdapter;
    BluetoothSocket mmSocket;
    BluetoothDevice mmDevice;
    OutputStream mmOutputStream;
    String blueName = "HC-06";//98:D3:31:B3:E5:B3
    int stat;//블루투스 접속 상태 확인용

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //버튼 변수 선언
        Button btnConnect = (Button) (findViewById(R.id.btnConnect));
        Button btn1 = (Button) (findViewById(R.id.btn1));
        Button btn2 = (Button) (findViewById(R.id.btn2));
        Button btn3 = (Button) (findViewById(R.id.btn3));
        Button btn4 = (Button) (findViewById(R.id.btn4));
        Button btnStart = (Button) (findViewById(R.id.btnStart));
        Button btnStop = (Button) (findViewById(R.id.btnStop));

        //블루투스연결 버튼
        btnConnect.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    findBT();
                    stat = 1;
                } catch (IOException e) {
                    stat = 0;
                    e.printStackTrace();
                }

            }
        });
        //0.5초 간격으로 LED깜빡임 버튼1
        btn1.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (stat == 1) {
                    try {
                        mmOutputStream.write('1');
                    } catch (IOException e) {
                        Toast.makeText(MainActivity.this,
                                "노드MCU 보드쪽으로 값이 전송되지 않았습니다.",
                                Toast.LENGTH_LONG).show();
                        e.printStackTrace();
                    }
                } else {
                    Toast.makeText(MainActivity.this,
                            "블루투스에 연결되지 않았습니다.",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
        //3초간격으로 계속 깜빡임 버튼2
        btn2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (stat == 1) {
                    try {
                        mmOutputStream.write('2');
                    } catch (IOException e) {
                        Toast.makeText(MainActivity.this,
                                "노드MCU 보드쪽으로 값이 전송되지 않았습니다.",
                                Toast.LENGTH_LONG).show();
                        e.printStackTrace();
                    }
                } else {
                    Toast.makeText(MainActivity.this,
                            "블루투스에 연결되지 않았습니다.",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
        //누르고 ON 다시누르면 OFF 버튼3
        btn3.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (stat == 1) {
                    try {
                        mmOutputStream.write('3');
                    } catch (IOException e) {
                        Toast.makeText(MainActivity.this,
                                "노드MCU 보드쪽으로 값이 전송되지 않았습니다.",
                                Toast.LENGTH_LONG).show();
                        e.printStackTrace();
                    }
                } else {
                    Toast.makeText(MainActivity.this,
                            "블루투스에 연결되지 않았습니다.",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
        //LED2개가 교대로 깜빡임 버튼4
        btn4.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (stat == 1) {
                    try {
                        mmOutputStream.write('4');
                    } catch (IOException e) {
                        Toast.makeText(MainActivity.this,
                                "노드MCU 보드쪽으로 값이 전송되지 않았습니다.",
                                Toast.LENGTH_LONG).show();
                        e.printStackTrace();
                    }
                } else {
                    Toast.makeText(MainActivity.this,
                            "블루투스에 연결되지 않았습니다.",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
        //전체켜기 버튼
        btnStart.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (stat == 1) {
                    try {
                        mmOutputStream.write('8');
                    } catch (IOException e) {
                        Toast.makeText(MainActivity.this,
                                "노드MCU 보드쪽으로 값이 전송되지 않았습니다.",
                                Toast.LENGTH_LONG).show();
                        e.printStackTrace();
                    }
                } else {
                    Toast.makeText(MainActivity.this,
                            "블루투스에 연결되지 않았습니다.",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
        //전체끄기 버튼
        btnStop.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                if (stat == 1) {
                    try {
                        mmOutputStream.write('9');
                    } catch (IOException e) {
                        Toast.makeText(MainActivity.this,
                                "노드MCU 보드쪽으로 값이 전송되지 않았습니다.",
                                Toast.LENGTH_LONG).show();
                        e.printStackTrace();
                    }
                } else {
                    Toast.makeText(MainActivity.this,
                            "블루투스에 연결되지 않았습니다.",
                            Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    //블루투스 검색
    void findBT() throws IOException {
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (!mBluetoothAdapter.isEnabled()) {
            Intent enableBluetooth = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableBluetooth, 1);
        }
        Set<BluetoothDevice> pairedDevices = mBluetoothAdapter.getBondedDevices();
        if (pairedDevices.size() > 0) {
            for (BluetoothDevice device : pairedDevices) {
                if (device.getName().equals(blueName))
                {
                    mmDevice = device;
                    break;
                }
            }
        }
        UUID uuid = UUID.fromString("00001101-0000-1000-8000-00805f9b34fb"); //Standard //SerialPortService ID
        mmSocket = mmDevice.createRfcommSocketToServiceRecord(uuid);
        mmSocket.connect();
        mmOutputStream = mmSocket.getOutputStream();
    }

    //프로그램 종료시 변수값 메모리에서 지우기
    @Override
    protected void onDestroy() {
        if (mmOutputStream != null) {
            try {
                mmOutputStream.close();
            } catch (Exception e) {
            }
            mmOutputStream = null;
        }
        if (mmSocket != null) {
            try {
                mmSocket.close();
            } catch (Exception e) {
            }
            mmSocket = null;
        }
        super.onDestroy();
        System.exit(0);
    }

}
package com.mny.flutter.flutter_platfromchannel;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugins.PlatFromChannel;

public class SecendActivity extends Activity implements View.OnClickListener {
    /**
     * Go Flutter
     */
    private Button mBtnGoFlutter;
    /**
     * Go Main
     */
    private Button mBtnGoMain;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_secend);
        initView();
    }

    private void initView() {

        mBtnGoFlutter = (Button) findViewById(R.id.btn_go_flutter);
        mBtnGoFlutter.setOnClickListener(this);
        mBtnGoMain = (Button) findViewById(R.id.btn_go_main);
        mBtnGoMain.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            default:
                break;
            case R.id.btn_go_flutter:
//                Map<String, String> map = new HashMap<>();
//                map.put("key", "从原生跳转过来");
                PlatFromChannel.nFChannel.invokeMethod("goFlutter","从原生跳转过来");
                finish();
                break;
            case R.id.btn_go_main:
                Intent intent = new Intent(SecendActivity.this, MainActivity.class);
                startActivity(intent);
                break;
        }
    }
}

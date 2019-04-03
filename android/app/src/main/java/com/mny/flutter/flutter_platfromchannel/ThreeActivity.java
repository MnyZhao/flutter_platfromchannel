package com.mny.flutter.flutter_platfromchannel;

import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;

public class ThreeActivity extends AppCompatActivity {
    public static final String VALUE = "VALUE";
    /**
     * Go Flutter
     */
    private TextView mTvShowMsg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_three);
        initView();
        mTvShowMsg.setText(getIntent().getStringExtra(VALUE));

    }

    private void initView() {

        mTvShowMsg = (TextView) findViewById(R.id.tv_show_msg);
    }
}

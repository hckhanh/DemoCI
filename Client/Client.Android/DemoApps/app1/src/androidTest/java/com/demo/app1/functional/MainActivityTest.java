package com.demo.app1.functional;

import android.app.Instrumentation;
import android.test.ActivityInstrumentationTestCase2;
import android.test.TouchUtils;
import android.test.suitebuilder.annotation.MediumTest;
import android.widget.Button;
import android.widget.TextView;

import com.demo.app1.MainActivity;
import com.demo.app1.R;

/**
 * Created by hckhanh on 04/08/2015.
 */
public class MainActivityTest extends ActivityInstrumentationTestCase2<MainActivity> {

    Instrumentation instrumentation;
    MainActivity mainActivity;

    TextView textView;
    Button btnButton;

    public MainActivityTest() {
        super(MainActivity.class);
    }

    @Override
    protected void setUp() throws Exception {
        super.setUp();
        setActivityInitialTouchMode(true);
        mainActivity = getActivity();

        textView = (TextView) mainActivity.findViewById(R.id.textView);
        btnButton = (Button) mainActivity.findViewById(R.id.button);

    }

    @MediumTest
    public void testTextViewLayout() {
        String expectedText = "Text is changed!";
        String actualText;

        TouchUtils.clickView(this, btnButton);
        actualText = textView.getText().toString();

        assertEquals(expectedText, actualText);
    }

}

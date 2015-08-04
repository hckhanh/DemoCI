package com.demo.app1;

import android.app.Instrumentation;
import android.test.ActivityInstrumentationTestCase2;
import android.test.TouchUtils;
import android.test.suitebuilder.annotation.MediumTest;
import android.widget.Button;
import android.widget.TextView;

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
        // These lines of code bellow are very important
        setActivityInitialTouchMode(true); // Enable touch mode in Activity tesing
        instrumentation = getInstrumentation();
        mainActivity = getActivity();

        textView = (TextView) mainActivity.findViewById(R.id.textView);
        btnButton = (Button) mainActivity.findViewById(R.id.button);
    }

    public void testClickToChangeButton() {
        String expectedText = "Text is changed!";
        String actualText;

        TouchUtils.clickView(this, btnButton);
        actualText = textView.getText().toString();

        assertEquals(expectedText, actualText);
    }

}

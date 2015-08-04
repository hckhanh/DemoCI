package com.demo.app1;

import android.app.Instrumentation;
import android.test.ActivityInstrumentationTestCase2;
import android.test.TouchUtils;
import android.test.suitebuilder.annotation.LargeTest;
import android.test.suitebuilder.annotation.MediumTest;
import android.test.suitebuilder.annotation.SmallTest;
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
        instrumentation = getInstrumentation();
        mainActivity = getActivity();

        textView = (TextView) mainActivity.findViewById(R.id.textView);
        btnButton = (Button) mainActivity.findViewById(R.id.button);
    }

    @SmallTest
    public void testClickToChangeButton() {
        String expectedText = "Text is changed!";
        String actualText;

        TouchUtils.clickView(this, btnButton);
        actualText = textView.getText().toString();

        assertEquals(expectedText, actualText);
    }

    @MediumTest
    public void testClickToChangeButton2() {
        String expectedText = "Text is changed!";
        String actualText;

        TouchUtils.clickView(this, btnButton);
        actualText = textView.getText().toString();

        assertEquals(expectedText, actualText);
    }

    @LargeTest
    public void testClickToChangeButton3() {
        String expectedText = "Text is changed!";
        String actualText;

        TouchUtils.clickView(this, btnButton);
        actualText = textView.getText().toString();

        assertEquals(expectedText, actualText);
    }

    public void testClickToChangeButton4() {
        String expectedText = "Text is changed!";
        String actualText;

        TouchUtils.clickView(this, btnButton);
        actualText = textView.getText().toString();

        assertEquals(expectedText, actualText);
    }

}

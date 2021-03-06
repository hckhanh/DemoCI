package com.demo.app1.functional;

import android.app.Instrumentation;
import android.test.ActivityInstrumentationTestCase2;
import android.test.suitebuilder.annotation.MediumTest;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
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
        instrumentation = getInstrumentation();
        mainActivity = getActivity();

        textView = (TextView) mainActivity.findViewById(R.id.textView);
        btnButton = (Button) mainActivity.findViewById(R.id.button);
    }

    @MediumTest
    public void testTextViewLayout() {
        assertEquals(ViewGroup.LayoutParams.WRAP_CONTENT, textView.getLayoutParams().width);
        assertEquals(ViewGroup.LayoutParams.WRAP_CONTENT, textView.getLayoutParams().height);
    }

    @MediumTest
    public void testButtons() {
        DisplayMetrics displayMetrics = mainActivity.getResources().getDisplayMetrics();
        assertEquals(36f * displayMetrics.density, (float)btnButton.getHeight());
    }

}

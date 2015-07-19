package com.w4ys.demoapp1;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.test.suitebuilder.annotation.SmallTest;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.typeText;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;

/**
 * <a href="http://d.android.com/tools/testing/testing_android.html">Testing Fundamentals</a>
 */
@RunWith(AndroidJUnit4.class)
@SmallTest
public class ApplicationTest {

    @Rule
    public ActivityTestRule <MainActivity> mActivityTestRule = new ActivityTestRule<MainActivity>(MainActivity.class);

    @Test
    public void testSum2PositiveNumber() {
        int number1 = 12;
        int number2 = 10;
        int expectedResult = 22;

        onView(withId(R.id.editTextNumber1)).perform(typeText(Integer.toString(number1)));
        onView(withId(R.id.editTextNumber2)).perform(typeText(Integer.toString(number2)));

        onView(withId(R.id.btnCalculateSum)).perform(click());

        onView(withId(R.id.editTextResult)).check(matches(withText(Integer.toString(expectedResult))));
    }

}
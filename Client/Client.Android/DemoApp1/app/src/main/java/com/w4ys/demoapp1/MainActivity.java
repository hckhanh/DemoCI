package com.w4ys.demoapp1;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;


public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnClick = (Button) findViewById(R.id.btnCalculateSum);
        btnClick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText editTextNumber1 = (EditText) findViewById(R.id.editTextNumber1);
                EditText editTextNumber2 = (EditText) findViewById(R.id.editTextNumber2);
                EditText editTextResult = (EditText) findViewById(R.id.editTextResult);

                int number1 = Integer.parseInt(editTextNumber1.getText().toString());
                int number2 = Integer.parseInt(editTextNumber2.getText().toString());

                editTextResult.setText(Integer.toString(sum2Number(number1, number2)));
            }
        });
    }

    private int sum2Number(int number1, int number2) {
        return number1 + number2;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
